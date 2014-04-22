//
//  GZDataManager+GZPrivateDataRequests.h
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import "GZDataManager.h"

@interface GZDataManager (GZPrivateDataRequests)

+ (instancetype)sharedManager;

+ (NSArray *)getDataArrayForKey:(NSString *)key;
+ (NSString *)getRandomStringForKey:(NSString *)key;

@end
