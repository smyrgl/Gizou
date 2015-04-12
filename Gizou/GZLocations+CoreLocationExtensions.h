//
//  GZLocations+CoreLocationExtensions.h
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import <CoreLocation/CoreLocation.h>

@class GZLocations;

@interface GZLocations (CoreLocationExtensions)

/**
 *  Returns a random valid coordinate.
 *
 *  @return Valid location coordinate somewhere on Earth.  
 *  @warning Location will probably be in the ocean.  Do not use this for navigation unless you like getting wet.
 */

+ (CLLocationCoordinate2D)coordinate;

/**
 *  Returns an array of locations that are randomly spaced within a specified radius of a given coordinate.
 *
 *  @param coordinate Coordinate that you wish to find locations near.
 *  @param radius     Radius you wish the nearby locations to appear in.
 *  @param count      Number of nearby locations you want.
 *
 *  @return An array of CLLocation objects.
 */

+ (NSArray *)locationsNear:(CLLocationCoordinate2D)coordinate radiusInMeters:(NSUInteger)radius count:(NSUInteger)count;

@end
