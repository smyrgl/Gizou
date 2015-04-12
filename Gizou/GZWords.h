//
//  GZWords.h
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import <Foundation/Foundation.h>

/**
 *  Creates lorem ipsum style sample text good for all your testing needs.
 */

@interface GZWords : NSObject

///-------------
/// @name Simple
///-------------

/**
*  Creates a single word.
*
*  @return Word string.
*/

+ (NSString *)word;

/**
 *  Creates a single sentence with lorem ipsum style text.
 *
 *  @return Sentence string.
 */

+ (NSString *)sentence;

/**
 *  Creates a single paragraph of lorem ipsum style text.
 *
 *  @return Paragraph string.
 */

+ (NSString *)paragraph;

/**
 *  Creates a small number of paragraphs of lorem ipsum style text.
 *
 *  @return Paragraphs string.
 */

+ (NSString *)paragraphs;

///---------------
/// @name Advanced
///---------------

/**
 *  Creates a string of random characters of the specified quantity.
 *
 *  @param numberOfCharacters Number of characters you want the string to have.
 *
 *  @return String of random characters.
 */

+ (NSString *)characters:(NSInteger)numberOfCharacters;

/**
 *  Creates a string of random numbers of the specified quantity.
 *
 *  @param numberOfNumbers Number of numbers that you want the string to have.
 *
 *  @return String of random numbers.
 */

+ (NSString *)numbers:(NSInteger)numberOfNumbers;

/**
 *  Creates a string of lorem ipsum style words of the specified quanitity seperated by a single white space.
 *
 *  @param numberOfWords Number of words you want to create.
 *
 *  @return String of words.
 */

+ (NSString *)words:(NSInteger)numberOfWords;

/**
 *  Creates a string composing a sentences of lorem ipsum style text with the number of words requested.  Adds a single white space between words and a period at the end of the string.
 *
 *  @param numberOfWords Number of words you want the sentence to have.
 *
 *  @return String of words in a sentence format.
 */

+ (NSString *)sentenceWithNumberOfWords:(NSInteger)numberOfWords;

/**
 *  Creates a string with a specified number of sentences with lorem ipsum style text.  Sentences are properly formatted but there are no line breaks.
 *
 *  @param numberOfSentences Number of sentences you want.
 *
 *  @return String of sentences.
 */

+ (NSString *)sentences:(NSInteger)numberOfSentences;

/**
 *  Creates a string containing a formatted paragraph with lorem ipsum style text with a line break at the end.
 *
 *  @param numberOfSentences Number of sentences you want in the paragraph.
 *
 *  @return String with a single paragraph.
 */

+ (NSString *)paragraphWithNumberOfSentences:(NSInteger)numberOfSentences;

/**
 *  Creates a string with a specified number of paragraphs of lorem ipsum style text, each seperated by a line break.
 *
 *  @param numberOfParagraphs Number of paragraphs you want to create.
 *
 *  @return String containing the paragraphs.
 */

+ (NSString *)paragraphs:(NSInteger)numberOfParagraphs;

@end
