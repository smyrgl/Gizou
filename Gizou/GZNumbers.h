//
//  GZNumbers.h
//
//  Created by Maria Bernis on 20/02/15.
//

#import <Foundation/Foundation.h>

/**
 *  Creates random numbers and bool objects.
 */
@interface GZNumbers : NSObject

@end


@interface GZNumbers (Booleans)

/**
 *  Any boolean number.
 *
 *  @return YES, NO
 */
+ (NSNumber *)yesOrNo;

/**
 *  Any boolean number, but most of the times `m` value. 
 *
 *  @param m Predominant bool value
 *
 *  @return YES, NO with `mostly` value more than 80% of the times.
 */
+ (NSNumber *)yesOrNoMostly:(BOOL)m;

@end


@interface GZNumbers (NaturalNumbers)

/**
 *  Any natural number including 0 (ie. unsigned integers).
 *
 *  @return 0,1,2,...,INT32_MAX-1
 */
+ (NSNumber *)integerN;

/**
 *  Any natural number excluding 0.
 *
 *  @return 1,2,...,INT32_MAX
 */
+ (NSNumber *)integerNNonZero;

/**
 *  Any natural number from 0 to MAX.
 *  This method invokes `integerBetween:0 and:MAX`.
 *
 *  @param max Maximum desired value that may be generated.
 *
 *  @return 0,1,...,MAX
 *
 *  @see `integerBetween:and:`
 */
+ (NSNumber *)integerNLessOrEqual:(u_int32_t)max;

@end


@interface GZNumbers (ZNumbers)

/**
 *  Any integer number negative, positive or 0.
 *  This method invokes `integerBetween:-INT32_MAX and:INT32_MAX`.
 *  Limit in range is INT32_MAX on both sides +-.
 *
 *  @return ..,-2,-1,0,1,2,...
 *
 *  @see `integerBetween:and:`
 */
+ (NSNumber *)integerZ;

/**
 *  Any integer number excluding 0.
 *
 *  @return ..,-2,-1,1,2,...
 */
+ (NSNumber *)integerZNonZero;

/**
 *  Any integer number from -INT32_MAX to MAX.
 *  This method invokes `integerBetween:-INT32_MAX and:MAX`.
 *
 *  @param max Maximum desired value that may be generated.
 *
 *  @return ...,-2,-1,0,1,...,MAX
 *
 *  @see `integerBetween:and:`
 */
+ (NSNumber *)integerZLessOrEqual:(NSInteger)max;

/**
 *  Any integer number from MIN to INT32_MAX.
 *  This method invokes `integerBetween:MIN and:INT32_MAX`.
 *
 *  @param min Minimum desired value that may be generated.
 *
 *  @return MIN,MIN+1,MIN+2,...,INT32_MAX
 *
 *  @see `integerBetween:and:`
 */
+ (NSNumber *)integerBiggerOrEqual:(NSInteger)min;

/**
 *  Any integer number from MIN to MAX. If MIN is bigger than MAX, it returns numbers in the range MAX, MAX+1,...,MIN.
 *
 *  @param min Minimum desired value that may be generated.
 *  @param max Maximum desired value that may be generated.
 *
 *  @return MIN,MIN+1,MIN+2,...,MAX
 *
 *  @discussion MIN and MAX must be integers with absolute value less than INT32_MAX. If not, values can be overflown and lead to unexpected results.
 *  If MIN is bigger than MAX, it returns numbers in the range MAX, MAX+1,..., MIN.
 */
+ (NSNumber *)integerBetween:(NSInteger)min and:(NSInteger)max;

/**
 *  Any negative integer number or 0.
 *  This method invokes `integerBetween:INT32_MAX and:0`.
 *
 *  @return ...,-2,-1,0
 *
 *  @see `integerBetween:and:`
 */
+ (NSNumber *)negativeInteger;

/**
 *  Any negative integer excluding 0.
 *  This method invokes `integerBetween:INT32_MAX and:-1`.
 *
 *  @return ...,-2,-1
 *
 *  @see `integerBetween:and:`
 */
+ (NSNumber *)negativeIntegerNonZero;


///--------------------------------
//  @name Asymmetric integer numbers
///--------------------------------

/**
 *  Any integer number from MIN to MAX with predominant value MANY and/or scarce value FEW if provided. Both MANY and FEW are optional parameters and if specified have to be in the [MIN, MAX] range. If specifing both, they must be different.
 *
 *  @param min Minimum desired value that may be generated.
 *  @param max Maximum desired value that may be generated.
 *  @param m   Number with the desired integer to be predominant. Can be nil. If not nil, must be in the range [MIN, MAX].
 *  @param f   Number with the desired integer to be scarce. Can be nil. If not nil, must be in the range [MIN, MAX].
 *
 *  @return MIN,MIN+1,MIN+2,...,MAX with `MANY` value returning with high probability and FEW with low probability (exact distribution varies depending on the range).
 *
 *  @discussion Same integer limits apply as in `integerBetween:and`
 *
 *  @see `integerBetween:and:`
 *
 *  @discussion Throws `NSInternalInconsistencyException` if either MANY or FEW are out of the range bounds.
 */
+ (NSNumber *)integerBetween:(NSInteger)min and:(NSInteger)max many:(NSNumber *)m few:(NSNumber *)f;

@end


@interface GZNumbers (Indexes)

/**
 *  Any index of the specified collection or data object.
 *  Throws `NSInternalInconsistencyException` if the object cannot be count or has no length.
 *
 *  @param enumerableObj Object that responds to count or lenght selectors.
 *
 *  @return 0,1,...,count-1 (length-1)
 */
+ (NSNumber *)indexFrom:(id)enumerableObj;

/**
 *  Any index of the specified collection or data object with predominant value MANY and/or scarce value FEW. Both MANY and FEW are optional parameters and must be inside the enumberable indexes bounds. If specifing both, they must be different.
 *
 *  @param enumerableObj Object that responds to count or lenght selectors.
 *  @param m             Number with the desired integer to be predominant. Can be nil. If not nil, must be in the range [MIN, MAX].
 *  @param f             Number with the desired integer to be scarce. Can be nil. If not nil, must be in the range [MIN, MAX].
 *
 *  @return 0,1,...,count-1 (length-1) with `MANY` value returning with high probability and FEW with low probability (exact distribution varies depending on the range).
 *
 *  @discussion Throws `NSInternalInconsistencyException` if either MANY or FEW are out of the range bounds.
 */
+ (NSNumber *)indexFrom:(id)enumerableObj many:(NSNumber *)m few:(NSNumber *)f;

@end


@interface GZNumbers (DecimalNumbers)

/**
 *  Any float number from MIN to MAX.
 *
 *  @param min Minimum desired value that may be generated.
 *  @param max Maximum desired value that may be generated.
 *
 *  @return decimal number ∈[MIN, MAX] or [MAX, MIN] if MIN is bigger than MAX. 
 */
+ (NSNumber *)floatBetween:(float)min and:(float)max;

@end



