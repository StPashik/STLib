//
//  NSDictionary+STLib.m
//  algeron
//
//  Created by StPashik on 11.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import "NSDictionary+STLib.h"

@implementation NSDictionary (STLib)

- (id)objectNotNullForKey:(id)key
{
    id obj = [self objectForKey:key];
    
    return [obj isKindOfClass:[NSNull class]] ? nil : obj;
}

- (id)objectForIntegerKey:(NSInteger)integerKey
{
    id object = nil;
 
    NSNumber *key = [self keyForIntegerKey:integerKey];

    if (key)
        object = [self objectForKey:key];
    
    return key;
}

- (NSNumber *)keyForIntegerKey:(NSInteger)integerKey
{
    NSNumber *key = nil;
    
    NSArray *allKeys = [self allKeys];
    
    for (NSNumber *currentKey in allKeys)
    {
        if ([currentKey integerValue] == integerKey)
        {
            key = currentKey;
            break;
        }
    }
    
    return key;
}

@end
