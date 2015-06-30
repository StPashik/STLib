//
//  STPaintCodeImageView.h
//  gruzer
//
//  Created by StPashik on 01.06.15.
//  Copyright (c) 2015 Legion. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface STPaintCodeImageView : UIView

// Name of your Stylekit Class
@property (strong, nonatomic) IBInspectable NSString *styleKitClassName;

// Name of the Image Canvas in PaintCode you exported as drawing method. Only images without parameters are allowed
@property (strong, nonatomic) IBInspectable NSString *canvasName;

@end
