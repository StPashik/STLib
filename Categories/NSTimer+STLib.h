//
//  NSTimer+STLib.h
//
//  Created by StPashik on 30.04.15.
//  Copyright (c) 2015 StPashik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (STLib)

/**
 *  Timer with block and run tick
 *
 *  @param inTimeInterval timer interval
 *  @param inBlock        execution block
 *  @param inRepeats      repeat YES/NO
 *
 *  @return instance timer
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval
                                      block:(void (^)(NSTimer *timer))inBlock
                                    repeats:(BOOL)inRepeats;

/**
 *  Timer with execution block
 *
 *  @param inTimeInterval timer interval
 *  @param inBlock        execution block
 *  @param inRepeats      repeat YES/NO
 *
 *  @return instance timer
 */
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)inTimeInterval
                             block:(void (^)(NSTimer *timer))inBlock
                           repeats:(BOOL)inRepeats;

@end
