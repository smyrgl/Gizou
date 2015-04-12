//
//  GZFaker.m
//  
//
//  Created by John Tumminaro on 4/18/14.
//
//

#import "GZDataManager.h"
#import "GZConstants.h"
#import "GZDataManager+GZPrivateDataRequests.h"

@interface GZDataManager ()

@property (nonatomic, copy) NSString *currentLanguage;
@property (nonatomic, copy) NSDictionary *dataDictionary;
@property (nonatomic, copy) NSSet *supportedLanguages;

@end

@implementation GZDataManager

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"gizou_data_bundle" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        self.dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        self.currentLanguage = @"en";
        self.supportedLanguages = [NSSet setWithArray:[self.dataDictionary allKeys]];
    }
    return self;
}

#pragma mark - External class methods

+ (NSString *)currentLanguage
{
    return [[self sharedManager] currentLanguage];
}

+ (NSSet *)availableLanguages
{
    return [[self sharedManager] supportedLanguages];
}

+ (void)setLanguage:(NSString *)language
{
    NSParameterAssert(language);
    NSAssert([[[self sharedManager] supportedLanguages] containsObject:language], @"%@ is not a supported language", language);
    [[self sharedManager] setCurrentLanguage:language];
}

#pragma mark - Internal instance methods

- (void)setCurrentLanguage:(NSString *)currentLanguage
{
    _currentLanguage = currentLanguage;
}


#pragma mark - Private


@end
