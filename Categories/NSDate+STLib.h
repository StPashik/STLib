//
//  NSDate+STLib.h
//  algeron
//
//  Created by StPashik on 22.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (STLib)

- (BOOL)isLaterThanOrEqualTo:(NSDate*)date;
- (BOOL)isEarlierThanOrEqualTo:(NSDate*)date;
- (BOOL)isLaterThan:(NSDate*)date;
- (BOOL)isEarlierThan:(NSDate*)date;

- (NSDate *)withOutTime;
- (NSInteger)differenceFromDate:(NSDate *)date interval:(NSInteger)interval;

- (NSString *)afterDate:(NSDate *)date dateFormat:(NSString *)dateFormat;
- (NSString *)formattedStringWithFormat:(NSString *)format;

@end
