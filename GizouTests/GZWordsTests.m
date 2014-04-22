//
//  GZWordsTests.m
//  GizouTests
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import <XCTest/XCTest.h>
#import "Gizou.h"

@interface GZWordsTests : XCTestCase

@end

@implementation GZWordsTests

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

- (void)testWord
{
    NSString *word = [GZWords word];
    XCTAssert(word, @"There must be a word");
    XCTAssert(word.length > 0, @"The length must be greater than zero");
    int count = (int)word.length;
    word = [word stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    XCTAssert(word.length == count, @"There should be no whitespace");
}

- (void)testWordsByLength
{
    NSString *words = [GZWords words:5];
    XCTAssert(words, @"There must be a word");
    XCTAssert(words.length > 0, @"The length must be greater than zero");
    int count = (int)words.length;
    words = [words stringByReplacingOccurrencesOfString:@" " withString:@""];
    XCTAssert(words.length == count - 4, @"There should be four whitespaces");
}

- (void)testCharacters
{
    
}

- (void)testNumbers
{
    
}

- (void)testSentence
{
    
}

- (void)testSentences
{
    
}

- (void)testSentenceWithSetNumberOfWords
{
    
}

- (void)testParagraph
{
    
}

- (void)testParagraphs
{
    
}

- (void)testParagraphWithNumberOfSentences
{
    
}

- (void)testNumberOfParagraphs
{
    
}

@end
