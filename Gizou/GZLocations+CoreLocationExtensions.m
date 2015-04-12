//
//  GZLocations+CoreLocationExtensions.m
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import "GZLocations.h"
#import "GZLocations+CoreLocationExtensions.h"

@implementation GZLocations (CoreLocationExtensions)

+ (CLLocationCoordinate2D)coordinate
{
    return CLLocationCoordinate2DMake([self latitude], [self longitude]);
}

+ (NSArray *)locationsNear:(CLLocationCoordinate2D)coordinate radiusInMeters:(NSUInteger)radius count:(NSUInteger)count
{
    NSCParameterAssert(radius);
    NSCParameterAssert(count);
    
    srand48(time(0));
    
    NSMutableArray *returnArray = [NSMutableArray new];

    for (int x = 0; x < count; x++) {
        double radiusInDegrees = radius / 111000.0f;
        
        double u = drand48();
        double v = drand48();
        double w = radiusInDegrees * sqrt(u);
        double t = M_PI_2 * v;
        double x = w * cos(t);
        double y = w * sin(t);
        
        double new_x = x / cos(coordinate.latitude);
        
        double foundLongitude = new_x + coordinate.longitude;
        double foundLatitude = y + coordinate.latitude;
        CLLocation *location = [[CLLocation alloc] initWithLatitude:foundLatitude longitude:foundLongitude];
        [returnArray addObject:location];
    }
    
    return [NSArray arrayWithArray:returnArray];
}

@end
