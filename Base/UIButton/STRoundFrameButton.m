//
//  STRoundFrameButton.m
//  libTst
//
//  Created by StPashik on 01.07.15.
//  Copyright (c) 2015 StPashik. All rights reserved.
//

#import "STRoundFrameButton.h"

@implementation STRoundFrameButton

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setupDefault];
}

- (void)prepareForInterfaceBuilder
{
    [super prepareForInterfaceBuilder];
    
    [self setupDefault];
}

- (void)setupDefault
{
    self.layer.cornerRadius = self.radius;
    self.layer.borderColor = self.borderColor.CGColor;
    self.layer.borderWidth = self.border;
    self.layer.backgroundColor = self.background.CGColor;
    
    [self setTitleColor:self.titleColor ? self.titleColor : self.borderColor forState:UIControlStateNormal];
}

@end
