//
//  GZInternet.m
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import "GZInternet.h"
#import "GZDataManager+GZPrivateDataRequests.h"
#import "GZConstants.h"
#import "GZUtilityFunctions.h"
#import "GZNames.h"

@implementation GZInternet

+ (NSString *)email
{
    return [self emailWithCustomDomain:[self domainName]];
}

+ (NSString *)emailWithCustomDomain:(NSString *)domain
{
    NSParameterAssert(domain);
    return [NSString stringWithFormat:@"%@@%@", [self username], domain];
}

+ (NSString *)username
{
    NSMutableArray* components = [[NSMutableArray alloc] init];
        
    int random = arc4random_uniform(2) + 2;
    
    for (int i = 0; i < random; i++) {
        if (i == 0) {
            [components addObject:[[GZNames firstName] stringByReplacingOccurrencesOfString:@"'" withString:@""]];
        } else if (i == 1) {
            [components addObject:[[GZNames lastName]stringByReplacingOccurrencesOfString:@"'" withString:@""]];
        } else {
            [components addObject:[NSNumber numberWithInteger:arc4random_uniform(10000)]];
        }
    }
    
    return [[components componentsJoinedByString:@"."] lowercaseString];
}

+ (NSString *)domainName
{
    return [NSString stringWithFormat:@"%@.%@", [GZNames firstName], [self domainSuffix]];
}

+ (NSString *)domainSuffix
{
    return [GZDataManager getRandomStringForKey:GZDataInternetDomainSuffixKey];
}

+ (NSString *)ipV4Address
{
    return [NSString stringWithFormat:@"%d.%d.%d.%d", 2+arc4random()%253, 2+arc4random()%253, 2+arc4random()%253, 2+arc4random()%253];
}

+ (NSString *)ipv6Address
{
    NSMutableArray* components = [[NSMutableArray alloc] initWithCapacity:8];
    
    for (int i=0; i<8; i++)
        [components addObject:[NSString stringWithFormat:@"%X", arc4random()%65535]];
    
    return [components componentsJoinedByString:@":"];
}

+ (NSString *)url
{
    return [NSString stringWithFormat:@"http://%@/%@", [self domainName], [self username]];
}

+ (NSArray *)emailSequenceWithCount:(NSUInteger)count
{
    NSMutableSet *returnSet = [NSMutableSet new];
    
    while (returnSet.count < count) {
        [returnSet addObject:[self email]];
    }
    
    return [returnSet allObjects];
}

+ (NSArray *)usernameSequenceWithCount:(NSUInteger)count
{
    NSMutableSet *returnSet = [NSMutableSet new];
    
    while (returnSet.count < count) {
        [returnSet addObject:[self username]];
    }
    
    return [returnSet allObjects];
}

+ (NSArray *)ipV4AddressSequenceWithCount:(NSUInteger)count
{
    NSMutableSet *returnSet = [NSMutableSet new];
    
    while (returnSet.count < count) {
        [returnSet addObject:[self ipV4Address]];
    }
    
    return [returnSet allObjects];
}

+ (NSArray *)ipV6AddressSequenceWithCount:(NSUInteger)count
{
    NSMutableSet *returnSet = [NSMutableSet new];
    
    while (returnSet.count < count) {
        [returnSet addObject:[self ipv6Address]];
    }
    
    return [returnSet allObjects];
}

@end
