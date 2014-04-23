//
//  GZInternet.h
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import <Foundation/Foundation.h>

/**
 *  Creates objects for use on the internet such as emails, urls, usernames, etc.
 */

@interface GZInternet : NSObject

///---------------------
/// @name Single objects
///---------------------

/**
*  Sample email string in a valid email format.  Uses combinations of names to create relatively normalized results.  Domain is randomly selected.
*
*  @return String with a randomly created email.
*/

+ (NSString *)email;

/**
 *  Sample email string with a provided domain.  To get a valid email the provided domain should be in the format of "gmail.com".
 *
 *  @param domain String with the domain you want the email to have.
 *
 *  @return String with a randomly generated email with the domain provided.
 */

+ (NSString *)emailWithCustomDomain:(NSString *)domain;

/**
 *  Randomly generated username string that uses names to provide a relatively human readable example (i.e. it is not just a random character string, although it will randomly contain numbers and certain special characters).
 *
 *  @return String with the randomly generated username.
 */

+ (NSString *)username;

/**
 *  Returns a randomly generated domain name using a valid domain suffix in the format of "ilikepugs.com".
 *
 *  @return String with the randomly generated domain name.
 */

+ (NSString *)domainName;

/**
 *  A valid domain suffix such as "com" or "edu".  Can be used to assemble fake urls from components.
 *
 *  @return String with a random domain suffix.
 */

+ (NSString *)domainSuffix;

/**
 *  A valid randomly generated IPv4 address in the format of "xxx.xxx.xxx.xxx".
 *
 *  @return Randomly generated IPv4 address.
 */

+ (NSString *)ipV4Address;

/**
 *  A valid randomly generated IPv6 address in the format of "xxxx:x:xxxx:xxx:xxxx:xxxx:xxxx:xxxx".
 *
 *  @return Randomly generated IPv6 address.
 */

+ (NSString *)ipv6Address;

/**
 *  A randomly generated URL string.
 *
 *  @return Randomly generated URL.
 */

+ (NSString *)url;

///----------------
/// @name Sequences
///----------------


/**
 *  Creates a series of unique emails with the specified quantity.
 *
 *  @param count Number of unique emails to generate.
 *
 *  @return Array containing the unique emails.
 */

+ (NSArray *)emailSequenceWithCount:(NSUInteger)count;

/**
 *  Creates a series of unique usernames with the specified quantity.
 *
 *  @param count Number of unique usernames to generate.
 *
 *  @return Array containing the unique usernames.
 */

+ (NSArray *)usernameSequenceWithCount:(NSUInteger)count;

/**
 *  Creates a series of unique IPv4 addresses with the specified quantity.
 *
 *  @param count Number of unique addresses to generate.
 *
 *  @return Array containing the unique addresses.
 */

+ (NSArray *)ipV4AddressSequenceWithCount:(NSUInteger)count;

/**
 *  Creates a series of unique IPv6 addresses with the specified quantity.
 *
 *  @param count Number of unique addresses to generate.
 *
 *  @return Array containing the unique addresses.
 */

+ (NSArray *)ipV6AddressSequenceWithCount:(NSUInteger)count;




@end
