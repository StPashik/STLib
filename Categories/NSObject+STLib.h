//
//  NSObject+STLib.h
//
//  Created by StPashik on 09.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (STLib)

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

@end
