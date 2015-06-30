//
//  UIImage+STLib.m
//  algeron
//
//  Created by StPashik on 09.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import "UIImage+STLib.h"

@implementation UIImage (STLib)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)radialGradientImage:(CGSize)size
                      startColor:(UIColor *)startColor
                        endColor:(UIColor *)endColor
{
    // Initialise
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    
    // Create the gradient's colours
    size_t numLocations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    
    CGFloat startRed, startGreen, startBlue, startAlpha, endRed, endGreen, endBlue, endAlpha;
    [startColor getRed:&startRed green:&startGreen blue:&startBlue alpha:&startAlpha];
    [endColor getRed:&endRed green:&endGreen blue:&endBlue alpha:&endAlpha];
    
    CGFloat components[8] = { startRed, startGreen, startBlue, startAlpha, endRed, endGreen, endBlue, endAlpha };
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents (colorSpace, components, locations, numLocations);
    
    // Normalise the 0-1 ranged inputs to the width of the image
    CGPoint center = CGPointMake(size.width / 2, size.height / 2);
    CGFloat radius = MIN(size.width / 2, size.height / 2);
    
    // Draw it!
    CGContextDrawRadialGradient(UIGraphicsGetCurrentContext(), gradient, center, 0, center, radius, kCGGradientDrawsAfterEndLocation);
    
    // Grab it as an autoreleased image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Clean up
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)coloredImageWithColor:(UIColor *)color
{
    CGSize size = self.size;
    
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [color setFill];
    
    CGContextTranslateCTM(context, 0, size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextClipToMask(context, CGRectMake(0, 0, size.width, size.height), [self CGImage]);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    
    UIImage *coloredImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return coloredImage;
}

+ (UIImage *)roundedImageWithFillColor:(UIColor *)fillColor
                           borderColor:(UIColor *)borderColor
                                  size:(CGSize)size
                                border:(CGFloat)border
{
    CGRect rect = CGRectMake(0, 0, size.width + border, size.height + border);
    CGFloat radius = MIN(rect.size.width / 2, rect.size.height / 2);

    // Begin a new image that will be the new image with the rounded corners
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    
    [borderColor setStroke];
    [fillColor setFill];
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                          cornerRadius:radius];
    [borderPath setLineWidth:border];
    [borderPath addClip];
    [borderPath fill];
    [borderPath stroke];
    
    // Get the rounded image
    UIImage *roundedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    return roundedImage;
}

- (UIImage *)imageTintedWithColor:(UIColor *)color
{
    // This method is designed for use with template images, i.e. solid-coloured mask-like images.
    return [self imageTintedWithColor:color fraction:0.0]; // default to a fully tinted mask of the image.
}


- (UIImage *)imageTintedWithColor:(UIColor *)color fraction:(CGFloat)fraction
{
    if (color) {
        // Construct new image the same size as this one.
        UIImage *image;
        
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_0
        if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
            UIGraphicsBeginImageContextWithOptions([self size], NO, 0.f); // 0.f for scale means "scale for device's main screen".
        } else {
            UIGraphicsBeginImageContext([self size]);
        }
#else
        UIGraphicsBeginImageContext([self size]);
#endif
        CGRect rect = CGRectZero;
        rect.size = [self size];
        
        // Composite tint color at its own opacity.
        [color set];
        UIRectFill(rect);
        
        // Mask tint color-swatch to this image's opaque mask.
        // We want behaviour like NSCompositeDestinationIn on Mac OS X.
        [self drawInRect:rect blendMode:kCGBlendModeDestinationIn alpha:1.0];
        
        // Finally, composite this image over the tinted mask at desired opacity.
        if (fraction > 0.0) {
            // We want behaviour like NSCompositeSourceOver on Mac OS X.
            [self drawInRect:rect blendMode:kCGBlendModeSourceAtop alpha:fraction];
        }
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image;
    }
    
    return self;
}

@end
