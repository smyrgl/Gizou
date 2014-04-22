//
//  GZFaker.h
//  
//
//  Created by John Tumminaro on 4/18/14.
//
//

#import <Foundation/Foundation.h>

@interface GZDataManager : NSObject

+ (NSSet *)availableLanguages;
+ (NSString *)currentLanguage;
+ (void)setLanguage:(NSString *)language;

@end
