//
//  GZNames.h
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import <Foundation/Foundation.h>

/**
 *  Creates names and components that make up names.
 */

@interface GZNames : NSObject

///-------------------
/// @name Single names
///-------------------

/**
 *  Returns a full name with at least two parts (First Name/Last Name) and may randomly contain a prefix, suffix or both.
 *
 *  @return String with the newly created name.
 */

+ (NSString *)name;

/**
 *  Returns a string that is suitable as a first name.
 *
 *  @return String with the newly created first name.
 */

+ (NSString *)firstName;

/**
 *  Returns a string that is suitable as a first name.
 *
 *  @return String with the newly created last name.
 */

+ (NSString *)lastName;

/**
 *  String that is suitable as a name prefix such as "Mr." or "Mrs.".
 *
 *  @return String appropriate to prefix in front of a name.
 */

+ (NSString *)prefix;

/**
 *  String that is suitable as a name suffix such as "Jr." or "III".
 *
 *  @return String appropriate to use as a suffix.
 */


+ (NSString *)suffix;

///---------------------
/// @name Name sequences
///---------------------

/**
 *  Creates a series of unique full names.  The equivalent of calling `name` but will return guaranteed unique values.
 *
 *  @param count Number of unique names you wish to create.
 *
 *  @return Array containing the names.
 *  @warning Will only be unique in the array returned, calling this twice can produce duplicate values.
 */

+ (NSArray *)nameSequenceWithCount:(NSUInteger)count;

/**
 *  Creates a series of unique first names.  The equivalent of calling `firstName` but will return guaranteed unique values.
 *
 *  @param count Number of unique first names you wish to create.
 *
 *  @return Array containing the first names.
 *  @warning Will only be unique in the array returned, calling this twice can produce duplicate values.
 */

+ (NSArray *)firstNameSequenceWithCount:(NSUInteger)count;

/**
 *  Creates a series of unique last names.  The equivalent of calling `lastName` but will return guaranteed unique values.
 *
 *  @param count Number of unique last names you wish to create.
 *
 *  @return Array containing the last names.
 *  @warning Will only be unique in the array returned, calling this twice can produce duplicate values.
 */

+ (NSArray *)lastNameSequenceWithCount:(NSUInteger)count;

@end
