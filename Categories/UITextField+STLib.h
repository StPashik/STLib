//
//  UITextField+STLib.h
//
//  Created by StPashik on 09.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (STLib)

@property (nonatomic, strong) UILabel   *label;
@property (nonatomic, readonly) BOOL     isValid;

/**
 *  Set left padding
 *
 *  @param paddingValue padding value
 */
- (void)setLeftPadding:(int)paddingValue;

/**
 *  Set right padding
 *
 *  @param paddingValue padding value
 */
- (void)setRightPadding:(int)paddingValue;

/**
 *  Validate with animation
 *
 *  @return YES/NO
 */
- (BOOL)validateWithAnimation;

/**
 *  Validate with ping-pong animation
 *
 *  @return YES/NO
 */
- (BOOL)validateWithBackAnimationWithColor:(UIColor *)color;

/**
 *  Start animation
 */
- (void)startAnimationOfValidation;

@end
