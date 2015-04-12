//
//  GZNamesTests.m
//  GizouTests
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import <XCTest/XCTest.h>
#import "Gizou.h"

@interface GZNamesTests : XCTestCase

@end

@implementation GZNamesTests

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

- (void)testGetFullName
{
    NSString *name = [GZNames name];
    XCTAssert(name, @"There must be a name");
    XCTAssert(name.length > 0, @"The length must be greater than zero");
}

- (void)testGetFirstName
{
    NSString *firstName = [GZNames firstName];
    XCTAssert(firstName, @"There must be a first name");
    XCTAssert(firstName.length > 0, @"The length must be greater than zero");
}

- (void)testGetLastName
{
    NSString *lastName = [GZNames lastName];
    XCTAssert(lastName, @"There must be a last name");
    XCTAssert(lastName.length > 0, @"The length must be greater than zero");
}

- (void)testGetPrefix
{
    NSString *prefix = [GZNames prefix];
    XCTAssert(prefix, @"There must be a prefix");
    XCTAssert(prefix.length > 0, @"The length must be greater than zero");
}

- (void)testGetSuffix
{
    NSString *suffix = [GZNames suffix];
    XCTAssert(suffix, @"There must be a suffix");
    XCTAssert(suffix.length > 0, @"The length must be greater than zero");
}

- (void)testFullNameSequence
{
    NSArray *testNameSequence = [GZNames nameSequenceWithCount:10];
    XCTAssert(testNameSequence, @"There must be a test name sequence array");
    XCTAssert(testNameSequence.count == 10, @"The sequence count must equal 10");
}

- (void)testFirstNameSequence
{
    NSArray *firstNameSequence = [GZNames firstNameSequenceWithCount:10];
    XCTAssert(firstNameSequence, @"There must be a first name sequence array");
    XCTAssert(firstNameSequence.count == 10, @"The sequence count must equal 10");
}

- (void)testLastNameSequence
{
    NSArray *lastNameSequence = [GZNames lastNameSequenceWithCount:10];
    XCTAssert(lastNameSequence, @"There must be a last name sequence array");
    XCTAssert(lastNameSequence.count == 10, @"The sequence count must equal 10");
}

@end
