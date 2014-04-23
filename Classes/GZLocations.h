//
//  GZLocations.h
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import <Foundation/Foundation.h>

/**
 *  Creates objects dealing with location data including addresses and location coordinate data.
 */

@interface GZLocations : NSObject

///---------------------------
/// @name Locations as strings
///---------------------------

/**
 *  Provides a fully assembled address string in the format of "123 Fake Street, FakeCity, CA, 94322".
 *
 *  @return String with the address with commas seperating the components.
 */

+ (NSString *)fullAddress;

/**
 *  Provides a string with a building number and street in the format of "123 Fake Street".
 *
 *  @return String containing the street address.
 */

+ (NSString *)streetAddress;

/**
 *  Provides a street name with proper suffix in the format of "Happy Road" or "Banner Drive".
 *
 *  @return String containing the street name.
 */

+ (NSString *)streetName;

/**
 *  Provides an example city name.
 *
 *  @return String containing the city name.
 */

+ (NSString *)city;

/**
 *  Provides a number string in a normal address range that can be used to assemble an address from components.
 *
 *  @return A string containing the building number.
 */

+ (NSString *)buildingNumber;

/**
 *  Sample zip code string in the format of "83248" or "82438-2342".
 *
 *  @return Zip code string.
 */

+ (NSString *)zipCode;

/**
 *  Suffix for a street such as "Road" or "Drive".  Can be used to assemble a street from components.
 *
 *  @return String with the street suffix.
 */

+ (NSString *)streetSuffix;

/**
 *  Suffix for a city that can be used to create a real-sounding city name from a normal name such as "town", "bury", "haven", etc.
 *
 *  @return String with the city suffix.
 */

+ (NSString *)citySuffix;

/**
 *  Optional prefix for a city such as "North" or "Lake".  Can be used to create a city from components.
 *
 *  @return String with the city prefix.
 */

+ (NSString *)cityPrefix;

/**
 *  Code for one of the 50 US states in the format of "CA" or "LA".
 *
 *  @return String with the state code.
 */

+ (NSString *)stateCode;

/**
 *  Full name of a valid US state such as "California" or "Washington".
 *
 *  @return String with the state name.
 */

+ (NSString *)state;

/**
 *  Full name of a valid country such as "Finland" or "Liberia".
 *
 *  @return String with the country name.
 */

+ (NSString *)country;

/**
 *  Valid latitude represented as a string.
 *
 *  @return String with a latitude.
 */

+ (NSString *)latitudeString;

/**
 *  Valid longitude represented as a string.
 *
 *  @return String with a longitude.
 */

+ (NSString *)longitudeString;

///---------------------------
/// @name Locations as numbers
///---------------------------

/**
 *  Valid latitude represented as a floating point number.
 *
 *  @return Double with a random latitude.
 */

+ (double)latitude;

/**
 *  Valid longitude represented as a floating point number.
 *
 *  @return Double with a random longitude.
 */

+ (double)longitude;

@end
