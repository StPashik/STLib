//
//  UIColor+STLib.h
//
//  Created by StPashik on 09.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (STLib)

/**
 *  Color from hex value
 *
 *  @param hex hex value (0x000000)
 *
 *  @return color
 */
+ (UIColor *)colorWithHex:(NSUInteger)hex;

/**
 *  Color from hex value with alpha
 *
 *  @param hex   hex value (0x000000)
 *  @param alpha alpha value
 *
 *  @return color
 */
+ (UIColor *)colorWithHex:(NSUInteger)hex alpha:(CGFloat)alpha;

/**
 *  Hex value from color
 *
 *  @return hex value
 */
- (long)hexValue;

@end
