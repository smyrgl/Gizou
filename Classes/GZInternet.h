//
//  GZInternet.h
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import <Foundation/Foundation.h>

@interface GZInternet : NSObject

+ (NSString *)email;
+ (NSString *)emailWithCustomDomain:(NSString *)domain;
+ (NSString *)username;
+ (NSString *)domainName;
+ (NSString *)domainSuffix;
+ (NSString *)ipV4Address;
+ (NSString *)ipv6Address;
+ (NSString *)url;

+ (NSArray *)emailSequenceWithCount:(NSUInteger)count;
+ (NSArray *)usernameSequenceWithCount:(NSUInteger)count;
+ (NSArray *)ipV4AddressSequenceWithCount:(NSUInteger)count;
+ (NSArray *)ipV6AddressSequenceWithCount:(NSUInteger)count;

@end
