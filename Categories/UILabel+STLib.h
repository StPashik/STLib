//
//  UILabel+STLib.h
//
//  Created by StPashik on 09.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (STLib)

/**
 *  Invalidate animation with kSTLibValidationErrorColor
 */
- (void)startAnimationOfValidation;

/**
 *  Invalidate animation with kSTLibValidationErrorColor with limit of repeat
 *
 *  @param limit repeat limit
 */
- (void)startAnimationWithLimit:(NSInteger)limit;

@end
