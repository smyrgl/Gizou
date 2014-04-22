#ifndef _Gizou_h
#define _Gizou_h

#import <Foundation/Foundation.h>
#import <Availability.h>
#include "TargetConditionals.h"

#import "GZDataManager.h"
#import "GZWords.h"
#import "GZNames.h"
#import "GZLocations.h"
#import "GZInternet.h"
#import "GZPhoneNumbers.h"

#ifdef TARGET_OS_IPHONE
    #import "GZIOSFunctions.h"
    #import "UIImage+GZImages.h"
#elif TARGET_IPHONE_SIMULATOR
    #import "GZIOSFunctions.h"
    #import "UIImage+GZImages.h"
#elif TARGET_OS_MAC
    #import "GZOSXFunctions.h"
#endif


#ifdef _CORELOCATIONDEFINES_H
#import "GZLocations+CoreLocationExtensions.h"
#endif

#endif