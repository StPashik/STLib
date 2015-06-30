//
//  NSError+STLib.h
//
//  Created by StPashik on 11.12.14.
//  Copyright (c) 2014 StPashik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (STLib)

+ (NSError *)errorWithCode:(NSInteger)code
      localizedDescription:(NSString *)LocalizedDescription;

@end
