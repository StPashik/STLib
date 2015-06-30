//
//  STLib.m
//
//  Created by StPashik on 09.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import "STLib.h"

@implementation STLib

+ (NSError *)validateEmail:(NSString *)email
{
    NSError *error = nil;
    
    if (!email || [email isEqualToString:@""])
        error = [NSError errorWithDomain:kSTErrorDomain code:kSTErrorRegInfoFailedCode userInfo:[NSDictionary dictionaryWithObject:NSLocalizedString(kSTLibRegInfoErrorEmptyEmail, @"") forKey:NSLocalizedDescriptionKey]];
    else
    {
        NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        
        if (![emailTest evaluateWithObject:email])
            error = [NSError errorWithDomain:kSTErrorDomain code:kSTErrorRegInfoFailedCode userInfo:[NSDictionary dictionaryWithObject:NSLocalizedString(kSTLibRegInfoErrorIncorrectEmail, @"") forKey:NSLocalizedDescriptionKey]];
    }
    
    return error;
}

+ (NSString *)launchImageName
{
    NSMutableString *launchImageName = [@"LaunchImage" mutableCopy];
    
    UIScreen *mainScreen = [UIScreen mainScreen];
    CGFloat screenScale = mainScreen.scale;
    
    if (!IS_IPHONE_4_OR_LESS)
    {
        CGFloat screenHeight = mainScreen.bounds.size.width / mainScreen.scale;
        
        [launchImageName appendFormat:@"-%.0fh", screenHeight];
    }
    
    if (screenScale > 1.)
        [launchImageName appendFormat:@"@%.0fx", screenScale];
    
    return launchImageName;
}

+ (NSString *)stringFromTimeInterval:(NSTimeInterval)timeInterval
{
    NSUInteger gameTimeInMilliseconds = timeInterval * 1000;
    
    NSUInteger minutes = timeInterval / 60;
    NSUInteger seconds = timeInterval - minutes * 60;
    NSUInteger milliseconds = gameTimeInMilliseconds % 1000;
    
    NSString *timeString = [NSString stringWithFormat:@"%02ti:%02ti:%02ti", minutes, seconds, milliseconds];
    timeString = [timeString substringToIndex:8];
    
    return timeString;
}

+ (NSMutableString *)filteredPhoneStringFromStringWithFilter:(NSString *)string filter:(NSString *)filter
{
    NSUInteger onOriginal = 0, onFilter = 0, onOutput = 0;
    char outputString[([filter length])];
    BOOL done = NO;
    
    while(onFilter < [filter length] && !done)
    {
        char filterChar     = [filter characterAtIndex:onFilter];
        char originalChar   = onOriginal >= string.length ? '\0' : [string characterAtIndex:onOriginal];
        switch (filterChar) {
            case '#':
                if(originalChar == '\0')
                {
                    // We have no more input numbers for the filter.  We're done.
                    done = YES;
                    break;
                }
                if(isdigit(originalChar))
                {
                    outputString[onOutput] = originalChar;
                    onOriginal++;
                    onFilter++;
                    onOutput++;
                }
                else
                {
                    onOriginal++;
                }
                break;
            default:
                // Any other character will automatically be inserted for the user as they type (spaces, - etc..) or deleted as they delete if there are more numbers to come.
                outputString[onOutput] = filterChar;
                onOutput++;
                onFilter++;
                if(originalChar == filterChar)
                    onOriginal++;
                break;
        }
    }
    outputString[onOutput] = '\0'; // Cap the output string
    return [NSMutableString stringWithUTF8String:outputString];
}

@end
