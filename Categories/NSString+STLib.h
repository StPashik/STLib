//
//  NSString+STLib.h
//  algeron
//
//  Created by StPashik on 11.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (STLib)

- (BOOL)notEmpty;

- (NSString *)stringByRemovingSpaces;
- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
- (CGFloat)heightWithFont:(UIFont *)font;
- (CGFloat)widthWithFont:(UIFont *)font;

- (NSString *)sha1;

- (NSString *)stringByStrippingHTML;
- (NSString *)stringByDecodedHTMLSymbols;

- (NSString *)unformattedPhoneNumber;

@end
