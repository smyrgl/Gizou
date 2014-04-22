//
//  GZUtilityFunctions.m
//  
//
//  Created by John Tumminaro on 4/18/14.
//
//

#import "GZUtilityFunctions.h"

@implementation GZUtilityFunctions

NSArray * GZSequenceArray(NSArray *sourceArray, NSUInteger count)
{
    NSMutableArray *returnArray = [NSMutableArray new];
    
    if (count < sourceArray.count) {
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, count)];
        sourceArray = [sourceArray objectsAtIndexes:indexSet];
    }
    
    [returnArray addObjectsFromArray:sourceArray];
    
    if (returnArray.count < count) {
        for (int x = 0; x < count - returnArray.count; x++) {
            [returnArray addObject:[NSString stringWithFormat:@"%@-%d", returnArray[arc4random_uniform((uint32_t)[returnArray count])], x]];
        }
    }
    
    return [NSArray arrayWithArray:returnArray];
}

@end
