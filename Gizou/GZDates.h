//
//  GZDate.h
//  
//
//  Created by Maria Bernis on 05/03/15.
//
//

#import <Foundation/Foundation.h>

typedef enum {
    GZDatesRangeAWeek = 0,   // +- 3 days from reference date
    GZDatesRangeAMonth,      // +- 15 days from reference date
    GZDatesRangeAYear,       // +- 6 months from reference date
    GZDatesRangeFiveYears,   // +- 2.5 years from reference date
    GZDatesRangeADecade,     // +- 5 years from reference date
    GZDatesRangeHalfCentury, // +- 25 years from reference date
    GZDatesRangeACentury     // +- 50 years from reference date
}GZDatesRange;


/**
 *  Creates random dates.
 *
 *  All methods use Gregorian calendar.
 */
@interface GZDates : NSObject


///-----------------------------------------------
/// @name Using today as the reference date
///-----------------------------------------------

/**
*  Any date within a year around today's date.
*  This method invokes +dateInRange: passing GZDatesRangeAYear.
*
*  @return any date in range `today-6months,...,today+6moths`.
*/
+ (NSDate *)date;

/**
 *  Any date within the given GZDatesRange date period using today as the center of the range.
 *  Default implementation of +dateInRange:around: using today´s date as the reference.
 *
 *  @param within GZDatesRange date period. Can be from a week to a century.
 *
 *  @return any date in range `today-within/2,...,today+within/2`.
 *
 *  @see `dateInRange:around:`
 */
+ (NSDate *)dateInRange:(GZDatesRange)within;

/**
 *  Handy method for generating any date between today and the given days forward.
 *  This method invokes +daysFromNow passing the positive value of `days`.
 *
 *  @param days Number of days forward today. Unsigned.
 *
 *  @return any date in range `today,...,today+days`. Days is unsigned.
 *
 *  @see `daysFromNow`
 */
+ (NSDate *)daysForward:(NSUInteger)days;

/**
 *  Handy method for generating any date between today and the given days backwards.
 *  This method invokes +daysFromNow passing the negative value of `days`.
 *
 *  @param days Number of days backward today. Unsigned.
 *
 *  @return any date in range `today-days,...,today`. Days is unsigned.
 *
 *  @see `daysFromNow`
 */
+ (NSDate *)daysBackward:(NSUInteger)days;

/**
 *  Default implementation for +days:from: using current date as the reference.
 *
 *  @param days Number of days forward or backward today.
 *
 *  @return any date in range `today,...,today+days`. Days may be positive or negative.
 *
 *  @see `days:from:`
 */
+ (NSDate *)daysFromNow:(NSInteger)days;

/**
 *  Default implementation for +days:around: using current date as the reference.
 *
 *  @param days Number of days around today. Unsiged.
 *
 *  @return any date in range `today-days,...,today+days`.
 *
 *  @see `days:around:`
 */
+ (NSDate *)daysAroundNow:(NSInteger)days;

/**
 *  Default implementation of +birthdayForAgesBetween:and: with min age 18 and max age 65.
 *  Any date that someone could have today if it had to be at least 18 years old and could not be older than 65.
 *
 *  @return any date in range `today-65years,...,today-18years`.
 *
 *  @see `birthdayForAgesBetween:and:`
 */
+ (NSDate *)birthday; 

/**
 *  Any date that someone could have today if it had to be at least `minAge` years old and could not be older than `maxAge`.
 *
 *  @param minAge Minimum desired age that the returned date can represent with respect to today´s date.
 *  @param maxAge Maximum desired age that the returned date can represent with respect to today´s date.
 *
 *  @return any date in range `todaysDate-maxAge,...,todaysDate-minAge`.
 */
+ (NSDate *)birthdayForAgesBetween:(NSUInteger)minAge and:(NSUInteger)maxAge;


///-----------------------------------------------
/// @name Using custom reference date
///-----------------------------------------------

/**
 *  Any date within the given GZDatesRange date period using `referenceDate` as the center of the range.
 *
 *  @param within        GZDatesRange date period. Can be from a week to a century.
 *  @param referenceDate Center of the range of the returned possible values.
 *
 *  @return any date in range `referenceDate-within/2,...,referenceDate+within/2`.
 */
+ (NSDate *)dateInRange:(GZDatesRange)within around:(NSDate *)referenceDate;

/**
 *  Any date in between `referenceDate + days`. Days can be positive (days forward) or negative (days backward).
 *
 *  @param days          Number of days forward or backward the referenceDate.
 *  @param referenceDate Begining of the range for the returned possible values (or end of the range if days backward).
 *
 *  @return any date in range `referenceDate,...,referenceDate+days`. Days may be positive or negative.
 */
+ (NSDate *)days:(NSInteger)days from:(NSDate *)referenceDate;

/**
 *  Any date within the `referenceDate +- days` range.
 *
 *  @param days          Number of days around the referenceDate. Unsiged.
 *  @param referenceDate Center of the range of the returned possible values.
 *
 *  @return any date in range `referenceDate-days,...,referenceDate+days`
 */
+ (NSDate *)days:(NSUInteger)days around:(NSDate *)referenceDate;

/**
 *  Any date in between FROM and TO dates. FROM can be a date before TO or the other way around.
 *
 *  @param from Most old desired date that may be generated (or most recent).
 *  @param to   Most recent desired date that may be generated (or most old).
 *
 *  @return any date in the range [FROM, TO].
 */
+ (NSDate *)dateBetween:(NSDate *)from and:(NSDate *)to;

@end
