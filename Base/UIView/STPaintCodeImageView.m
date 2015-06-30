//
//  STPaintCodeImageView.m
//  gruzer
//
//  Created by StPashik on 01.06.15.
//  Copyright (c) 2015 Legion. All rights reserved.
//

#import "STPaintCodeImageView.h"

@interface STPaintCodeImageView ()

@property (strong, nonatomic) id styleKitClass;
@property (nonatomic) SEL canvasSelector;

@end

@implementation STPaintCodeImageView

#pragma mark - Setters

// Get class from string
- (void)setStyleKitClassName:(NSString *)styleKitClassName
{
    _styleKitClassName = styleKitClassName;
    
    self.styleKitClass = NSClassFromString(styleKitClassName);
    [self setNeedsDisplay];
}


// Get selector from string
- (void)setCanvasName:(NSString *)canvasName
{
    _canvasName = canvasName;
    
    if (canvasName.length > 0)
    {
        // Capitalize in case the canvas starts with a small letter
        NSString *capitalizedCanvasName = [canvasName stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[canvasName  substringToIndex:1] capitalizedString]];
        
        // Replace spaces with unterscores
        NSString *selectorName = [capitalizedCanvasName stringByReplacingOccurrencesOfString:@" " withString:@"_"];
        
        // Create the selector
        selectorName = [@"draw" stringByAppendingString:selectorName];
        self.canvasSelector = NSSelectorFromString(selectorName);
    } else {
        // Canvas name nil or empty
        self.canvasSelector = (SEL)0;
    };
    
    [self setNeedsDisplay];
}


#pragma mark - Drawing
- (void)drawRect:(CGRect)rect
{
    if ([self.styleKitClass respondsToSelector:self.canvasSelector])
    {
        ((void (*)(id, SEL))[self.styleKitClass methodForSelector:self.canvasSelector])(self.styleKitClass, self.canvasSelector);
    }
}

@end
