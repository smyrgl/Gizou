//
//  GZWords.h
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import <Foundation/Foundation.h>

@interface GZWords : NSObject

+ (NSString *)word;
+ (NSString *)words:(NSInteger)numberOfWords;
+ (NSString *)characters:(NSInteger)numberOfCharacters;
+ (NSString *)numbers:(NSInteger)numberOfNumbers;
+ (NSString *)sentence;
+ (NSString *)sentenceWithNumberOfWords:(NSInteger)numberOfWords;
+ (NSString *)sentences:(NSInteger)numberOfSentences;
+ (NSString *)paragraph;
+ (NSString *)paragraphWithNumberOfSentences:(NSInteger)numberOfSentences;
+ (NSString *)paragraphs;
+ (NSString *)paragraphs:(NSInteger)numberOfParagraphs;

@end
