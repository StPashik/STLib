//
//  NSDictionary+STLib.h
//
//  Created by StPashik on 11.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (STLib)

/**
 *  Dictionary object nil by key
 *
 *  @param key key for object
 *
 *  @return if not NSNull class object else nil
 */
- (id)objectNotNullForKey:(id)key;

/**
 *  Object by integer key
 *
 *  @param integerKey integer key
 *
 *  @return object by key
 */
- (id)objectForIntegerKey:(NSInteger)integerKey;

/**
 *  Num key for integer key
 *
 *  @param integerKey integer key
 *
 *  @return key
 */
- (NSNumber *)keyForIntegerKey:(NSInteger)integerKey;

@end
