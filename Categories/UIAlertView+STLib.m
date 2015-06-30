//
//  UIAlertView+STLib.m
//
//  Created by StPashik on 09.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import "UIAlertView+STLib.h"

#import "STLib.h"

@implementation UIAlertView (STLib)

- (id)initInternetConnectionError
{
    NSString *title = kSTLibAlertViewDefaultTitle;
    
    if (!title)
        title = @"";
    
    self = [self initWithTitle:title
                       message:NSLocalizedString(kSTLibAlertViewInternetConnectionErrorString, @"")
                      delegate:nil
             cancelButtonTitle:@"OK"
             otherButtonTitles:nil];
    
    return self;
}

- (id)initLocationNotDeniedError
{
    NSString *title = kSTLibAlertViewDefaultTitle;
    
    if (!title)
        title = @"";
    
    self = [self initWithTitle:title
                       message:NSLocalizedString(kSTLibAlertViewLocationNotDeniedErrorString, @"")
                      delegate:nil
             cancelButtonTitle:@"OK"
             otherButtonTitles:nil];
    
    return self;
}

- (id)initWithMessage:(NSString *)message
{
    NSString *title = kSTLibAlertViewDefaultTitle;
    
    if (!title)
        title = @"";
    
    self = [self initWithTitle:title
                       message:message
                      delegate:nil
             cancelButtonTitle:@"OK"
             otherButtonTitles:nil];
    
    return self;
}

- (id)initWithTitle:(NSString *)title message:(NSString *)message
{
    self = [self initWithTitle:title
                       message:message
                      delegate:nil
             cancelButtonTitle:@"OK"
             otherButtonTitles:nil];
    
    return self;
}

- (id)initQuestionWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate
{
    self = [self initWithTitle:title
                       message:message
                      delegate:delegate
             cancelButtonTitle:NSLocalizedString(@"Нет", @"")
             otherButtonTitles:NSLocalizedString(@"Да", @""), nil];
    
    return self;
}

@end
