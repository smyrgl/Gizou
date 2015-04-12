//
//  GZInternetTests.m
//  GizouTests
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import <XCTest/XCTest.h>
#import "Gizou.h"

@interface GZInternetTests : XCTestCase

+ (BOOL)validateEmail:(NSString *)email;
+ (BOOL)validateIPAddress:(NSString *)ipAddress;

@end

@implementation GZInternetTests

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

- (void)testEmail
{
    NSString *email = [GZInternet email];
    XCTAssert(email, @"There must be an email");
    XCTAssert(email.length > 0, @"The length must be greater than zero");
    XCTAssertTrue([GZInternetTests validateEmail:email], @"The email must be a valid format");
}

- (void)testEmailWithCustomDomain
{
    NSString *email = [GZInternet emailWithCustomDomain:@".jerks.com"];
    XCTAssert(email, @"There must be an email");
    XCTAssert(email.length > 0, @"The length must be greater than zero");
    XCTAssertTrue([GZInternetTests validateEmail:email], @"The email must be a valid format");
}

- (void)testUsername
{
    NSString *username = [GZInternet username];
    XCTAssert(username, @"There must be a username");
    XCTAssert(username.length > 0, @"The length must be greater than zero");
}

- (void)testDomainName
{
    NSString *domain = [GZInternet domainName];
    XCTAssert(domain, @"There must be a domain name");
    XCTAssert(domain.length > 0, @"The length must be greater than zero");
}

- (void)testDomainSuffix
{
    NSString *domainSuffix = [GZInternet domainSuffix];
    XCTAssert(domainSuffix, @"There must be a domain suffix");
    XCTAssert(domainSuffix.length > 0, @"The length must be greater than zero");
}

- (void)testipV4Address
{
    NSString *ipV4 = [GZInternet ipV4Address];
    XCTAssertTrue([GZInternetTests validateIPAddress:ipV4], @"IP address must be valid");
}

- (void)testipV6Address
{
    NSString *ipV6 = [GZInternet ipv6Address];
    XCTAssertTrue([GZInternetTests validateIPAddress:ipV6], @"IP address must be valid");
}

- (void)testURL
{
    NSString *url = [GZInternet url];
    XCTAssert(url, @"There must be a url");
    XCTAssert(url.length > 0, @"The length must be greater than zero");
}

- (void)testEmailSequence
{
    NSArray *emailSequence = [GZInternet emailSequenceWithCount:10];
    XCTAssert(emailSequence, @"There must be an email sequence array");
    XCTAssert(emailSequence.count == 10, @"The sequence count must equal 10");
    
    for (NSString *email in emailSequence) {
        XCTAssertTrue([GZInternetTests validateEmail:email], @"The email must be a valid format which %@ is not", email);
    }
    
    NSSet *emailSet = [NSSet setWithArray:emailSequence];
    XCTAssert(emailSet.count == emailSequence.count, @"All emails must be unique");
}

- (void)testUsernameSequence
{
    NSArray *usernameSequence = [GZInternet usernameSequenceWithCount:10];
    XCTAssert(usernameSequence, @"There must be a username sequence array");
    XCTAssert(usernameSequence.count == 10, @"The sequence count must equal 10");
    NSSet *usernameSet = [NSSet setWithArray:usernameSequence];
    XCTAssert(usernameSet.count == usernameSequence.count, @"All usernames must be unique");
}

- (void)testipV4Sequence
{
    NSArray *ipV4Sequence = [GZInternet ipV4AddressSequenceWithCount:10];
    XCTAssert(ipV4Sequence, @"There must be an ip address sequence array");
    XCTAssert(ipV4Sequence.count == 10, @"The sequence count must equal 10");
    
    for (NSString *ipAddress in ipV4Sequence) {
        XCTAssertTrue([GZInternetTests validateIPAddress:ipAddress], @"The ip address must be a valid format");
    }
    
    NSSet *ipSet = [NSSet setWithArray:ipV4Sequence];
    XCTAssert(ipSet.count == ipV4Sequence.count, @"All ip addresses must be unique");
}

- (void)testipV6Sequence
{
    NSArray *ipV6Sequence = [GZInternet ipV6AddressSequenceWithCount:10];
    XCTAssert(ipV6Sequence, @"There must be an ip address sequence array");
    XCTAssert(ipV6Sequence.count == 10, @"The sequence count must equal 10");
    
    for (NSString *ipAddress in ipV6Sequence) {
        XCTAssertTrue([GZInternetTests validateIPAddress:ipAddress], @"The ip address must be a valid format");
    }
    
    NSSet *ipSet = [NSSet setWithArray:ipV6Sequence];
    XCTAssert(ipSet.count == ipV6Sequence.count, @"All ip addresses must be unique");
}

+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:email];
}

+ (BOOL)validateIPAddress:(NSString *)ipAddress
{
    NSString *ipRegex = @"^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$";
    NSString *ipV6Regex = @"(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]).){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]).){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))";
    NSPredicate *ipTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@ OR SELF MATCHES %@", ipRegex, ipV6Regex];
    
    return [ipTest evaluateWithObject:ipAddress];
}

@end
