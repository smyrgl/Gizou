//
//  UIImage+GZFakeImages.h
//  
//
//  Created by John Tumminaro on 4/18/14.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (GZImages)

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;

+ (UIImage *)randomImage;
+ (UIImage *)randomImageWithSize:(CGSize)size;

+ (void)randomImageAsyncWithCompletion:(void (^)(UIImage *image))completion;
+ (void)randomImageAsyncWithSize:(CGSize)size completion:(void (^)(UIImage *image))completion;

@end
