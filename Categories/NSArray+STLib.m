//
//  NSArray+STLib.m
//
//  Created by StPashik on 11.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import "NSArray+STLib.h"

@interface NSArray (STLibPrivate)

- (NSArray *)sortedOutletsUsingComparator:(NSComparator)comparator;

@end

@implementation NSArray (STLib)

#pragma mark - Public methods

- (NSArray *)sortedOutletsByOriginY
{
    NSArray *sortedArray = [self sortedOutletsUsingComparator:^NSComparisonResult(UIView *obj1, UIView *obj2)
    {
        CGFloat obj1Y = obj1.frame.origin.y;
        CGFloat obj2Y = obj2.frame.origin.y;
        
        if (obj1Y == obj2Y)
            return NSOrderedSame;
        else
            if (obj1Y > obj2Y)
                return NSOrderedDescending;
            else
                return NSOrderedAscending;
    }];
    
    return sortedArray;
}

- (NSArray *)sortedOutletsByOriginX
{
    NSArray *sortedArray = [self sortedOutletsUsingComparator:^NSComparisonResult(UIView *obj1, UIView *obj2)
                           {
                               CGFloat obj1Y = obj1.frame.origin.x;
                               CGFloat obj2Y = obj2.frame.origin.x;
        
                               if (obj1Y == obj2Y)
                                   return NSOrderedSame;
                               else
                                   if (obj1Y > obj2Y)
                                       return NSOrderedDescending;
                                   else
                                       return NSOrderedAscending;
                           }];
    
    return sortedArray;
}

- (NSArray *)sortedOutletsByOriginXWithSuperview
{
    NSArray *sortedArray = [self sortedOutletsUsingComparator:^NSComparisonResult(UIView *obj1, UIView *obj2)
                           {
                               CGFloat obj1Y = obj1.frame.origin.x + obj1.superview.frame.origin.x;
                               CGFloat obj2Y = obj2.frame.origin.x + obj2.superview.frame.origin.x;
                               
                               if (obj1Y == obj2Y)
                                   return NSOrderedSame;
                               else
                                  if (obj1Y > obj2Y)
                                       return NSOrderedDescending;
                                   else
                                       return NSOrderedAscending;
                           }];
    
    return sortedArray;
}

- (NSArray *)sortedOutletsByTag
{
    NSArray *sortedArray = [self sortedOutletsUsingComparator:^NSComparisonResult(UIView *obj1, UIView *obj2)
                           {
                               NSNumber *obj1Tag = @(obj1.tag);
                               NSNumber *obj2Tag = @(obj2.tag);
                               
                               return [obj1Tag compare:obj2Tag];
                           }];
    
    return sortedArray;
}

- (NSArray *)mapWithBlock:(id (^)(NSUInteger, id))block
{
    NSUInteger length = self.count;
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:length];
    
    for (int i = 0; i < length; i++)
    {
        id obj = [self objectAtIndex:i];
        id returnedObj = block(i, obj);
        
        if (returnedObj)
            [array addObject:returnedObj];
    }
    
    return array;
}

- (NSDictionary *)groupByBlock:(id(^)(NSUInteger, id))block
{
    NSUInteger length = self.count;
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    for (int i = 0; i < length; i++)
    {
        id obj = [self objectAtIndex:i];
        
        id key = block(i, obj);
        
        NSMutableArray *value = [dictionary objectForKey:key];
        if (!value)
            value = [NSMutableArray array];
        
        [value addObject:obj];
        
        [dictionary setValue:value forKey:key];
    }
    
    return dictionary;
}

- (BOOL)integerObjectIsExists:(NSInteger)integer
{
    BOOL isExists = NO;
    
    for (id object in self)
    {
        if ([object isKindOfClass:[NSNumber class]])
        {
            NSNumber *number = (NSNumber *)object;
            
            if ([number integerValue] == integer)
            {
                isExists = YES;
                break;
            }
        }
    }
    
    return isExists;
}

#pragma mark - Private methods

- (NSArray *)sortedOutletsUsingComparator:(NSComparator)comparator
{
    if (self.count == 0)
        return [NSArray array];
    
    if (![self[0] isKindOfClass:[UIView class]])
        return [NSArray arrayWithArray:self];
    
    NSArray *sortedArray = nil;

    @try
    {
        sortedArray = [self sortedArrayUsingComparator:comparator];
    }
    @catch (NSException *exception)
    {
        NSLog(@"*** NSArray exception ***\t%@", exception);
    }
    @finally
    {
        return sortedArray;
    }
}

@end
