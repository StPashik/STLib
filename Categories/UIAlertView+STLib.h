//
//  UIAlertView+STLib.h
//
//  Created by StPashik on 09.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (STLib)

/**
 *  Init with internet connection localize error
 *
 *  @return instance alertView with "OK" button
 */
- (id)initInternetConnectionError;

/**
 *  Init witn location denied error
 *
 *  @return instance alertView with "OK" button
 */
- (id)initLocationNotDeniedError;

/**
 *  Init with message
 *
 *  @param message alert message
 *
 *  @return instance alertView with "OK" button
 */
- (id)initWithMessage:(NSString *)message;

/**
 *  Init with message and title
 *
 *  @param title   alert title
 *  @param message alert message
 *
 *  @return instance alertView with "OK" button
 */
- (id)initWithTitle:(NSString *)title message:(NSString *)message;

/**
 *  Init with message and title. With delegate
 *
 *  @param title    alert title
 *  @param message  alert message
 *  @param delegate alert delegate
 *
 *  @return instance alertView with "OK" button
 */
- (id)initQuestionWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate;

@end
