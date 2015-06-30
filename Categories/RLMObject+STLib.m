//
//  RLMObject+STLib.m
//  bileter
//
//  Created by StPashik on 01.04.15.
//  Copyright (c) 2015 Legion. All rights reserved.
//

#import "RLMObject+STLib.h"

@implementation RLMObject (STLib)

+ (instancetype)objectByPrimaryKey:(id)primaryKey
{
    NSString *modelName = NSStringFromClass([self class]);
    
    NSString *primaryKeyName = [NSClassFromString(modelName) primaryKey];
    
    if (!primaryKeyName) {
        return nil;
    } else {
        RLMResults *objects = [NSClassFromString(modelName) objectsWhere:[NSString stringWithFormat:@"%@ = %@", primaryKeyName, primaryKey]];
        if (objects.count > 0) {
            return objects[0];
        } else {
            return nil;
        }
    }
}

@end
