//
//  UILabel+sizeTofitWdthAndHeigh.h
//  Anxinlicai
//
//  Created by 邓西亮 on 16/8/10.
//  Copyright © 2016年 邓西亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (sizeTofitWdthAndHeigh)

+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;

@end
