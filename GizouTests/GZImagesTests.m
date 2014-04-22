//
//  GZImagesTests.m
//  GizouTests
//
//  Created by John Tumminaro on 4/22/14.
//
//

#import <XCTest/XCTest.h>
#import "Gizou.h"
#import "UIImage+GZImages.h"

@interface GZImagesTests : XCTestCase

@end

@implementation GZImagesTests

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

- (void)testImageColor
{
    UIImage *image = [UIImage imageWithColor:[UIColor redColor]];
    XCTAssert(image, @"There must be an image");
}

- (void)testImageColorWithSize
{
    UIImage *image = [UIImage imageWithColor:[UIColor redColor] andSize:CGSizeMake(100, 100)];
    XCTAssert(image, @"There must be an image");
    XCTAssert(image.size.height == 100 && image.size.width == 100, @"The size must be 100x100");
}

- (void)testRandomImage
{
    UIImage *randomImage = [UIImage randomImage];
    XCTAssert(randomImage, @"There must be an image");
}

- (void)testRandomImageSize
{
    UIImage *randomImage = [UIImage randomImageWithSize:CGSizeMake(100, 100)];
    XCTAssert(randomImage, @"There must be an image");
    XCTAssert(randomImage.size.height == 200 && randomImage.size.width == 200, @"The size must be 100x100");
}

@end
