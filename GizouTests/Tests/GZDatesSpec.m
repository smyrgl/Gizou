//
//  GZDate.m
//  GizouTests
//
//  Created by Maria Bernis on 05/03/15.
//
//

#import "GZTests.h"
#import "GZDates.h"

@interface GZDates ()
+ (NSCalendar *)_calendar;
@end


@interface GZDatesTests : GZDates
+ (NSDate *)_todayTest;
@end

@implementation GZDatesTests

+ (NSCountedSet *)test_datesSetOfSize:(NSUInteger)size using:(NSDate *(^)(void))block
{
    NSMutableArray *randomDates = [NSMutableArray array];
    for (NSUInteger i = 0; i < size; i++) {
        NSDate *d = block();
        [randomDates addObject:d];
    }
    return [[NSCountedSet alloc] initWithArray:randomDates];
}

+ (NSArray *)test_datesArrayOfSize:(NSUInteger)size using:(NSDate *(^)(void))block
{
    NSMutableArray *randomDates = [NSMutableArray array];
    for (NSUInteger i = 0; i < size; i++) {
        NSDate *d = block();
        [randomDates addObject:d];
    }
    return randomDates;
}

+ (NSCountedSet *)test_dateComponentsWithDates:(NSArray *)dates calendar:(NSCalendar *)calendar units:(NSCalendarUnit)units
{
    NSMutableArray *components = [NSMutableArray array];
    for (NSDate *date in dates) {
        NSDateComponents *c = [calendar components:units fromDate:date];
        [components addObject:c];
    }
    return [[NSCountedSet alloc] initWithArray:components];
}

+ (NSDate *)_todayTest
{
    return [NSDate dateWithTimeIntervalSince1970:1426417817.000];
}

@end


SpecBegin(GZDates)

describe(@"+dateBetween:from and:to", ^{
    __block NSUInteger total;
    __block NSDate *from;
    __block NSDate *to;
    __block NSCountedSet *differentDates;
    beforeAll(^{
        total = 100;
        from = [NSDate dateWithTimeIntervalSince1970:1425462377.000]; // 4/3/2015, 10:46:17 AM
        to = [NSDate dateWithTimeIntervalSince1970:1425462437.000]; // 4/3/2015, 10:47:17 AM
        differentDates = [GZDatesTests test_datesSetOfSize:total using:^NSDate *{
            return [GZDatesTests dateBetween:from and:to];
        }];
    });
    
    it(@"returns date objects", ^{
        expect([differentDates anyObject]).to.beKindOf([NSDate class]);
    });
    it(@"returns different values", ^{
        expect(differentDates.count).to.beGreaterThan(0.99*total);
    });
    it(@"doesn't return values out of the [FROM, TO] range", ^{
        NSSet *inRange = [differentDates filteredSetUsingPredicate:[NSPredicate predicateWithFormat:@"(SELF >= %@) AND (SELF <= %@)", from, to]];
        expect(inRange).to.haveCountOf(differentDates.count);
    });
});

describe(@"days:+-3 from:now", ^{
    __block NSUInteger total;
    __block NSCalendar *calendar;
    __block NSCalendarUnit calendarUnits;
    __block NSDate *referenceDate;
    __block NSCountedSet *differentDates;
    __block NSCountedSet *differentDays;
    __block NSDateComponents *referenceDateComps;
    beforeAll(^{
        total = 100;
        calendar = [GZDatesTests _calendar];
        calendarUnits = (NSDayCalendarUnit);
        referenceDate = [GZDatesTests _todayTest];
        referenceDateComps = [calendar components:calendarUnits fromDate:referenceDate];
    });
    
    context(@"when days is positive", ^{
        beforeAll(^{
            NSArray *randomDates = [GZDatesTests test_datesArrayOfSize:total using:^NSDate *{
                return [GZDatesTests days:3 from:referenceDate];
            }];
            
            differentDates = [[NSCountedSet alloc] initWithArray:randomDates];
            differentDays = [GZDatesTests test_dateComponentsWithDates:randomDates calendar:calendar units:calendarUnits];
        });
        
        it(@"returns different values", ^{
            expect(differentDates.count).to.beGreaterThan(0.99*total);
        });
        it(@"returns three different days dates", ^{
            expect(differentDays).to.haveCountOf(3);
        });
        it(@"returns dates starting tomorrow up to 3 days after tomorrow", ^{
            expect([differentDays objectsPassingTest:^BOOL(id obj, BOOL *stop) {
                NSDateComponents *c = (NSDateComponents *)obj;
                return c.day == referenceDateComps.day + 1;
            }]).to.haveCountOf(1);
            expect([differentDays objectsPassingTest:^BOOL(id obj, BOOL *stop) {
                NSDateComponents *c = (NSDateComponents *)obj;
                return c.day == referenceDateComps.day + 2;
            }]).to.haveCountOf(1);
            expect([differentDays objectsPassingTest:^BOOL(id obj, BOOL *stop) {
                NSDateComponents *c = (NSDateComponents *)obj;
                return c.day == referenceDateComps.day + 3;
            }]).to.haveCountOf(1);
        });
    });
    
    context(@"when days is negative", ^{
        beforeAll(^{
            NSArray *randomDates = [GZDatesTests test_datesArrayOfSize:total using:^NSDate *{
                return [GZDatesTests days:-3 from:referenceDate];
            }];
            
            differentDates = [[NSCountedSet alloc] initWithArray:randomDates];
            differentDays = [GZDatesTests test_dateComponentsWithDates:randomDates calendar:calendar units:calendarUnits];
        });
        
        it(@"returns different values", ^{
            expect(differentDates.count).to.beGreaterThan(0.99*total);
        });
        it(@"returns three different days dates", ^{
            expect(differentDays).to.haveCountOf(3);
        });
        it(@"returns dates starting 3 days ago up to yesterday", ^{
            expect([differentDays objectsPassingTest:^BOOL(id obj, BOOL *stop) {
                NSDateComponents *c = (NSDateComponents *)obj;
                return c.day == referenceDateComps.day - 1;
            }]).to.haveCountOf(1);
            expect([differentDays objectsPassingTest:^BOOL(id obj, BOOL *stop) {
                NSDateComponents *c = (NSDateComponents *)obj;
                return c.day == referenceDateComps.day - 2;
            }]).to.haveCountOf(1);
            expect([differentDays objectsPassingTest:^BOOL(id obj, BOOL *stop) {
                NSDateComponents *c = (NSDateComponents *)obj;
                return c.day == referenceDateComps.day - 3;
            }]).to.haveCountOf(1);
        });
    });
});

describe(@"days:around:", ^{
    __block NSUInteger total;
    __block NSCalendar *calendar;
    __block NSCalendarUnit calendarUnits;
    __block NSDate *referenceDate;
    __block NSCountedSet *differentDates;
    __block NSDateComponents *referenceDateComps;
    beforeAll(^{
        calendar = [GZDatesTests _calendar];
        referenceDate = [GZDatesTests _todayTest];
    });
    
    context(@"when ranging 1 day", ^{
        __block NSCountedSet *differentDays;
        beforeAll(^{
            total = 1000;
            calendarUnits = (NSDayCalendarUnit);
            NSArray *randomDates = [GZDatesTests test_datesArrayOfSize:total using:^NSDate *{
                return [GZDatesTests days:1 around:referenceDate];
            }];
            
            differentDates = [[NSCountedSet alloc] initWithArray:randomDates];
            differentDays = [GZDatesTests test_dateComponentsWithDates:randomDates calendar:calendar units:calendarUnits];
            referenceDateComps = [calendar components:calendarUnits fromDate:referenceDate];
        });
        
        it(@"returns different values", ^{
            expect(differentDates.count).to.beGreaterThan(0.99*total);
        });
        it(@"returns 3 different days dates", ^{
            expect(differentDays).to.haveCountOf(3);
        });
        it(@"doesn't return dates 2 days before reference day", ^{
            expect([differentDays objectsPassingTest:^BOOL(id obj, BOOL *stop) {
                NSDateComponents *c = (NSDateComponents *)obj;
                return c.day <= referenceDateComps.day - 2;
            }]).to.haveCountOf(0);
        });
        it(@"doesn't return dates 2 days after reference day", ^{
            expect([differentDays objectsPassingTest:^BOOL(id obj, BOOL *stop) {
                NSDateComponents *c = (NSDateComponents *)obj;
                return c.day >= referenceDateComps.day + 2;
            }]).to.haveCountOf(0);
        });
    });
    
    context(@"when ranging 500 days", ^{
        __block NSCountedSet *differentDays;
        beforeAll(^{
            total = 10000;
            calendarUnits = (NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit);
            NSArray *randomDates = [GZDatesTests test_datesArrayOfSize:total using:^NSDate *{
                return [GZDatesTests days:500 around:referenceDate];
            }];
            
            differentDates = [[NSCountedSet alloc] initWithArray:randomDates];
            differentDays = [GZDatesTests test_dateComponentsWithDates:randomDates calendar:calendar units:calendarUnits];
            referenceDateComps = [calendar components:calendarUnits fromDate:referenceDate];
        });
        
        it(@"returns different values", ^{
            expect(differentDates.count).to.beGreaterThan(0.99*total);
        });
        it(@"returns 1000 different days dates or 1001 max", ^{
            expect(differentDays.count).to.beInTheRangeOf(1000, 1001);
        });
        it(@"doesn't return dates 501 days before reference day", ^{
            expect([differentDays objectsPassingTest:^BOOL(id obj, BOOL *stop) {
                NSDateComponents *c = (NSDateComponents *)obj;
                return c.day <= referenceDateComps.day - 501;
            }]).to.haveCountOf(0);
        });
        it(@"doesn't return dates 501 days after reference day", ^{
            expect([differentDays objectsPassingTest:^BOOL(id obj, BOOL *stop) {
                NSDateComponents *c = (NSDateComponents *)obj;
                return c.day >= referenceDateComps.day + 501;
            }]).to.haveCountOf(0);
        });
    });
});

describe(@"birthdayForAgesBetween:and", ^{
    __block NSUInteger total;
    __block NSUInteger minAge;
    __block NSUInteger maxAge;
    __block NSCalendarUnit calendarUnits;
    __block NSDate *referenceDate;
    __block NSDateComponents *referenceDateComps;
    __block NSCountedSet *differentDates;
    __block NSCountedSet *differentYears;
    beforeAll(^{
        total = 1000;
        minAge = 3;
        maxAge = 6;
        NSCalendar *calendar = [GZDatesTests _calendar];
        calendarUnits = (NSYearCalendarUnit);
        referenceDate = [GZDatesTests _todayTest];
        referenceDateComps = [calendar components:calendarUnits fromDate:referenceDate];
        NSArray *randomDates = [GZDatesTests test_datesArrayOfSize:total using:^NSDate *{
            return [GZDatesTests birthdayForAgesBetween:minAge and:maxAge];
        }];
        
        differentDates = [[NSCountedSet alloc] initWithArray:randomDates];
        differentYears = [GZDatesTests test_dateComponentsWithDates:randomDates calendar:calendar units:calendarUnits];
    });
    
    it(@"returns different values", ^{
        expect(differentDates.count).to.beGreaterThan(0.99*total);
    });
    it(@"returns 4 or 5 different years dates", ^{
        expect(differentYears.count).to.beInTheRangeOf(4, 5);
    });
    it(@"birthday cannot represent olther than 6 years", ^{
        expect([differentYears objectsPassingTest:^BOOL(id obj, BOOL *stop) {
            NSDateComponents *c = (NSDateComponents *)obj;
            return c.year < referenceDateComps.year - maxAge;
        }]).to.haveCountOf(0);
    });
    it(@"birthday cannot represent younger than 3 years", ^{
        expect([differentYears objectsPassingTest:^BOOL(id obj, BOOL *stop) {
            NSDateComponents *c = (NSDateComponents *)obj;
            return c.year > referenceDateComps.year - minAge;
        }]).to.haveCountOf(0);
    });
});


describe(@"dateInRange:around:", ^{
    __block NSUInteger total;
    __block NSCalendar *calendar;
    __block NSCalendarUnit calendarUnits;
    __block NSDate *referenceDate;
    __block NSCountedSet *differentDates;
    __block NSDateComponents *referenceDateComps;
    beforeAll(^{
        calendar = [GZDatesTests _calendar];
        referenceDate = [GZDatesTests _todayTest];
    });
    
    context(@"when ranging a week", ^{
        __block NSCountedSet *differentDays;
        beforeAll(^{
            total = 100;
            calendarUnits = (NSDayCalendarUnit);
            NSArray *randomDates = [GZDatesTests test_datesArrayOfSize:total using:^NSDate *{
                return [GZDatesTests dateInRange:GZDatesRangeAWeek around:referenceDate];
            }];
            
            differentDates = [[NSCountedSet alloc] initWithArray:randomDates];
            differentDays = [GZDatesTests test_dateComponentsWithDates:randomDates calendar:calendar units:calendarUnits];
            referenceDateComps = [calendar components:calendarUnits fromDate:referenceDate];
        });
        
        it(@"returns different values", ^{
            expect(differentDates.count).to.beGreaterThan(0.99*total);
        });
        it(@"returns 7 different days dates", ^{
            expect(differentDays).to.haveCountOf(7);
        });
        it(@"doesn't return dates 4 days before reference day", ^{
            expect([differentDays objectsPassingTest:^BOOL(id obj, BOOL *stop) {
                NSDateComponents *c = (NSDateComponents *)obj;
                return c.day == referenceDateComps.day - 4;
            }]).to.haveCountOf(0);
        });
        it(@"doesn't return dates 4 days after reference day", ^{
            expect([differentDays objectsPassingTest:^BOOL(id obj, BOOL *stop) {
                NSDateComponents *c = (NSDateComponents *)obj;
                return c.day == referenceDateComps.day + 4;
            }]).to.haveCountOf(0);
        });
    });
    
    context(@"when ranging a month", ^{
        __block NSCountedSet *differentDays;
        beforeAll(^{
            total = 1000;
            calendarUnits = (NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit);
            NSArray *randomDates = [GZDatesTests test_datesArrayOfSize:total using:^NSDate *{
                return [GZDatesTests dateInRange:GZDatesRangeAMonth around:referenceDate];
            }];
            
            differentDates = [[NSCountedSet alloc] initWithArray:randomDates];
            differentDays = [GZDatesTests test_dateComponentsWithDates:randomDates calendar:calendar units:calendarUnits];
            referenceDateComps = [calendar components:calendarUnits fromDate:referenceDate];
        });
        
        it(@"returns different values", ^{
            expect(differentDates.count).to.beGreaterThan(0.99*total);
        });
        it(@"returns 30 or 31 different days dates", ^{
            expect(differentDays.count).to.beInTheRangeOf(30, 31);
        });
        it(@"return dates within the same month", ^{
            expect([differentDays objectsPassingTest:^BOOL(id obj, BOOL *stop) {
                NSDateComponents *c = (NSDateComponents *)obj;
                return c.month == referenceDateComps.month && c.year == referenceDateComps.year;
            }]).to.haveCountOf(30);
        });
    });
    
    context(@"when ranging a year", ^{
        __block NSCountedSet *differentMonths;
        beforeAll(^{
            total = 1000;
            referenceDate = [NSDate dateWithTimeIntervalSince1970:1435831199.000]; // 2 JUL 12:00 (midyear day)
            calendarUnits = (NSMonthCalendarUnit|NSYearCalendarUnit);
            NSArray *randomDates = [GZDatesTests test_datesArrayOfSize:total using:^NSDate *{
                return [GZDatesTests dateInRange:GZDatesRangeAYear around:referenceDate];
            }];
            
            differentDates = [[NSCountedSet alloc] initWithArray:randomDates];
            differentMonths = [GZDatesTests test_dateComponentsWithDates:randomDates calendar:calendar units:calendarUnits];
            referenceDateComps = [calendar components:calendarUnits fromDate:referenceDate];
        });
        afterAll(^{
            referenceDate = [GZDatesTests _todayTest];
        });
        
        it(@"returns different values", ^{
            expect(differentDates.count).to.beGreaterThan(0.99*total);
        });
        it(@"returns 13 different months dates max", ^{
            // May be 13 with very few dates hitting 2016 (first day)
            expect(differentMonths.count).to.beInTheRangeOf(12, 13);
        });
        it(@"returns dates within the same year", ^{
            expect([differentMonths objectsPassingTest:^BOOL(id obj, BOOL *stop) {
                NSDateComponents *c = (NSDateComponents *)obj;
                return c.year == referenceDateComps.year;
            }]).to.haveCountOf(12);
            
            // Just a few values hit 2016
            NSSet *nextYearDates = [differentDates objectsPassingTest:^BOOL(id obj, BOOL *stop) {
                NSDate *d = (NSDate *)obj;
                return d.timeIntervalSince1970 > 1451602799.000; // 31/12/2015 23:59:59
            }];
            expect(nextYearDates.count).to.beLessThan(0.05*total);
        });
    });
    
    context(@"when ranging 5 years", ^{
        __block NSCountedSet *differentMonths;
        beforeAll(^{
            total = 1000;
            referenceDate = [GZDatesTests _todayTest];
            calendarUnits = (NSMonthCalendarUnit|NSYearCalendarUnit);
            NSArray *randomDates = [GZDatesTests test_datesArrayOfSize:total using:^NSDate *{
                return [GZDatesTests dateInRange:GZDatesRangeFiveYears around:referenceDate];
            }];
            
            differentDates = [[NSCountedSet alloc] initWithArray:randomDates];
            differentMonths = [GZDatesTests test_dateComponentsWithDates:randomDates calendar:calendar units:calendarUnits];
            referenceDateComps = [calendar components:calendarUnits fromDate:referenceDate];
        });
        afterAll(^{
            referenceDate = [GZDatesTests _todayTest];
        });
        
        it(@"returns different values", ^{
            expect(differentDates.count).to.beGreaterThan(0.99*total);
        });
        it(@"returns 5 different years dates", ^{
            // Counting months so 12*5. +1 because few dates may hit the 31st month past referenceDate.
            expect(differentMonths.count).to.beInTheRangeOf(59, 61);
        });
        it(@"doesn't return dates 31 months before ref date", ^{
            expect([differentMonths objectsPassingTest:^BOOL(id obj, BOOL *stop) {
                NSDateComponents *c = (NSDateComponents *)obj;
                return c.year == referenceDateComps.year - 2 + c.month < referenceDateComps.month + 6;
            }]).to.haveCountOf(0);
        });
        it(@"doesn't return dates 32 month after ref date", ^{
            expect([differentMonths objectsPassingTest:^BOOL(id obj, BOOL *stop) {
                NSDateComponents *c = (NSDateComponents *)obj;
                return c.year == referenceDateComps.year + 2 && c.month > referenceDateComps.month + 6;
            }]).to.haveCountOf(0);
        });
    });
    
    context(@"when ranging a decade", ^{
        __block NSCountedSet *differentYears;
        beforeAll(^{
            total = 1000;
            referenceDate = [GZDatesTests _todayTest];
            calendarUnits = (NSYearCalendarUnit);
            NSArray *randomDates = [GZDatesTests test_datesArrayOfSize:total using:^NSDate *{
                return [GZDatesTests dateInRange:GZDatesRangeADecade around:referenceDate];
            }];
            
            differentDates = [[NSCountedSet alloc] initWithArray:randomDates];
            differentYears = [GZDatesTests test_dateComponentsWithDates:randomDates calendar:calendar units:calendarUnits];
            referenceDateComps = [calendar components:calendarUnits fromDate:referenceDate];
        });
        afterAll(^{
            referenceDate = [GZDatesTests _todayTest];
        });
        
        it(@"returns different values", ^{
            expect(differentDates.count).to.beGreaterThan(0.99*total);
        });
        it(@"returns 11 different years dates max", ^{
            // +1 because few dates may hit past the 5 years above referenceDate (1st days in the 6th year).
            expect(differentYears.count).to.beInTheRangeOf(10, 11);
        });
        it(@"returns dates +-5 years around ref date", ^{
            expect([differentYears objectsPassingTest:^BOOL(id obj, BOOL *stop) {
                NSDateComponents *c = (NSDateComponents *)obj;
                return c.year < referenceDateComps.year - 5 || c.year > referenceDateComps.year + 5;
            }]).to.haveCountOf(0);
        });
    });
    
    context(@"when ranging half century", ^{
        __block NSCountedSet *differentYears;
        beforeAll(^{
            total = 1000;
            calendarUnits = (NSYearCalendarUnit);
            NSArray *randomDates = [GZDatesTests test_datesArrayOfSize:total using:^NSDate *{
                return [GZDatesTests dateInRange:GZDatesRangeHalfCentury around:referenceDate];
            }];
            
            differentDates = [[NSCountedSet alloc] initWithArray:randomDates];
            differentYears = [GZDatesTests test_dateComponentsWithDates:randomDates calendar:calendar units:calendarUnits];
            referenceDateComps = [calendar components:calendarUnits fromDate:referenceDate];
        });
        
        it(@"returns different values", ^{
            expect(differentDates.count).to.beGreaterThan(0.99*total);
        });
        it(@"returns 51 different years dates max", ^{
            // +1 because few dates may hit past the 25 years above referenceDate (1st days in the 26th year).
            expect(differentYears.count).to.beInTheRangeOf(50, 51);
        });
        it(@"returns dates +-25 years around ref date", ^{
            expect([differentYears objectsPassingTest:^BOOL(id obj, BOOL *stop) {
                NSDateComponents *c = (NSDateComponents *)obj;
                return c.year < referenceDateComps.year - 25 || c.year > referenceDateComps.year + 25;
            }]).to.haveCountOf(0);
        });
    });
    
    context(@"when ranging a century", ^{
        __block NSCountedSet *differentYears;
        beforeAll(^{
            total = 1000;
            calendarUnits = (NSYearCalendarUnit);
            NSArray *randomDates = [GZDatesTests test_datesArrayOfSize:total using:^NSDate *{
                return [GZDatesTests dateInRange:GZDatesRangeACentury around:referenceDate];
            }];
            
            differentDates = [[NSCountedSet alloc] initWithArray:randomDates];
            differentYears = [GZDatesTests test_dateComponentsWithDates:randomDates calendar:calendar units:calendarUnits];
            referenceDateComps = [calendar components:calendarUnits fromDate:referenceDate];
        });
        
        it(@"returns different values", ^{
            expect(differentDates.count).to.beGreaterThan(0.99*total);
        });
        it(@"returns 101 different years dates max", ^{
            // +1 because few dates may hit past the 50 years above referenceDate (1st days in the 51th year).
            expect(differentYears.count).to.beInTheRangeOf(100, 101);
        });
        it(@"returns dates +-50 years around ref date", ^{
            expect([differentYears objectsPassingTest:^BOOL(id obj, BOOL *stop) {
                NSDateComponents *c = (NSDateComponents *)obj;
                return c.year < referenceDateComps.year - 50 || c.year > referenceDateComps.year + 50;
            }]).to.haveCountOf(0);
        });
    });
});


SpecEnd
