//
//  NSString+GZFakeStrings.m
//  
//
//  Created by John Tumminaro on 4/18/14.
//
//

#import "NSString+GZStrings.h"
#import "Gizou.h"

@implementation NSString (GZStrings)

+ (NSString *)fakeName
{
    return [GZNames name];
}

+ (NSString *)fakeFirstName
{
    return [GZNames firstName];
}

+ (NSString *)fakeLastName
{
    return [GZNames lastName];
}

+ (NSString *)fakeFullAddress
{
    return [GZLocations fullAddress];
}

+ (NSString *)fakeStreetAddress
{
    return [GZLocations streetAddress];
}

+ (NSString *)fakeCity
{
    return [GZLocations city];
}

+ (NSString *)fakeZipCode
{
    return [GZLocations zipCode];
}

+ (NSString *)fakeStateCode
{
    return [GZLocations stateCode];
}

+ (NSString *)fakeStateName
{
    return [GZLocations state];
}

+ (NSString *)fakeCountry
{
    return [GZLocations country];
}

+ (NSString *)fakeLatitudeString
{
    return [GZLocations latitudeString];
}

+ (NSString *)fakeLongitudeString
{
    return [GZLocations longitudeString];
}

+ (NSString *)fakePhoneNumber
{
    return [GZPhoneNumbers phoneNumber];
}

+ (NSString *)stringWithFakeCharacters
{
    return [GZWords characters:arc4random_uniform(6) + 3];
}

+ (NSString *)stringWithFakeWords
{
    return [GZWords words:arc4random_uniform(6) + 3];
}

+ (NSString *)stringWithFakeSentences
{
    return [GZWords sentences:arc4random_uniform(6) + 3];
}

+ (NSString *)stringWithFakeParagraphs
{
    return [GZWords paragraphs:arc4random_uniform(6) + 3];
}

+ (NSString *)stringWithNumberOfFakeCharacters:(NSUInteger)count
{
    return [GZWords characters:count];
}

+ (NSString *)stringWithNumberOfFakeWords:(NSUInteger)count
{
    return [GZWords words:count];
}

+ (NSString *)stringWithNumberOfFakeSentences:(NSUInteger)count
{
    return [GZWords sentences:count];
}

+ (NSString *)stringWithNumberOfFakeParagraphs:(NSUInteger)count
{
    return [GZWords paragraphs:count];
}

@end
