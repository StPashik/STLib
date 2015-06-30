//
//  UITextField+STLib.h
//  algeron
//
//  Created by StPashik on 09.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (STLib)

@property (nonatomic, strong) UILabel   *label;

@property (nonatomic, readonly) BOOL     isValid;

- (void)setLeftPadding:(int)paddingValue;

- (void)setRightPadding:(int)paddingValue;

- (BOOL)validateWithAnimation;

- (BOOL)validateWithBackAnimationWithColor:(UIColor *)color;

- (void)startAnimationOfValidation;

//- (void)startBackAnimationOfValidation;

@end
