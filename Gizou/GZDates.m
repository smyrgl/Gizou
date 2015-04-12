//
//  GZDate.m
//  
//
//  Created by Maria Bernis on 05/03/15.
//
//

#import "GZDates.h"
#import "GZNumbers.h"

@implementation GZDates


#pragma mark - Defaults

# pragma mark Dates

+ (NSDate *)date
{
    NSDate *today = [self _todayTest] ?: [NSDate date];
    return [self dateInRange:GZDatesRangeAWeek around:today];
}

+ (NSDate *)dateInRange:(GZDatesRange)within
{
    NSDate *today = [self _todayTest] ?: [NSDate date];
    return [self dateInRange:within around:today];
}

+ (NSDate *)daysForward:(NSUInteger)days
{
    return [self daysFromNow:days];
}

+ (NSDate *)daysBackward:(NSUInteger)days
{
    return [self daysFromNow:-days];
}

+ (NSDate *)daysFromNow:(NSInteger)days
{
    NSDate *today = [self _todayTest] ?: [NSDate date];
    return [self days:days from:today];
}

+ (NSDate *)daysAroundNow:(NSInteger)days
{
    NSDate *today = [self _todayTest] ?: [NSDate date];
    return [self days:days around:today];
}


# pragma mark Birthday

+ (NSDate *)birthday
{
    return [self birthdayForAgesBetween:18 and:65];
}

+ (NSDate *)birthdayForAgesBetween:(NSUInteger)minAge and:(NSUInteger)maxAge
{
    NSDate *today = [NSDate date];
    NSCalendar *calendar = [self _calendar];
    NSDateComponents *fromComponents = [NSDateComponents new];
    NSDateComponents *toComponents = [NSDateComponents new];
    
    fromComponents.year = -maxAge;
    toComponents.year = -minAge;
    
    NSDate *from = [calendar dateByAddingComponents:fromComponents toDate:today options:0];
    NSDate *to = [calendar dateByAddingComponents:toComponents toDate:today options:0];
    return [self dateBetween:from and:to];
}


#pragma mark - Custom reference date

+ (NSDate *)dateInRange:(GZDatesRange)within around:(NSDate *)referenceDate
{
    NSUInteger daysRange = 0;
    switch (within) {
        case GZDatesRangeAWeek:
            daysRange = 3;
            break;
            
        case GZDatesRangeAMonth:
            daysRange = 15;
            break;
            
        case GZDatesRangeAYear:
            daysRange = 6 * 30;
            break;
            
        case GZDatesRangeFiveYears:
            daysRange = 30 * 30;
            break;
            
        case GZDatesRangeADecade:
            daysRange = 5 * 365;
            break;
            
        case GZDatesRangeHalfCentury:
            daysRange = 25 * 365;
            break;
            
        case GZDatesRangeACentury:
            daysRange = 50 * 365;
            break;
            
        default:
            break;
    }
    
    return [self days:daysRange around:referenceDate];
}

+ (NSDate *)days:(NSInteger)days from:(NSDate *)referenceDate
{
    NSInteger s = signbit(days) == 0 ? 1 : -1;
    NSCalendar *calendar = [self _calendar];
    NSDateComponents *fromComponents = [NSDateComponents new];
    NSDateComponents *toComponents = [NSDateComponents new];
    
    fromComponents.day = s;
    toComponents.day = s*(abs(days) - 1);
    
    NSDate *from = [calendar dateByAddingComponents:fromComponents toDate:referenceDate options:0];
    NSDate *to = [calendar dateByAddingComponents:toComponents toDate:from options:0];
    return [self dateBetween:from and:to];
}

+ (NSDate *)days:(NSUInteger)days around:(NSDate *)referenceDate
{
    NSCalendar *calendar = [self _calendar];
    NSDateComponents *fromComponents = [NSDateComponents new];
    NSDateComponents *toComponents = [NSDateComponents new];
    
    fromComponents.day = -days;
    toComponents.day = days;
    
    NSDate *from = [calendar dateByAddingComponents:fromComponents toDate:referenceDate options:0];
    NSDate *to = [calendar dateByAddingComponents:toComponents toDate:referenceDate options:0];
    return [self dateBetween:from and:to];
}

+ (NSDate *)dateBetween:(NSDate *)from and:(NSDate *)to
{
    NSTimeInterval diff = to.timeIntervalSince1970 - from.timeIntervalSince1970;
    NSNumber *randomInterval = [GZNumbers floatBetween:(float)diff and:0.0];
    return [NSDate dateWithTimeInterval:randomInterval.doubleValue sinceDate:from];
}


#pragma mark - Private helpers

+ (NSDate *)_todayTest
{
    return nil;
}

+ (NSCalendar *)_calendar
{
    return [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
}

@end
