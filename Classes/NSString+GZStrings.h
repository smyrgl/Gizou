//
//  NSString+GZFakeStrings.h
//  
//
//  Created by John Tumminaro on 4/18/14.
//
//

#import <Foundation/Foundation.h>

@interface NSString (GZStrings)

+ (NSString *)fakeName;
+ (NSString *)fakeFirstName;
+ (NSString *)fakeLastName;
+ (NSString *)fakeFullAddress;
+ (NSString *)fakeStreetAddress;
+ (NSString *)fakeCity;
+ (NSString *)fakeZipCode;
+ (NSString *)fakeStateCode;
+ (NSString *)fakeStateName;
+ (NSString *)fakeCountry;
+ (NSString *)fakeLatitudeString;
+ (NSString *)fakeLongitudeString;
+ (NSString *)fakePhoneNumber;
+ (NSString *)stringWithFakeCharacters;
+ (NSString *)stringWithFakeWords;
+ (NSString *)stringWithFakeSentences;
+ (NSString *)stringWithFakeParagraphs;
+ (NSString *)stringWithNumberOfFakeCharacters:(NSUInteger)count;
+ (NSString *)stringWithNumberOfFakeWords:(NSUInteger)count;
+ (NSString *)stringWithNumberOfFakeSentences:(NSUInteger)count;
+ (NSString *)stringWithNumberOfFakeParagraphs:(NSUInteger)count;

@end
