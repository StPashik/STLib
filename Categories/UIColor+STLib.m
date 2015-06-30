//
//  UIColor+STLib.m
//
//  Created by StPashik on 09.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import "UIColor+STLib.h"

@implementation UIColor (STLib)

#pragma mark - Class methods

+ (UIColor *)colorWithHex:(NSUInteger)hex
{
    return [self colorWithHex:hex alpha:1.];
}

+ (UIColor *)colorWithHex:(NSUInteger)hex alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((CGFloat)((hex & 0xFF0000) >> 16))/255.0 green:((CGFloat)((hex & 0xFF00) >> 8))/255.0 blue:((CGFloat)(hex & 0xFF))/255.0 alpha:alpha];
}

- (long)hexValue
{
    CGFloat r, g, b, a;
    if (![self getRed: &r green: &g blue: &b alpha: &a])
        return 0;
    
    return (lrint(r * 0xFF) << 16) | (lrint(g * 0xFF) << 8) | (lrint(b * 0xFF));
}

@end
