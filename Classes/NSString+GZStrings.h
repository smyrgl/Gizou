//
//  NSString+GZFakeStrings.h
//  
//
//  Created by John Tumminaro on 4/18/14.
//
//

#import <Foundation/Foundation.h>

/**
 *  Convenience categories on `NSString` for accessing the Gizou generators.  
 */

@interface NSString (GZStrings)

///-------------
/// @name Simple
///-------------


/**
*  Creates a fake name.
*
*  @return String with a fake name.
*/

+ (NSString *)fakeName;

/**
 *  Creates a fake first name.
 *
 *  @return String with a fake first name.
 */

+ (NSString *)fakeFirstName;

/**
 *  Creates a fake last name.
 *
 *  @return String with a fake last name.
 */

+ (NSString *)fakeLastName;

/**
 *  Creates a fake address string.
 *
 *  @return String with the fake address.
 */

+ (NSString *)fakeFullAddress;

/**
 *  Creates a string with a fake street address.
 *
 *  @return String with the fake street address.
 */

+ (NSString *)fakeStreetAddress;

/**
 *  Creates a string with a fake city.
 *
 *  @return String with the fake city.
 */

+ (NSString *)fakeCity;

/**
 *  Creates a string with a fake zip code.
 *
 *  @return String with fake zipcode.
 */

+ (NSString *)fakeZipCode;

/**
 *  Creates a fake state code.
 *
 *  @return String with fake state code.
 */

+ (NSString *)fakeStateCode;

/**
 *  Creates a fake state name.
 *
 *  @return String with a fake state name.
 */

+ (NSString *)fakeStateName;

/**
 *  Creates a string with a fake country.
 *
 *  @return String with a fake country.
 */

+ (NSString *)fakeCountry;

/**
 *  Creates a string with a fake latitude.
 *
 *  @return Fake latitude string.
 */

+ (NSString *)fakeLatitudeString;

/**
 *  Creates a string with a fake longitude.
 *
 *  @return Fake longitude string.
 */

+ (NSString *)fakeLongitudeString;

/**
 *  Creates a string with a fake phone number.
 *
 *  @return Fake phone number string.
 */

+ (NSString *)fakePhoneNumber;

/**
 *  Creates a string with fake characters of random length.
 *
 *  @return Fake character string.
 */

+ (NSString *)stringWithFakeCharacters;

/**
 *  Creates a fake words string.
 *
 *  @return Fake words string.
 */

+ (NSString *)stringWithFakeWords;

/**
 *  Creates a string with fake sentences.
 *
 *  @return Fake sentences string.
 */

+ (NSString *)stringWithFakeSentences;

/**
 *  Creates a string with fake paragraphs.
 *
 *  @return Fake paragraphs string.
 */

+ (NSString *)stringWithFakeParagraphs;

///---------------
/// @name Advanced
///---------------

/**
 *  Creates a randomly generated string with the specified number of characters.
 *
 *  @param count Number of characters in the string.
 *
 *  @return String with random characters.
 */

+ (NSString *)stringWithNumberOfFakeCharacters:(NSUInteger)count;

/**
 *  Creates a string with a specified number of lorem ipsum words.
 *
 *  @param count Number of words.
 *
 *  @return Word string.
 */

+ (NSString *)stringWithNumberOfFakeWords:(NSUInteger)count;

/**
 *  Creates a string with a specified number of lorem ipsum sentences.
 *
 *  @param count Number of sentences.
 *
 *  @return Sentences string.
 */

+ (NSString *)stringWithNumberOfFakeSentences:(NSUInteger)count;

/**
 *  Creates a string with the specified number of lorem ipsum paragraphs.
 *
 *  @param count Number of paragraphs.
 *
 *  @return Paragraphs string.
 */

+ (NSString *)stringWithNumberOfFakeParagraphs:(NSUInteger)count;

@end
