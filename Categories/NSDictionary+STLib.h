//
//  NSDictionary+STLib.h
//
//  Created by StPashik on 11.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (STLib)

- (id)objectNotNullForKey:(id)key;
- (id)objectForIntegerKey:(NSInteger)integerKey;

- (NSNumber *)keyForIntegerKey:(NSInteger)integerKey;

@end
