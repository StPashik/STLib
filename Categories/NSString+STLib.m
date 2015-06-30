//
//  NSString+STLib.m
//  algeron
//
//  Created by StPashik on 11.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import "NSString+STLib.h"

#import <CommonCrypto/CommonDigest.h>

@implementation NSString (STLib)

- (BOOL)notEmpty
{
    return ![self isEqualToString:@""];
}

- (NSString *)stringByRemovingSpaces
{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width
{
    CGFloat height = ceil([self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                          attributes:@{ NSFontAttributeName : font }
                                             context:nil].size.height);
    
    return height;
}

- (CGFloat)heightWithFont:(UIFont *)font
{
    CGFloat height = ceil([self sizeWithAttributes:@{ NSFontAttributeName : font }].height);
    
    return height;
}

- (CGFloat)widthWithFont:(UIFont *)font
{
    CGFloat width = ceil([self sizeWithAttributes:@{ NSFontAttributeName : font }].width);
    
    return width;
}

- (NSString *)sha1
{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
 	uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
 	CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
 	NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
 	for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
 	return output;
}

- (NSString *)stringByStrippingHTML
{
    NSRange r;
    NSString *s = [self copy];
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
}

- (NSString *)stringByDecodedHTMLSymbols
{
    if ([self rangeOfString:@"&"].location == NSNotFound)
    {
        return self;
    }
    
    NSMutableString *escapedString = [NSMutableString stringWithString:self];
    
    NSArray *codes = [NSArray arrayWithObjects:
                      @"&nbsp;", @"&iexcl;", @"&cent;", @"&pound;", @"&curren;", @"&yen;", @"&brvbar;",
                      @"&sect;", @"&uml;", @"&copy;", @"&ordf;", @"&laquo;", @"&not;", @"&shy;", @"&reg;",
                      @"&macr;", @"&deg;", @"&plusmn;", @"&sup2;", @"&sup3;", @"&acute;", @"&micro;",
                      @"&para;", @"&middot;", @"&cedil;", @"&sup1;", @"&ordm;", @"&raquo;", @"&frac14;",
                      @"&frac12;", @"&frac34;", @"&iquest;", @"&Agrave;", @"&Aacute;", @"&Acirc;",
                      @"&Atilde;", @"&Auml;", @"&Aring;", @"&AElig;", @"&Ccedil;", @"&Egrave;",
                      @"&Eacute;", @"&Ecirc;", @"&Euml;", @"&Igrave;", @"&Iacute;", @"&Icirc;", @"&Iuml;",
                      @"&ETH;", @"&Ntilde;", @"&Ograve;", @"&Oacute;", @"&Ocirc;", @"&Otilde;", @"&Ouml;",
                      @"&times;", @"&Oslash;", @"&Ugrave;", @"&Uacute;", @"&Ucirc;", @"&Uuml;", @"&Yacute;",
                      @"&THORN;", @"&szlig;", @"&agrave;", @"&aacute;", @"&acirc;", @"&atilde;", @"&auml;",
                      @"&aring;", @"&aelig;", @"&ccedil;", @"&egrave;", @"&eacute;", @"&ecirc;", @"&euml;",
                      @"&igrave;", @"&iacute;", @"&icirc;", @"&iuml;", @"&eth;", @"&ntilde;", @"&ograve;",
                      @"&oacute;", @"&ocirc;", @"&otilde;", @"&ouml;", @"&divide;", @"&oslash;", @"&ugrave;",
                      @"&uacute;", @"&ucirc;", @"&uuml;", @"&yacute;", @"&thorn;", @"&yuml;", nil];
    
    NSUInteger codesCount = [codes count];
    
    // Html
    for (NSUInteger i = 0; i < codesCount; i++)
    {
        NSRange range = [self rangeOfString:[codes objectAtIndex:i]];
        
        if (range.location != NSNotFound)
        {
            [escapedString replaceOccurrencesOfString:[codes objectAtIndex:i]
                                           withString:[NSString stringWithFormat:@"%C", (unsigned short) (160 + i)]
                                              options:NSLiteralSearch
                                                range:NSMakeRange(0, [escapedString length])];
        }
    }
    
    // The following five are not in the 160+ range
    
    // @"&amp;"
    NSRange range = [self rangeOfString:@"&amp;"];

    if (range.location != NSNotFound)
    {
        [escapedString replaceOccurrencesOfString:@"&amp;"
                                       withString:[NSString stringWithFormat:@"%C", (unsigned short) 38]
                                          options:NSLiteralSearch
                                            range:NSMakeRange(0, [escapedString length])];
    }
    
    // @"&lt;"
    range = [self rangeOfString:@"&lt;"];
    
    if (range.location != NSNotFound)
    {
        [escapedString replaceOccurrencesOfString:@"&lt;"
                                       withString:[NSString stringWithFormat:@"%C", (unsigned short) 60]
                                          options:NSLiteralSearch
                                            range:NSMakeRange(0, [escapedString length])];
    }
    
    // @"&gt;"
    range = [self rangeOfString:@"&gt;"];
    
    if (range.location != NSNotFound)
    {
        [escapedString replaceOccurrencesOfString:@"&gt;"
                                       withString:[NSString stringWithFormat:@"%C", (unsigned short) 62]
                                          options:NSLiteralSearch
                                            range:NSMakeRange(0, [escapedString length])];
    }
    
    // @"&apos;"
    range = [self rangeOfString:@"&apos;"];

    if (range.location != NSNotFound)
    {
        [escapedString replaceOccurrencesOfString:@"&apos;"
                                       withString:[NSString stringWithFormat:@"%C", (unsigned short) 39]
                                          options:NSLiteralSearch
                                            range:NSMakeRange(0, [escapedString length])];
    }
    
    // @"&quot;"
    range = [self rangeOfString:@"&quot;"];
    
    if (range.location != NSNotFound)
    {
        [escapedString replaceOccurrencesOfString:@"&quot;"
                                       withString:[NSString stringWithFormat:@"%C", (unsigned short) 34]
                                          options:NSLiteralSearch
                                            range:NSMakeRange(0, [escapedString length])];
    }
    
    // Decimal & Hex
    NSRange start, finish, searchRange = NSMakeRange(0, [escapedString length]);
    NSUInteger i = 0;
    
    while (i < [escapedString length])
    {
        start = [escapedString rangeOfString:@"&#"
                                     options:NSCaseInsensitiveSearch
                                       range:searchRange];
        
        finish = [escapedString rangeOfString:@";"
                                      options:NSCaseInsensitiveSearch
                                        range:searchRange];
        
        if (start.location != NSNotFound && finish.location != NSNotFound && finish.location > start.location)
        {
            NSRange entityRange = NSMakeRange(start.location, (finish.location - start.location) + 1);
            NSString *entity = [escapedString substringWithRange:entityRange];
            NSString *value = [entity substringWithRange:NSMakeRange(2, [entity length] - 2)];
            
            [escapedString deleteCharactersInRange:entityRange];
            
            if ([value hasPrefix:@"x"])
            {
                unsigned int tempInt = 0;
                NSScanner *scanner = [NSScanner scannerWithString:[value substringFromIndex:1]];
                [scanner scanHexInt:&tempInt];
                [escapedString insertString:[NSString stringWithFormat:@"%C", (unsigned short) tempInt] atIndex:entityRange.location];
            } else
            {
                [escapedString insertString:[NSString stringWithFormat:@"%C", (unsigned short) [value intValue]] atIndex:entityRange.location];
            } i = start.location;
        } else
        {
            i++;
        }
        searchRange = NSMakeRange(i, [escapedString length] - i);
    }
    
    return escapedString;
}

- (NSString *)unformattedPhoneNumber
{
    NSString *formattedString = nil;
    
    NSError *error = nil;
    NSRegularExpression *regExp = [NSRegularExpression regularExpressionWithPattern:@"\\D" options:0 error:&error];
    
    if (error)
    {
        NSLog(@"- [NSNumber unformattedPhoneNumber:] error: %@", error);
    } else
    {
        formattedString = [regExp stringByReplacingMatchesInString:self
                                                           options:0
                                                             range:NSMakeRange(0, self.length)
                                                      withTemplate:@""];
        formattedString = [@"+" stringByAppendingString:formattedString];
    }
    
    return formattedString;
}

@end
