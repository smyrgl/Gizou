//
//  CLLocation+GZLocations.h
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocation (GZLocations)

+ (CLLocation *)fakeLocation;
- (CLLocation *)nearbyLocation;
- (CLLocation *)locationWithinRadiusInMeters:(NSUInteger)meters;
- (NSArray *)locationsWithinRadiusInMeters:(NSUInteger)meters count:(NSUInteger)count;

@end
