//
//  NSIndexPath+STLib.m
//  algeron
//
//  Created by StPashik on 09.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import "NSIndexPath+STLib.h"

@implementation NSIndexPath (STLib)

- (BOOL)isEqualToIndexPath:(NSIndexPath *)indexPath
{
    return self.section == indexPath.section && self.row == indexPath.row;
}

@end
