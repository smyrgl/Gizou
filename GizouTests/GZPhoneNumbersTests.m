//
//  GZPhoneNumbersTests.m
//  GizouTests
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import <XCTest/XCTest.h>
#import "Gizou.h"

@interface GZPhoneNumbersTests : XCTestCase

@end

@implementation GZPhoneNumbersTests

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

- (void)testPhoneNumber
{
    NSString *phoneNumber = [GZPhoneNumbers phoneNumber];
    XCTAssert(phoneNumber, @"There must be a phone number");
    XCTAssert(phoneNumber.length > 0, @"The length must be greater than zero");
}

@end
