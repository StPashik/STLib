//
//  NSObject+STLib.h
//
//  Created by StPashik on 09.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (STLib)

/**
 *  Perform block after delay
 *
 *  @param block execution block
 *  @param delay delay
 */
- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

@end
