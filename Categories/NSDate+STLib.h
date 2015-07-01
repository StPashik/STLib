//
//  NSDate+STLib.h
//
//  Created by StPashik on 22.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (STLib)

/**
 *  Compere methods
 *
 *  @param date compere date
 *
 *  @return BOOL compere
 */
- (BOOL)isLaterThanOrEqualTo:(NSDate*)date;
- (BOOL)isEarlierThanOrEqualTo:(NSDate*)date;
- (BOOL)isLaterThan:(NSDate*)date;
- (BOOL)isEarlierThan:(NSDate*)date;

/**
 *  Clear time in date
 *
 *  @return clear date with time format 00:00:00
 */
- (NSDate *)withOutTime;

/**
 *  Differrence date with intervals
 *
 *  @param date     different from date
 *  @param interval interval for calculate
 *
 *  @return num of intervals
 */
- (NSInteger)differenceFromDate:(NSDate *)date interval:(NSInteger)interval;

/**
 *  "today", "tomorrow" localized formating date
 *
 *  @param date       date after calculate
 *  @param dateFormat format return string
 *
 *  @return formated date
 */
- (NSString *)afterDate:(NSDate *)date dateFormat:(NSString *)dateFormat;

/**
 *  Format date to string
 *
 *  @param format format return string
 *
 *  @return formated string
 */
- (NSString *)formattedStringWithFormat:(NSString *)format;

@end
