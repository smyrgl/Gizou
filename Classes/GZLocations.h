//
//  GZLocations.h
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import <Foundation/Foundation.h>

@interface GZLocations : NSObject

+ (NSString *)fullAddress;
+ (NSString *)streetAddress;
+ (NSString *)streetName;
+ (NSString *)city;
+ (NSString *)buildingNumber;
+ (NSString *)zipCode;
+ (NSString *)streetSuffix;
+ (NSString *)citySuffix;
+ (NSString *)cityPrefix;
+ (NSString *)stateCode;
+ (NSString *)state;
+ (NSString *)country;
+ (NSString *)latitudeString;
+ (NSString *)longitudeString;
+ (double)latitude;
+ (double)longitude;

@end
