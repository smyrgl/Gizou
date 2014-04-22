//
//  GZNames.m
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import "GZNames.h"
#import "GZDataManager+GZPrivateDataRequests.h"
#import "GZConstants.h"
#import "GZUtilityFunctions.h"

@implementation GZNames

+ (NSString *)name
{
    int randomSeed = arc4random_uniform(6);
    
    if (randomSeed == 0) {
        return [NSString stringWithFormat:@"%@ %@ %@", [self prefix], [self firstName], [self lastName]];
    } else if (randomSeed == 1) {
        return [NSString stringWithFormat:@"%@ %@ %@", [self firstName], [self lastName], [self suffix]];
    } else {
        return [NSString stringWithFormat:@"%@ %@", [self firstName], [self lastName]];
    }
}

+ (NSString *)firstName
{
    return [GZDataManager getRandomStringForKey:GZDataFirstNameKey];
}

+ (NSString *)lastName
{
    return [GZDataManager getRandomStringForKey:GZDataLastNameKey];
}

+ (NSString *)prefix
{
    return [GZDataManager getRandomStringForKey:GZDataNamePrefixKey];
}

+ (NSString *)suffix
{
    return [GZDataManager getRandomStringForKey:GZDataNameSuffixKey];
}

+ (NSArray *)nameSequenceWithCount:(NSUInteger)count
{
    NSAssert(count > 1, @"Sequence must be two objects or more");
    NSArray *firstNameArray = [GZDataManager getDataArrayForKey:GZDataFirstNameKey];
    
    NSMutableArray *fullNameArray = [NSMutableArray new];
    
    for (NSString * firstName in firstNameArray) {
        [fullNameArray addObject:[NSString stringWithFormat:@"%@ %@", firstName, [self lastName]]];
    }
    
    return GZSequenceArray(fullNameArray, count);
}

+ (NSArray *)firstNameSequenceWithCount:(NSUInteger)count
{
    NSAssert(count > 1, @"Sequence must be two objects or more");
    return GZSequenceArray([GZDataManager getDataArrayForKey:GZDataFirstNameKey], count);
}

+ (NSArray *)lastNameSequenceWithCount:(NSUInteger)count
{
    NSAssert(count > 1, @"Sequence must be two objects or more");
    return GZSequenceArray([GZDataManager getDataArrayForKey:GZDataLastNameKey], count);
}

@end
