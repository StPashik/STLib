//
//  UILabel+STLib.m
//  algeron
//
//  Created by StPashik on 09.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import "UILabel+STLib.h"

@implementation UILabel (STLib)

#pragma mark - Public methods

- (void)startAnimationOfValidation
{
    UIColor *defaultTextColor = self.textColor;
 
    if (defaultTextColor.hexValue == kSTLibValidationErrorColor.hexValue)
        return;

    [UIView transitionWithView:self duration:.6 options:UIViewAnimationOptionTransitionCrossDissolve animations:^
    {
        self.textColor = kSTLibValidationErrorColor;
    } completion:^(BOOL finished)
    {
        if (finished)
        {
            [UIView transitionWithView:self duration:.6 options:UIViewAnimationOptionTransitionCrossDissolve animations:^
            {
                self.textColor = defaultTextColor;
            } completion:nil];
        }
    }];
}

- (void)startAnimationWithLimit:(NSInteger)limit
{
    __block NSInteger timerFireCount = 0;
    NSTimer *timer;
    
    [timer invalidate];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1f block:^(NSTimer *timer) {
        timerFireCount++;
        
        CGFloat newValue = self.text.floatValue + 1;
        
        CATransition *animation  = [CATransition animation];
        animation.duration       = 0.1;
        animation.type           = kCATransitionPush;
        animation.subtype        = kCATransitionFromBottom;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        [self.layer addAnimation:animation forKey:@"changeTextTransition"];
        
        self.text = [NSString stringWithFormat:@"%.0f", newValue];
        if (timerFireCount > limit) {
            [timer invalidate];
            timer = nil;
        }
    } repeats:YES];
}

@end
