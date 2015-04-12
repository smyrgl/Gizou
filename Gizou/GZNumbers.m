//
//  GZNumbers.m
//
//  Created by Maria Bernis on 20/02/15.
//

#import "GZNumbers.h"

#define kINTMAX INT32_MAX


@implementation GZNumbers


#pragma mark - Helpers

+ (BOOL)returnManyValue
{
    return ![self returnFewValue];
}

+ (BOOL)returnFewValue
{
    u_int32_t r10 = arc4random_uniform(10) + 1; // In [1, 10]
    if ((r10 % 3) == 0) {
        return YES;
    }
    return NO;
}

+ (BOOL)isInteger:(NSInteger)x inRange:(NSInteger)a and:(NSInteger)b
{
    NSInteger diff = b - a;
    if ((diff >= 0) && (x >= a && x <= b)) {
        return YES;
    }
    if (diff < 0 && (x >= b && x <= a)) {
        return YES;
    }
    return NO;
}

@end


@implementation GZNumbers (Booleans)

+ (NSNumber *)yesOrNo
{
    u_int32_t rndBool = arc4random_uniform(2);
    return rndBool == 1 ? @YES : @NO;
}


#pragma mark Asymmetric

+ (NSNumber *)yesOrNoMostly:(BOOL)m
{
    NSNumber *randomBool = [self yesOrNo];
    if (m == randomBool.boolValue) {
        return randomBool;
    }
    return [self returnManyValue] ? @(m) : randomBool;
}

@end


@implementation GZNumbers (NaturalNumbers)

+ (NSNumber *)integerN
{
    return @(arc4random_uniform(kINTMAX));
}

+ (NSNumber *)integerNNonZero
{
    return @(arc4random_uniform(kINTMAX) + 1);
}

+ (NSNumber *)integerNLessOrEqual:(u_int32_t)max
{
    return [self integerBetween:0 and:(NSInteger)max];
}

@end


@implementation GZNumbers (ZNumbers)

+ (NSNumber *)integerZ
{
    return [self integerBetween:-kINTMAX and:kINTMAX];
}

+ (NSNumber *)integerZNonZero
{
    int randPos = [self integerNNonZero].intValue;
    BOOL randBool = [self yesOrNo].boolValue;
    return randBool ? @(randPos) : @(-randPos);
}

+ (NSNumber *)integerZLessOrEqual:(NSInteger)max
{
    return [self integerBetween:-kINTMAX and:max];
}

+ (NSNumber *)integerBiggerOrEqual:(NSInteger)min
{
    return [self integerBetween:min and:kINTMAX];
}

+ (NSNumber *)integerBetween:(NSInteger)min and:(NSInteger)max
{
    NSInteger diff = max - min;
    if (diff < 0) {
        diff = -diff;
        NSInteger newMin = max;
        NSInteger newMax = min;
        min = newMin;
        max = newMax;
    }

    if ((max > 0 && (min + max < min)) ||
        (max < 0 && (min + max > min))) {
        // Overflown
        NSLog(@"[! GZNumbers] WARNING. Range specified in integerZBetween:and: may have overflown int32 values");
    }

    if (diff == 0) {
        return @(max);
    }
    int32_t rndInRange = (int32_t)min + (int32_t)arc4random_uniform((u_int32_t)diff + 1);
    return @(rndInRange);
}

+ (NSNumber *)negativeInteger
{
    return [self integerBetween:-kINTMAX and:0];
}

+ (NSNumber *)negativeIntegerNonZero
{
    return [self integerBetween:-kINTMAX and:-1];
}


#pragma mark Asymmetric

+ (NSNumber *)integerBetween:(NSInteger)min
                         and:(NSInteger)max
                        many:(NSNumber *)m
                         few:(NSNumber *)f
{
    NSNumber *random = [self integerBetween:min and:max];
    if (!m && !f) {
        return random;
    }
    if (m && ![self isInteger:m.integerValue inRange:min and:max]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"Cannot set 'many' value out of range."
                                     userInfo:nil];
    }
    if (f && ![self isInteger:f.integerValue inRange:min and:max]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"Cannot set 'few' value out of range."
                                     userInfo:nil];
    }
    
    if (m && m.integerValue != random.integerValue) {
        if ([self returnManyValue]) {
            return @(m.integerValue);
        }
    }
    if (f && f.integerValue == random.integerValue) {
        if (![self returnFewValue]) {
            return [self integerBetween:min and:max many:nil few:f];
        }
    }
    return random;
}

@end


@implementation GZNumbers (DecimalNumbers)

+ (NSNumber *)floatBetween:(float)min and:(float)max
{
    float diff = max - min;
    if (diff == 0) {
        return @(max);
    }
    u_int32_t rInt = arc4random_uniform(kINTMAX) + 1;
    float rndInRange = min + ((float) rInt / kINTMAX * diff);
    
    return @(rndInRange);
}

@end


@implementation GZNumbers (Indexes)

+ (NSNumber *)indexFrom:(id)enumerableObj
{
    NSUInteger count = [self objectCountOrThrow:enumerableObj];
    return [self integerBetween:0 and:count - 1];
}


#pragma mark Asymmetric

+ (NSNumber *)indexFrom:(id)enumerableObj many:(NSNumber *)m few:(NSNumber *)f
{
    NSUInteger count = [self objectCountOrThrow:enumerableObj];
    return [self integerBetween:0 and:count - 1 many:m few:f];
}


#pragma mark Indexes Helpers

+ (NSUInteger)objectCountOrThrow:(id)obj
{
    BOOL hasCount = [obj respondsToSelector:@selector(count)] ;
    BOOL hasLength = [obj respondsToSelector:@selector(length)];
    if (!hasCount && !hasLength) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"Tried to use `indexFrom:` on a object with no count or length selectors"
                                     userInfo:nil];
    }
    
    NSUInteger count = hasCount ? [obj count] : [obj length];
    return count;
}

@end
