//
//  NSError+STLib.h
//
//  Created by StPashik on 11.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (STLib)

/**
 *  Localized server error by response code if description error empty
 *
 *  @param code                 response code
 *  @param LocalizedDescription response error description
 *
 *  @return new error with description
 */
+ (NSError *)errorWithCode:(NSInteger)code
      localizedDescription:(NSString *)LocalizedDescription;

@end
