//
//  UIImage+STLib.h
//
//  Created by StPashik on 09.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (STLib)

/**
 *  Image from color value
 *
 *  @param color color value
 *  @param size  image size
 *
 *  @return image
 */
+ (UIImage *)imageWithColor:(UIColor *)color
                       size:(CGSize)size;

/**
 *  Gradient image from colors value
 *
 *  @param size       image size
 *  @param startColor start gradient color value
 *  @param endColor   end gradient color value
 *
 *  @return image
 */
+ (UIImage *)radialGradientImage:(CGSize)size
                      startColor:(UIColor *)startColor
                        endColor:(UIColor *)endColor;

/**
 *  Rounded image with color fill and border
 *
 *  @param fillColor   fillColor value
 *  @param borderColor borderColor value
 *  @param size        image size value
 *  @param border      border width
 *
 *  @return rounded image
 */
+ (UIImage *)roundedImageWithFillColor:(UIColor *)fillColor
                           borderColor:(UIColor *)borderColor
                                  size:(CGSize)size
                                border:(CGFloat)border;

/**
 *  Colored image with color
 *
 *  @param color color value
 *
 *  @return colored image
 */
- (UIImage *)coloredImageWithColor:(UIColor *)color;

/**
 *  Tint image with color
 *
 *  @param color tint color value
 *
 *  @return tint image
 */
- (UIImage *)imageTintedWithColor:(UIColor *)color;

/**
 *  Tint image with color and fraction
 *
 *  @param color    tint color value
 *  @param fraction fraction value
 *
 *  @return tint image
 */
- (UIImage *)imageTintedWithColor:(UIColor *)color
                         fraction:(CGFloat)fraction;

@end
