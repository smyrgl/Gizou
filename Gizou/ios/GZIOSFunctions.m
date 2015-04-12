//
//  GZIOSFunctions.m
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import "GZIOSFunctions.h"
#import <UIKit/UIKit.h>

BOOL isRetina()
{
    return (([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) ? [[UIScreen mainScreen] scale] > 1.0 : NO);
}
