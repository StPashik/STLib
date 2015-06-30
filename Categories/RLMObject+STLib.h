//
//  RLMObject+STLib.h
//  bileter
//
//  Created by StPashik on 01.04.15.
//  Copyright (c) 2015 Legion. All rights reserved.
//

#import <Realm/Realm.h>

@interface RLMObject (STLib)

/**
 *  Get RLMObject by primaryKey.
 *  If object in realm not found, return \b nil.
 *
 *  @param primaryKey primaryKey value for serching object
 *
 *  @return instance of realm object.
 */
+ (instancetype)objectByPrimaryKey:(id)primaryKey;

@end
