//
//  GZWords.m
//  
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import "GZWords.h"
#import "GZDataManager+GZPrivateDataRequests.h"
#import "GZConstants.h"
#import "GZUtilityFunctions.h"

@implementation GZWords

+ (NSString *)word
{
    return [GZDataManager getRandomStringForKey:GZDataWordsKey];
}

+ (NSString *)words:(NSInteger)numberOfWords
{
    NSMutableArray *wordArray = [NSMutableArray new];
    for (int i = 0; i < numberOfWords; i++) {
        [wordArray addObject:[GZWords word]];
    }
    
    return [wordArray componentsJoinedByString:@" "];
}

+ (NSString *)characters:(NSInteger)numberOfCharacters
{
    NSMutableArray *characters = [NSMutableArray new];
    
    for (int i=0; i<numberOfCharacters; i++)
        [characters addObject:[NSString stringWithFormat:@"%c", arc4random()%(122-97) + 97]];
    
    return [characters componentsJoinedByString:@""];
}

+ (NSString *)numbers:(NSInteger)numberOfNumbers
{
    NSMutableArray *numbers = [NSMutableArray new];
    
    for (int i=0; i<numberOfNumbers; i++)
        [numbers addObject:[NSString stringWithFormat:@"%i", arc4random()%10]];
    
    return [numbers componentsJoinedByString:@""];
}

+ (NSString *)sentence
{
    return [self sentenceWithNumberOfWords:arc4random_uniform(6) + 4];
}

+ (NSString *)sentenceWithNumberOfWords:(NSInteger)numberOfWords
{
    NSMutableArray* words = [NSMutableArray new];
    
    [words addObject:[[self word] capitalizedString]];
    
    for (int i = 1; i < numberOfWords; i++) {
        [words addObject:[self word]];
    }
    
    NSString* sentence = [words componentsJoinedByString:@" "];
    sentence = [sentence stringByAppendingString:@"."];
    
    return sentence;
}

+ (NSString *)sentences:(NSInteger)numberOfSentences
{
    NSMutableArray *sentences = [NSMutableArray new];
    
    for (int i = 0; i < numberOfSentences; i++) {
        [sentences addObject:[self sentence]];
    }
    
    return [sentences componentsJoinedByString:@" "];
}

+ (NSString *)paragraph
{
    return [self paragraphWithNumberOfSentences:arc4random_uniform(6) + 3];
}

+ (NSString *)paragraphWithNumberOfSentences:(NSInteger)numberOfSentences
{
    return [self sentences:numberOfSentences];
}

+ (NSString *)paragraphs
{
    return [self paragraphs:arc4random_uniform(6) + 3];
}

+ (NSString *)paragraphs:(NSInteger)numberOfParagraphs
{
    NSMutableArray *paragraphs = [NSMutableArray new];
    
    for (int i = 0; i < numberOfParagraphs; i++) {
        [paragraphs addObject:[self paragraph]];
    }
    
    return [paragraphs componentsJoinedByString:@"\n"];
}

@end
