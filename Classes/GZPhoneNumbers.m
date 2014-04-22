//
//  GZPhoneNumbers.m
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import "GZPhoneNumbers.h"
#import "GZDataManager+GZPrivateDataRequests.h"
#import "GZConstants.h"
#import "GZUtilityFunctions.h"

@implementation GZPhoneNumbers

+ (NSString *)phoneNumber
{
    int random = arc4random_uniform(3);
    
    NSMutableArray *nums = [NSMutableArray new];
    for (int i = 0; i < 10; i++) {
        [nums addObject:[NSNumber numberWithInteger:arc4random_uniform(9)]];
    }
    
    NSString *phoneNumber;
    
    if (random == 0) {
        phoneNumber = [NSString stringWithFormat:@"%@%@%@-%@%@%@-%@%@%@%@", nums[0], nums[1], nums[2], nums[3], nums[4], nums[5], nums[6], nums[7], nums[8], nums[9]];
    } else if (random == 1) {
        phoneNumber = [NSString stringWithFormat:@"+1 %@%@%@-%@%@%@-%@%@%@%@", nums[0], nums[1], nums[2], nums[3], nums[4], nums[5], nums[6], nums[7], nums[8], nums[9]];
    } else {
        phoneNumber = [NSString stringWithFormat:@"(%@%@%@)%@%@%@-%@%@%@%@", nums[0], nums[1], nums[2], nums[3], nums[4], nums[5], nums[6], nums[7], nums[8], nums[9]];
    }
    
    return phoneNumber;
}

@end
