//
//  GZDataManager+GZPrivateDataRequests.m
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import "GZDataManager+GZPrivateDataRequests.h"

@implementation GZDataManager (GZPrivateDataRequests)

+ (instancetype)sharedManager
{
    static dispatch_once_t onceQueue;
    static GZDataManager *sharedManager = nil;
    
    dispatch_once(&onceQueue, ^{ sharedManager = [[self alloc] init]; });
    return sharedManager;
}

+ (NSArray *)getDataArrayForKey:(NSString *)key
{
    NSString *keypath = [NSString stringWithFormat:@"dataDictionary.%@.%@", [self currentLanguage], key];
    
    return [[self sharedManager] valueForKeyPath:keypath];
}

+ (NSString *)getRandomStringForKey:(NSString *)key
{
    NSArray *dataArray = [GZDataManager getDataArrayForKey:key];
    
    return dataArray[arc4random_uniform((uint32_t)[dataArray count])];
}

@end
