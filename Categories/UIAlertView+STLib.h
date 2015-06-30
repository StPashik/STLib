//
//  UIAlertView+STLib.h
//
//  Created by StPashik on 09.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (STLib)

- (id)initInternetConnectionError;
- (id)initLocationNotDeniedError;
- (id)initWithMessage:(NSString *)message;
- (id)initWithTitle:(NSString *)title message:(NSString *)message;
- (id)initQuestionWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate;

@end
