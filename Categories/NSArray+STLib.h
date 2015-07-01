//
//  NSArray+STLib.h
//
//  Created by StPashik on 11.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (STLib)

/**
 *  Sort Outlets array methods
 *
 *  @return sorted array
 */
- (NSArray *)sortedOutletsByOriginY;
- (NSArray *)sortedOutletsByOriginX;
- (NSArray *)sortedOutletsByOriginXWithSuperview;
- (NSArray *)sortedOutletsByTag;

- (NSArray *)mapWithBlock:(id (^)(NSUInteger index, id obj))block;

- (NSDictionary *)groupByBlock:(id(^)(NSUInteger index, id obj))block;

- (BOOL)integerObjectIsExists:(NSInteger)integer;

@end
