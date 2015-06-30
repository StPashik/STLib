//
//  NSDateFormatter+STLib.m
//
//  Created by StPashik on 09.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//


#import "NSDateFormatter+STLib.h"

@implementation NSDateFormatter (STLib)

+ (NSDateFormatter *)dateFormatterWithDateFormat:(NSString *)aDateFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = aDateFormat;
    
    return dateFormatter;
}

@end
