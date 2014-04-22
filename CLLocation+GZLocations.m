//
//  CLLocation+GZLocations.m
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import "CLLocation+GZLocations.h"
#import "Gizou.h"
#import "GZLocations+CoreLocationExtensions.h"

@implementation CLLocation (GZLocations)

+ (CLLocation *)fakeLocation
{
    CLLocationCoordinate2D coordinate = [GZLocations coordinate];
    return [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
}

- (CLLocation *)nearbyLocation
{
    return [self locationWithinRadiusInMeters:1000];
}

- (CLLocation *)locationWithinRadiusInMeters:(NSUInteger)meters
{
    return [self locationsWithinRadiusInMeters:meters count:1][0];
}

- (NSArray *)locationsWithinRadiusInMeters:(NSUInteger)meters count:(NSUInteger)count
{
    return [GZLocations locationsNear:self.coordinate radiusInMeters:meters count:count];
}

@end
