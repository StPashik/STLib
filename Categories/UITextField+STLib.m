//
//  UITextField+STLib.m
//  algeron
//
//  Created by StPashik on 09.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import "UITextField+STLib.h"

#import <objc/runtime.h>

@implementation UITextField (STLib)

static char kSTTextFieldLabelKey;
static BOOL isAnimation;

#pragma mark - Getters

- (UILabel *)label
{
    return objc_getAssociatedObject(self, &kSTTextFieldLabelKey);
}

- (BOOL)isValid
{
    return self.text && ![self.text isEqualToString:@""] && ![self.text isEqualToString:self.placeholder];
}

#pragma mark - Setters

- (void)setLabel:(UILabel *)label
{
    objc_setAssociatedObject(self, &kSTTextFieldLabelKey, label, OBJC_ASSOCIATION_ASSIGN);
}

#pragma mark - Public methods

- (void)setLeftPadding:(int)paddingValue
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, paddingValue, self.frame.size.height)];
    self.leftView = paddingView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)setRightPadding:(int)paddingValue
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, paddingValue, self.frame.size.height)];
    self.rightView = paddingView;
    self.rightViewMode = UITextFieldViewModeAlways;
}

- (BOOL)validateWithAnimation
{
    if ([self isValid])
        return YES;

    [self startAnimationOfValidation];
    
    return NO;
}

- (BOOL)validateWithBackAnimationWithColor:(UIColor *)color
{
    if ([self isValid])
        return YES;
    
    [self startBackAnimationOfValidationWithColor:color];
    
    return NO;
}

- (void)startBackAnimationOfValidationWithColor:(UIColor *)color
{
    [self setBackgroundColor:color];
    
    [UIView animateWithDuration:0.2f animations:^{
        [self setBackgroundColor:[UIColor colorWithHex:0xC7242E alpha:0.5f]];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2f animations:^{
            [self setBackgroundColor:color];
        }];
    }];
}

- (void)startAnimationOfValidation
{
    if (!isAnimation) {
        if (self.label)
            [self.label startAnimationOfValidation];
        else
        {
            self.text = self.placeholder;
            
            UIColor *defaultTextColor = self.textColor;
            
            BOOL isSequre = self.isSecureTextEntry;
            
            self.secureTextEntry = NO;
            
            isAnimation = YES;
            
            [UIView transitionWithView:self duration:.6 options:UIViewAnimationOptionTransitionCrossDissolve animations:^
             {
                 UIColor *errorColor = [UIColor colorWithHex:0xEE4831];
                 
                 self.textColor = errorColor;
             } completion:^(BOOL finished)
             {
                 if (finished)
                 {
                     [UIView transitionWithView:self duration:.6 options:UIViewAnimationOptionTransitionCrossDissolve animations:^
                      {
                          self.text = nil;
                      } completion:^(BOOL finished)
                      {
                          if (finished)
                          {
                              self.textColor = defaultTextColor;
                              
                              if (isSequre)
                                  self.secureTextEntry = YES;
                              
                              isAnimation = NO;
                          }
                      }];
                 }
             }];
        }
    }
}

@end
