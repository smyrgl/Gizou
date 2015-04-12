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
    NSString *characters = [GZWords characters:5];
    XCTAssert(characters, @"There must be characters");
    XCTAssert(characters.length == 5, @"The length must be 5");
}

- (void)testNumbers
{
    NSString *numbers = [GZWords numbers:5];
    XCTAssert(numbers, @"There must be numbers");
    XCTAssert(numbers.length == 5, @"The length must be 5");
}

- (void)testSentence
{
    NSString *sentence = [GZWords sentence];
    XCTAssert(sentence, @"There must be a sentence");
    XCTAssert(sentence.length > 0, @"The length must not be zero");
    int count = (int)sentence.length;
    sentence = [sentence stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    XCTAssert(sentence.length == count, @"There should be no whitespace");
}

- (void)testSentences
{
    NSString *sentence = [GZWords sentence];
    XCTAssert(sentence, @"There must be a sentence");
}

- (void)testSentenceWithSetNumberOfWords
{
    NSString *sentence = [GZWords sentenceWithNumberOfWords:6];
    XCTAssert(sentence, @"There must be a sentence");
}

- (void)testParagraph
{
    NSString *paragraph = [GZWords paragraph];
    XCTAssert(paragraph, @"There must be a paragraph");
}

- (void)testParagraphs
{
    NSString *paragraphs = [GZWords paragraphs];
    XCTAssert(paragraphs, @"There must be paragraphs");
}

- (void)testParagraphWithNumberOfSentences
{
    NSString *paragraphs = [GZWords paragraphWithNumberOfSentences:5];
    XCTAssert(paragraphs, @"There must be paragraphs");
}

- (void)testNumberOfParagraphs
{
    NSString *paragraphs = [GZWords paragraphs:5];
    XCTAssert(paragraphs, @"There must be paragraphs");
}

@end
