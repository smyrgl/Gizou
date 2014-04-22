//
//  GZLocations.m
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import "GZLocations.h"
#import "GZNames.h"
#import "GZDataManager+GZPrivateDataRequests.h"
#import "GZConstants.h"
#import "GZUtilityFunctions.h"

@implementation GZLocations

+ (NSString *)fullAddress
{
    return [NSString stringWithFormat:@"%@, %@, %@, %@", [self streetAddress], [self city], [self stateCode], [self zipCode]];
}

+ (NSString *)streetAddress
{
    return [NSString stringWithFormat:@"%@ %@", [self buildingNumber], [self streetName]];
}

+ (NSString *)streetName
{
    return [NSString stringWithFormat:@"%@ %@", [GZNames firstName], [self streetSuffix]];
}

+ (NSString *)city
{
    int random = arc4random_uniform(3);
    NSString *city;
    
    switch (random) {
        case 0:
            city = [NSString stringWithFormat:@"%@ %@%@", [self cityPrefix], [GZNames firstName], [self citySuffix]];
            break;
            
        case 1:
            city = [NSString stringWithFormat:@"%@ %@", [self cityPrefix], [GZNames firstName]];
            break;
            
        case 2:
            city = [NSString stringWithFormat:@"%@ %@", [GZNames firstName], [self citySuffix]];
            break;
            
        default:
            city = [NSString stringWithFormat:@"%@%@", [GZNames lastName], [self citySuffix]];
            break;
    }
    
    return city;
}

+ (NSString *)buildingNumber
{
    return [NSString stringWithFormat:@"%d", arc4random_uniform(90000) + 100];
}

+ (NSString *)zipCode
{
    int random = arc4random_uniform(2);
    NSMutableArray *nums = [NSMutableArray new];
    for (int i = 0; i < 9; i++) {
        [nums addObject:[NSNumber numberWithInteger:arc4random_uniform(9)]];
    }
    if (random == 0) {
        return [NSString stringWithFormat:@"%@%@%@%@%@", nums[0], nums[1], nums[2], nums[3], nums[4]];
    } else {
        return [NSString stringWithFormat:@"%@%@%@%@%@-%@%@%@%@", nums[0], nums[1], nums[2], nums[3], nums[4], nums[5], nums[6], nums[7], nums[8]];
    }
}

+ (NSString *)streetSuffix
{
    return [GZDataManager getRandomStringForKey:GZDataAddressStreetSuffixKey];
}

+ (NSString *)citySuffix
{
    return [GZDataManager getRandomStringForKey:GZDataAddressCitySuffixKey];
}

+ (NSString *)cityPrefix
{
    return [GZDataManager getRandomStringForKey:GZDataAddressCityPrefixKey];
}

+ (NSString *)stateCode
{
    return [GZDataManager getRandomStringForKey:GZDataAddressStateCodeKey];
}

+ (NSString *)state
{
    return [GZDataManager getRandomStringForKey:GZDataAddressStateKey];
}

+ (NSString *)country
{
    return [GZDataManager getRandomStringForKey:GZDataAddressCountryKey];
}

+ (NSString *)latitudeString
{
    return [NSString stringWithFormat:@"%f", [self latitude]];
}

+ (NSString *)longitudeString
{
    return [NSString stringWithFormat:@"%f", [self longitude]];
}

+ (double)latitude
{
    double low_bound = -90.00000000;
    double high_bound = 90.00000000;
    return (((double)arc4random()/0x100000000)*(high_bound-low_bound)+low_bound);
}

+ (double)longitude
{
    double low_bound = -180.00000000;
    double high_bound = 180.00000000;
    return (((double)arc4random()/0x100000000)*(high_bound-low_bound)+low_bound);
}

@end
