//
//  GZCategoryTests.m
//  GizouTests
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import <XCTest/XCTest.h>
#import "NSString+GZStrings.h"
#import "CLLocation+GZLocations.h"

@interface GZCategoryTests : XCTestCase

@end

@implementation GZCategoryTests

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

- (void)testFakeName
{
    NSString *test = [NSString fakeName];
    XCTAssert(test, @"There must be a test string");
    XCTAssert(test.length > 0, @"Length must be greater than 0");
}

- (void)testFakeFirstName
{
    NSString *test = [NSString fakeFirstName];
    XCTAssert(test, @"There must be a test string");
    XCTAssert(test.length > 0, @"Length must be greater than 0");
}

- (void)testFakeLastName
{
    NSString *test = [NSString fakeLastName];
    XCTAssert(test, @"There must be a test string");
    XCTAssert(test.length > 0, @"Length must be greater than 0");
}

- (void)testFakeFullAddress
{
    NSString *test = [NSString fakeFullAddress];
    XCTAssert(test, @"There must be a test string");
    XCTAssert(test.length > 0, @"Length must be greater than 0");
}

- (void)testFakeStreetAddress
{
    NSString *test = [NSString fakeStreetAddress];
    XCTAssert(test, @"There must be a test string");
    XCTAssert(test.length > 0, @"Length must be greater than 0");
}

- (void)testFakeCity
{
    NSString *test = [NSString fakeCity];
    XCTAssert(test, @"There must be a test string");
    XCTAssert(test.length > 0, @"Length must be greater than 0");
}

- (void)testFakeZipCode
{
    NSString *test = [NSString fakeZipCode];
    XCTAssert(test, @"There must be a test string");
    XCTAssert(test.length > 0, @"Length must be greater than 0");
}

- (void)testFakeStateCode
{
    NSString *test = [NSString fakeStateCode];
    XCTAssert(test, @"There must be a test string");
    XCTAssert(test.length > 0, @"Length must be greater than 0");
}

- (void)testFakeStateName
{
    NSString *test = [NSString fakeStateName];
    XCTAssert(test, @"There must be a test string");
    XCTAssert(test.length > 0, @"Length must be greater than 0");
}

- (void)testFakeCountry
{
    NSString *test = [NSString fakeCountry];
    XCTAssert(test, @"There must be a test string");
    XCTAssert(test.length > 0, @"Length must be greater than 0");
}

- (void)testFakeLatitude
{
    NSString *test = [NSString fakeLatitudeString];
    XCTAssert(test, @"There must be a test string");
    XCTAssert(test.length > 0, @"Length must be greater than 0");
}

- (void)testFakeLongitude
{
    NSString *test = [NSString fakeLongitudeString];
    XCTAssert(test, @"There must be a test string");
    XCTAssert(test.length > 0, @"Length must be greater than 0");
}

- (void)testFakeCharacters
{
    NSString *test = [NSString stringWithFakeCharacters];
    XCTAssert(test, @"There must be a test string");
    XCTAssert(test.length > 0, @"Length must be greater than 0");
}

- (void)testFakeWords
{
    NSString *test = [NSString stringWithFakeWords];
    XCTAssert(test, @"There must be a test string");
    XCTAssert(test.length > 0, @"Length must be greater than 0");
}

- (void)testFakeSentences
{
    NSString *test = [NSString stringWithFakeSentences];
    XCTAssert(test, @"There must be a test string");
    XCTAssert(test.length > 0, @"Length must be greater than 0");
}

- (void)testFakeParagraphs
{
    NSString *test = [NSString stringWithFakeParagraphs];
    XCTAssert(test, @"There must be a test string");
    XCTAssert(test.length > 0, @"Length must be greater than 0");
}

- (void)testFakeCharactersWithCount
{
    NSString *test = [NSString stringWithNumberOfFakeCharacters:5];
    XCTAssert(test, @"There must be a test string");
    XCTAssert(test.length == 5, @"Length must be equal to 5");
}

- (void)testFakeWordsWithCount
{
    NSString *test = [NSString stringWithNumberOfFakeWords:5];
    XCTAssert(test, @"There must be a test string");
    XCTAssert(test.length > 0, @"Length must be greater than 0");
}

- (void)testFakeSentencesWithCount
{
    NSString *test = [NSString stringWithNumberOfFakeSentences:5];
    XCTAssert(test, @"There must be a test string");
    XCTAssert(test.length > 0, @"Length must be greater than 0");
}

- (void)testFakeParagraphsWithCount
{
    NSString *test = [NSString stringWithNumberOfFakeParagraphs:5];
    XCTAssert(test, @"There must be a test string");
    XCTAssert(test.length > 0, @"Length must be greater than 0");
}

@end
