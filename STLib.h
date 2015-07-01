//
//  STLib.h
//
//  Created by StPashik on 09.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSArray+STLib.h"
#import "NSDate+STLib.h"
#import "NSDictionary+STLib.h"
#import "NSDateFormatter+STLib.h"
#import "NSError+STLib.h"
#import "NSIndexPath+STLib.h"
#import "NSObject+STLib.h"
#import "UILabel+STLib.h"
#import "NSString+STLib.h"
#import "UITextField+STLib.h"
#import "UIAlertView+STLib.h"
#import "UILabel+STLib.h"
#import "UIColor+STLib.h"
#import "UIImage+STLib.h"
#import "NSTimer+STLib.h"

#if __has_include(<Realm/Realm.h>)
#import "RLMObject+STLib.h"
#endif

#ifdef DEBUG
#define DEBUG_MODE YES
#else
#define DEBUG_MODE NO
#endif

#define kSTErrorDomain                                  [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"] stringByAppendingString:@"ErrorDomain"]
#define kSTErrorRegInfoFailedCode                       100
#define kSTErrorModelIncorrectCode                      200
#define kSTErrorServerErrorCode                         300

#define IS_IPAD                                         (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE                                       (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA                                       ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH                                    ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT                                   ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH                               (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH                               (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS                             (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5                                     (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6                                     (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6_PLUS                                (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define kSTLibRegInfoErrorEmptyEmail                    @"kSTLibRegInfoErrorEmptyEmail"
#define kSTLibRegInfoErrorIncorrectEmail                @"kSTLibRegInfoErrorIncorrectEmail"
#define kSTLibRegInfoErrorEmptyPhone                    @"kSTLibRegInfoErrorEmptyPhone"
#define kSTLibRegInfoErrorIncorrectPhone                @"kSTLibRegInfoErrorIncorrectPhone"

#define kSTLibAlertViewDefaultTitle                     [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define kSTLibAlertViewInternetConnectionErrorString    @"kSTLibAlertViewInternetConnectionErrorString"
#define kSTLibAlertViewLocationNotDeniedErrorString     @"kSTLibAlertViewLocationNotDeniedErrorString"

#define SYSTEM_VERSION_EQUAL_TO(v)                      ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)      ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)         ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
#define IOS_8_OR_LATER                                  (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0"))
#define IOS_7_OR_LATER                                  (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))

#define kSTLibValidationErrorColor                      [UIColor colorWithHex:0xEE4831]

#define kSTLibTimeIntervalForMinute                     60
#define kSTLibTimeIntervalForHour                       3600
#define kSTLibTimeIntervalForDay                        86400
#define kSTLibTimeIntervalForFiveDays                   432000
#define kSTLibTimeIntervalForWeek                       604800
#define kSTLibNumberOfDaysInWeek                        7

typedef NS_ENUM(NSUInteger, STLibPhoneFormat)
{
    STLibPhoneFormatAny = 0
};

@interface STLib : NSObject

/**
 *  Validate e-mail address
 *
 *  @param email e-mail string
 *
 *  @return error if invalid
 */
+ (NSError *)validateEmail:(NSString *)email;

/**
 *  Launch image name
 *
 *  @return image name string
 */
+ (NSString *)launchImageName;

/**
 *  String from time intrval in format "minuts:second:miliseconds"
 *
 *  @param timeInterval timeinterval
 *
 *  @return formated string
 */
+ (NSString *)stringFromTimeInterval:(NSTimeInterval)timeInterval;

/**
 *  Filer string for phoe number
 *
 *  @param string string
 *  @param filter filetr with format (# - number, another char without changes)
 *
 *  @return filtered string
 */
+ (NSMutableString *)filteredPhoneStringFromStringWithFilter:(NSString *)string filter:(NSString *)filter;

@end
