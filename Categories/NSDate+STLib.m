//
//  NSDate+StLib.m
//  algeron
//
//  Created by StPashik on 22.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import "NSDate+STLib.h"

@implementation NSDate (STLib)

- (BOOL)isLaterThanOrEqualTo:(NSDate*)date {
    return !([self compare:date] == NSOrderedAscending);
}

- (BOOL)isEarlierThanOrEqualTo:(NSDate*)date {
    return !([self compare:date] == NSOrderedDescending);
}
- (BOOL)isLaterThan:(NSDate*)date {
    return ([self compare:date] == NSOrderedDescending);
    
}
- (BOOL)isEarlierThan:(NSDate*)date {
    return ([self compare:date] == NSOrderedAscending);
}

- (NSDate *)withOutTime
{
    return [NSDate dateWithTimeIntervalSinceReferenceDate:
            (NSInteger)self.timeIntervalSinceReferenceDate / 86400 * 86400];
}

- (NSInteger)differenceFromDate:(NSDate *)date interval:(NSInteger)interval
{
    NSTimeInterval secondsBetween = [self timeIntervalSinceDate:date];
    
    NSInteger numberOfIntervals = secondsBetween / interval;
    
    return numberOfIntervals;
}

- (NSString *)afterDate:(NSDate *)date dateFormat:(NSString *)dateFormat
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit units = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateComponents *selfComponents = [calendar components:units fromDate:self];
    NSDateComponents *dateComponents = [calendar components:units fromDate:date];
    
    NSDateComponents *differenceDateComponents = [calendar components:NSCalendarUnitDay
                                                             fromDate:[calendar dateFromComponents:dateComponents]
                                                               toDate:[calendar dateFromComponents:selfComponents]
                                                              options:0];
    
    NSString *dateText = nil;
    
    switch (differenceDateComponents.day)
    {
        case 0:
            dateText = NSLocalizedString(@"today", nil);
            break;
            
        case 1:
            dateText = NSLocalizedString(@"tomorrow", nil);
            break;
            
        default:
        {
            NSDateFormatter *dateFormatter = [NSDateFormatter dateFormatterWithDateFormat:dateFormat];
            
            dateText = [dateFormatter stringFromDate:self];
        }
            break;
    }
    
    return dateText;
}

- (NSString *)formattedStringWithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [NSDateFormatter dateFormatterWithDateFormat:format ? format : @"d.MM.YYYY"];
    
    return [dateFormatter stringFromDate:self];
}

@end
