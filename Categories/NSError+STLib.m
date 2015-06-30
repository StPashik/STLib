//
//  NSError+STLib.m
//  algeron
//
//  Created by StPashik on 11.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import "NSError+STLib.h"

@implementation NSError (STLib)

+ (NSError *)errorWithCode:(NSInteger)code
      localizedDescription:(NSString *)localizedDescription
{
    NSString *errorMessage = localizedDescription;
    
    if (!errorMessage)
    {
        if (code == kSTErrorServerErrorCode)
            errorMessage = NSLocalizedString(@"Error of the server", nil);
        else if (code == kSTErrorModelIncorrectCode)
            errorMessage = NSLocalizedString(@"Error of writing to database", nil);
    }
    
    NSDictionary *errorInfo = [NSDictionary dictionaryWithObject:errorMessage
                                                          forKey:NSLocalizedDescriptionKey];
    NSError *error = [NSError errorWithDomain:kSTErrorDomain
                                         code:code
                                     userInfo:errorInfo];
    
    return error;
}

@end
