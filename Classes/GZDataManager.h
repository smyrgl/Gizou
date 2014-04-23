//
//  GZFaker.h
//  
//
//  Created by John Tumminaro on 4/18/14.
//
//

#import <Foundation/Foundation.h>

/**
 *  GZDataManager represents control over the entire Gizou library.  If you want to switch languages from the default english you can do it here.
 */

@interface GZDataManager : NSObject

///------------------------
/// @name Language settings
///------------------------

/**
 *  List of the avaiable languages.
 *
 *  @return Set containing the available language codes.
 */

+ (NSSet *)availableLanguages;

/**
 *  Current language being used, default is "en".
 *
 *  @return Language code currently being used.
 */

+ (NSString *)currentLanguage;

/**
 *  Sets Gizou to use a different language code.  It must be a code that is in the `availableLanguages` set.
 *
 *  @param language String with the language code you want to switch to.
 */

+ (void)setLanguage:(NSString *)language;

@end
