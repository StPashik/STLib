//
//  NSTimer+STLib.h
//  MarketDebt
//
//  Created by StPashik on 30.04.15.
//  Copyright (c) 2015 StPashik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (STLib)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval
                                      block:(void (^)(NSTimer *timer))inBlock
                                    repeats:(BOOL)inRepeats;

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)inTimeInterval
                             block:(void (^)(NSTimer *timer))inBlock
                           repeats:(BOOL)inRepeats;

@end
