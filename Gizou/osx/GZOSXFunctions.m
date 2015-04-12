//
//  GZOSXFunctions.m
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import "GZOSXFunctions.h"
#import <Cocoa/Cocoa.h>

BOOL isRetina()
{
    return (([[NSScreen mainScreen] respondsToSelector:@selector(backingScaleFactor)]) ? [[NSScreen mainScreen] backingScaleFactor] > 1.0 : NO);
}
