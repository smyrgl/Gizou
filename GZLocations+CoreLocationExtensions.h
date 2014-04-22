//
//  GZLocations+CoreLocationExtensions.h
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import "GZLocations.h"
#import <CoreLocation/CoreLocation.h>

@interface GZLocations (CoreLocationExtensions)

+ (CLLocationCoordinate2D)coordinate;
+ (NSArray *)locationsNear:(CLLocationCoordinate2D)coordinate radiusInMeters:(NSUInteger)radius count:(NSUInteger)count;

@end
