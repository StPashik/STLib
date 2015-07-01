//
//  NSIndexPath+STLib.h
//
//  Created by StPashik on 09.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSIndexPath (STLib)

/**
 *  Compare with indexPath
 *
 *  @param indexPath with whom compare
 *
 *  @return YES/NO
 */
- (BOOL)isEqualToIndexPath:(NSIndexPath *)indexPath;

@end
