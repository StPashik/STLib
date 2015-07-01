//
//  STRoundFrameButton.h
//
//  Created by StPashik on 01.07.15.
//  Copyright (c) 2015 StPashik. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface STRoundFrameButton : UIButton

//border color
@property (nonatomic)IBInspectable UIColor  *borderColor;
//title color. If nil title colored like border
@property (nonatomic)IBInspectable UIColor  *titleColor;
//background color
@property (nonatomic)IBInspectable UIColor  *background;
//corner radius
@property (nonatomic)IBInspectable NSInteger radius;
//border width
@property (nonatomic)IBInspectable NSInteger border;

@end
