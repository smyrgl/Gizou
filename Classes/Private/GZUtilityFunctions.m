//
//  GZUtilityFunctions.m
//  
//
//  Created by John Tumminaro on 4/18/14.
//
//

#import "GZUtilityFunctions.h"

@implementation GZUtilityFunctions

BOOL isRetina()
{
    return (([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) ? [[UIScreen mainScreen] scale] > 1.0 : NO);
}

@end
