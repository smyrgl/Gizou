//
//  GZLocationsTests.m
//  GizouTests
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import <XCTest/XCTest.h>
#import "Gizou.h"
#import <CoreLocation/CoreLocation.h>
#import "GZLocations+CoreLocationExtensions.h"

@interface GZLocationsTests : XCTestCase

@end

@implementation GZLocationsTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFullAddress
{
    NSString *address = [GZLocations fullAddress];
    XCTAssert(address, @"There must be an address");
    XCTAssert(address.length > 0, @"String must not be empty");
}

- (void)testStreetAddress
{
    NSString *address = [GZLocations streetAddress];
    XCTAssert(address, @"There must be an address");
    XCTAssert(address.length > 0, @"String must not be empty");
}

- (void)testStreetName
{
    NSString *street = [GZLocations streetName];
    XCTAssert(street, @"There must be a street");
    XCTAssert(street.length > 0, @"String must not be empty");
}

- (void)testCityName
{
    NSString *city = [GZLocations city];
    XCTAssert(city, @"There must be a city");
    XCTAssert(city.length > 0, @"String must not be empty");
}

- (void)testBuildingNumber
{
    NSString *building = [GZLocations buildingNumber];
    XCTAssert(building, @"There must be a city");
    XCTAssert(building.length > 0, @"String must not be empty");
}

- (void)testZipCode
{
    NSString *zip = [GZLocations zipCode];
    XCTAssert(zip, @"There must be a zip");
    XCTAssert(zip.length == 5 || zip.length == 10, @"Must be 5 or 10 characters in length");
}

- (void)testStreetSuffix
{
    NSString *streetSuffix = [GZLocations streetSuffix];
    XCTAssert(streetSuffix, @"There must be a street suffix");
    XCTAssert(streetSuffix.length > 0, @"String must not be empty");
}

- (void)testCitySuffix
{
    NSString *citySuffix = [GZLocations citySuffix];
    XCTAssert(citySuffix, @"There must be a city suffix");
    XCTAssert(citySuffix.length > 0, @"String must not be empty");
}

- (void)testCityPrefix
{
    NSString *cityPrefix = [GZLocations cityPrefix];
    XCTAssert(cityPrefix, @"There must be a city suffix");
    XCTAssert(cityPrefix.length > 0, @"String must not be empty");
}

- (void)testStateCode
{
    NSString *stateCode = [GZLocations stateCode];
    XCTAssert(stateCode, @"There must be a state code");
    XCTAssert(stateCode.length == 2, @"State code must be 2 characters in length");
}

- (void)testState
{
    NSString *state = [GZLocations state];
    XCTAssert(state, @"There must be a state");
    XCTAssert(state.length > 0, @"String must not be empty");
}

- (void)testCountry
{
    NSString *country = [GZLocations country];
    XCTAssert(country, @"There must be a country");
    XCTAssert(country.length > 0, @"String must not be empty");
}

- (void)testLatitudeString
{
    NSString *latitude = [GZLocations latitudeString];
    XCTAssert(latitude, @"There must be a latitude");
    XCTAssert(latitude.length > 0, @"String must not be empty");
}

- (void)testLongitudeString
{
    NSString *longitude = [GZLocations longitudeString];
    XCTAssert(longitude, @"There must be a longitude");
    XCTAssert(longitude.length > 0, @"String must not be empty");
}

- (void)testLatitude
{
    double latitude = [GZLocations latitude];
    XCTAssert(latitude > -90, @"Must be greater than -90");
    XCTAssert(latitude < 90, @"Must be less than 90");
}

- (void)testLongitude
{
    double longitude = [GZLocations longitude];
    XCTAssert(longitude > -180, @"Must be greater than -180");
    XCTAssert(longitude < 180, @"Must be less than 180");
}

- (void)testCLLocation
{
    CLLocationCoordinate2D coordinate = [GZLocations coordinate];
    XCTAssert(coordinate.latitude > -90, @"Latitude must be greater than -90");
    XCTAssert(coordinate.latitude < 90, @"Latitude must be less than 90");
    XCTAssert(coordinate.longitude > -180, @"Longitude must be greater than -180");
    XCTAssert(coordinate.longitude < 180, @"Longitude must be less than 180");
}

/*

- (void)testRandomLocationsNearby
{
    CLLocationCoordinate2D coordinate = [GZLocations coordinate];
    CLLocation *sourceLocation = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    NSArray *nearby = [GZLocations locationsNear:coordinate radiusInMeters:1000 count:10];
    XCTAssert(nearby.count == 10, @"There must be 10 locations returned");
    for (CLLocation *location in nearby) {
        double distance = [sourceLocation distanceFromLocation:location];
        XCTAssert(distance < 1050, @"Distance must be less than 1000 meters from the source location...actual is %f", distance);
        XCTAssert(distance > 0, @"Distance must be greater than 0 meters from the source location");
    }
}
 
 */

@end
