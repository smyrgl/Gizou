//
//  GZSetupTests.m
//  GizouTests
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import <XCTest/XCTest.h>
#import "Gizou.h"

@interface GZSetupTests : XCTestCase

@end

@implementation GZSetupTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSupportedLanguages
{
    NSSet *supportedLanguages = [GZDataManager availableLanguages];
    XCTAssert(supportedLanguages, @"There must be a set of supported languages");
    XCTAssert([supportedLanguages containsObject:@"en"], @"Must contian english");
}

- (void)testCurrentLanguage
{
    NSString *currentLanguage = [GZDataManager currentLanguage];
    XCTAssert(currentLanguage, @"There must be a current language");
    XCTAssert([[GZDataManager availableLanguages] containsObject:currentLanguage], @"The set language must be in the support languages list");
}

- (void)testSetNewLanguage
{
    
}

- (void)testSetInvalidLanguage
{
    
}

@end
