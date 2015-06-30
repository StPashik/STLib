//
//  NSTimer+STLib.m
//
//  Created by StPashik on 30.04.15.
//  Copyright (c) 2015 StPashik. All rights reserved.
//

#import "NSTimer+STLib.h"

@interface NSTimer (STLibPrivate)

+ (void)bk_executeBlockFromTimer:(NSTimer *)aTimer;

@end

@implementation NSTimer (STLib)

+ (id)scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(NSTimer *timer))block repeats:(BOOL)inRepeats
{
    NSParameterAssert(block != nil);
    return [self scheduledTimerWithTimeInterval:inTimeInterval target:self selector:@selector(executeBlockFromTimer:) userInfo:[block copy] repeats:inRepeats];
}

+ (id)timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(NSTimer *timer))block repeats:(BOOL)inRepeats
{
    NSParameterAssert(block != nil);
    return [self timerWithTimeInterval:inTimeInterval target:self selector:@selector(executeBlockFromTimer:) userInfo:[block copy] repeats:inRepeats];
}

+ (void)executeBlockFromTimer:(NSTimer *)aTimer {
    void (^block)(NSTimer *) = [aTimer userInfo];
    if (block) block(aTimer);
}

@end
