//
//  GZPhoneNumbers.h
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import <Foundation/Foundation.h>

/**
 *  Creates sample phone number strings.
 */

@interface GZPhoneNumbers : NSObject

/**
 *  Returns a sample phone number string in a random format such as "(xxx)xxx-xxxx" or "xxx-xxx-xxxx".
 *
 *  @return String with a random phone number.
 */

+ (NSString *)phoneNumber;

@end
