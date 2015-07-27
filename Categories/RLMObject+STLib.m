//
//  RLMObject+STLib.m
//
//  Created by StPashik on 01.04.15.
//  Copyright (c) 2015 Legion. All rights reserved.
//

#import "RLMObject+STLib.h"

#import <Realm/RLMProperty.h>
#import <Realm/RLMObjectSchema.h>

@interface RLMProperty (STLib)

@property (nonatomic, assign) BOOL isPrimary;

@end

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

- (instancetype)shallowCopy {
    id object = [[NSClassFromString(self.objectSchema.className) alloc] init];
    [object mergePropertiesFromObject:self];
    
    return object;
}

- (void)mergePropertiesFromObject:(id)object {
    for (RLMProperty *property in self.objectSchema.properties) {
        // assume array
        if (property.type == RLMPropertyTypeArray) {
            RLMArray *thisArray = [self valueForKeyPath:property.name];
            RLMArray *thatArray = [object valueForKeyPath:property.name];
            [thisArray addObjects:thatArray];
        }
        // assume data
        else if (!property.isPrimary) {
            id value = [object valueForKeyPath:property.name];
            [self setValue:value forKeyPath:property.name];
        }
    }
}

- (instancetype)deepCopy {
    RLMObject *object = [[NSClassFromString(self.objectSchema.className) alloc] init];
    
    for (RLMProperty *property in self.objectSchema.properties) {
        
        if (property.type == RLMPropertyTypeArray) {
            RLMArray *thisArray = [self valueForKeyPath:property.name];
            RLMArray *newArray = [object valueForKeyPath:property.name];
            
            for (RLMObject *currentObject in thisArray) {
                [newArray addObject:[currentObject deepCopy]];
            }
            
        }
        else if (property.type == RLMPropertyTypeObject) {
            RLMObject *value = [self valueForKeyPath:property.name];
            [object setValue:[value deepCopy] forKeyPath:property.name];
        }
        else {
            id value = [self valueForKeyPath:property.name];
            [object setValue:value forKeyPath:property.name];
        }
    }
    
    return object;
}

@end
