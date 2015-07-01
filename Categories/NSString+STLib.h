//
//  NSString+STLib.h
//
//  Created by StPashik on 11.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (STLib)

/**
 *  Check string for empty
 *
 *  @return YES/NO
 */
- (BOOL)notEmpty;

/**
 *  Clera spaces in string
 *
 *  @return claer string
 */
- (NSString *)stringByRemovingSpaces;

/**
 *  Height for string with font and accuracy width
 *
 *  @param font  string font
 *  @param width string width
 *
 *  @return string height
 */
- (CGFloat)heightWithFont:(UIFont *)font
       constrainedToWidth:(CGFloat)width;

/**
 *  Height for string with font and free width
 *
 *  @param font string font
 *
 *  @return string height
 */
- (CGFloat)heightWithFont:(UIFont *)font;

/**
 *  Width for string with font and free height
 *
 *  @param font string font
 *
 *  @return string width
 */
- (CGFloat)widthWithFont:(UIFont *)font;

/**
 *  sha1 code
 *
 *  @return sha1 string
 */
- (NSString *)sha1;

/**
 *  Delete HTML symbols from string
 *
 *  @return clear string
 */
- (NSString *)stringByStrippingHTML;

/**
 *  Decode HTML symbols
 *
 *  @return decode string
 */
- (NSString *)stringByDecodedHTMLSymbols;

/**
 *  Clear phone number
 *
 *  @return phone string
 */
- (NSString *)unformattedPhoneNumber;

@end
