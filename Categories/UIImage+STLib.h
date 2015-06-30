//
//  UIImage+STLib.h
//  algeron
//
//  Created by StPashik on 09.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (STLib)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)radialGradientImage:(CGSize)size
                      startColor:(UIColor *)startColor
                        endColor:(UIColor *)endColor;

+ (UIImage *)roundedImageWithFillColor:(UIColor *)fillColor
                           borderColor:(UIColor *)borderColor
                                  size:(CGSize)size
                                border:(CGFloat)border;

- (UIImage *)coloredImageWithColor:(UIColor *)color;

- (UIImage *)imageTintedWithColor:(UIColor *)color;
- (UIImage *)imageTintedWithColor:(UIColor *)color fraction:(CGFloat)fraction;

@end
