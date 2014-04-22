//
//  UIImage+GZFakeImages.m
//  
//
//  Created by John Tumminaro on 4/18/14.
//
//

#import "UIImage+GZImages.h"
#import "GZUtilityFunctions.h"
#import "GZIOSFunctions.h"

static NSString * const kGizouRandomImageURLString = @"http://randomimage.setgetgo.com/get.php";

@implementation UIImage (GZImages)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    return [self imageWithColor:color andSize:CGSizeMake(1, 1)];
}

+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size
{
    UIImage *img = nil;
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,
                                   color.CGColor);
    CGContextFillRect(context, rect);
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

+ (UIImage *)randomImage
{
    return [self randomImageWithSize:CGSizeMake(100, 100)];
}

+ (UIImage *)randomImageWithSize:(CGSize)size
{
    NSAssert(size.height <= 2000, @"Height must not be greater than 2000 points");
    NSAssert(size.width <= 2000, @"Width must not be greater than 2000 points");
    
    NSString *heightString;
    NSString *widthString;
    
    if (isRetina()) {
        heightString = [NSString stringWithFormat:@"%f", size.height * 2];
        widthString = [NSString stringWithFormat:@"%f", size.width * 2];
    } else {
        heightString = [NSString stringWithFormat:@"%f", size.height];
        widthString = [NSString stringWithFormat:@"%f", size.width];
    }
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?height=%@&width=%@", kGizouRandomImageURLString, heightString, widthString]]];
    NSAssert([NSURLConnection canHandleRequest:request], @"The request cannot be handled, check to make sure you have network connectivity");
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                          returningResponse:nil
                                      error:&error];
    NSAssert(!error, @"There must not be an error");
    return [UIImage imageWithData:data];
}

+ (void)randomImageAsyncWithCompletion:(void (^)(UIImage *image))completion
{
    [self randomImageAsyncWithSize:CGSizeMake(100, 100) completion:completion];
}

+ (void)randomImageAsyncWithSize:(CGSize)size completion:(void (^)(UIImage *image))completion
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        UIImage *image = [UIImage randomImageWithSize:size];
        completion(image);
    });
}

@end
