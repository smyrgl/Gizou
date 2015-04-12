//
//  CLLocation+GZLocations.h
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import <CoreLocation/CoreLocation.h>

/**
 *  Convenience category for CLLocation that makes interacting with the Gizou data factories a little simpler.
 */

@interface CLLocation (GZLocations)

/**
 *  Returns a random fake location.
 *
 *  @return CLLocation object created with random (but valid) lat/long
 *  @warning Since over 2/3rds of the Earth's surface is water it will probably be in the oceans.
 */

+ (CLLocation *)fakeLocation;

/**
 *  Returns a location nearby the receiver.
 *
 *  @return CLLocation within 1000 meters of the receiver.
 */

- (CLLocation *)nearbyLocation;

/**
 *  Returns a location within a specified distance from the receiver.
 *
 *  @param meters Number of meters radius you want nearby locations for.
 *
 *  @return CLLocation within the radius specified.
 */

- (CLLocation *)locationWithinRadiusInMeters:(NSUInteger)meters;

/**
 *  Returns an array of locations within a specified distance from the receiver.
 *
 *  @param meters Number of meters radius you want nearby locations for.
 *  @param count  Number of nearby locations you want returned.
 *
 *  @return Array of CLLocations within the radius specified.
 */

- (NSArray *)locationsWithinRadiusInMeters:(NSUInteger)meters count:(NSUInteger)count;

@end
