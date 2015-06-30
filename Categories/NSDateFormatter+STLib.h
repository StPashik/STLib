//
//  NSDateFormatter+STLib.h
//  algeron
//
//  Created by StPashik on 09.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSDateFormatter (STLib)

/**
 *  Creates and returns instance with given date format;
 *
 *  @param aDateFormat date format
 *
 *  @return instance
 */
+ (NSDateFormatter *)dateFormatterWithDateFormat:(NSString *)aDateFormat;

@end
