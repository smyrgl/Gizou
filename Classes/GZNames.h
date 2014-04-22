//
//  GZNames.h
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import <Foundation/Foundation.h>

@interface GZNames : NSObject

+ (NSString *)name;
+ (NSString *)firstName;
+ (NSString *)lastName;
+ (NSString *)prefix;
+ (NSString *)suffix;

+ (NSArray *)nameSequenceWithCount:(NSUInteger)count;
+ (NSArray *)firstNameSequenceWithCount:(NSUInteger)count;
+ (NSArray *)lastNameSequenceWithCount:(NSUInteger)count;

@end
