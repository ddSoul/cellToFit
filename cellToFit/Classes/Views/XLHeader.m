//
//  XLHeader.m
//  cellToFit
//
//  Created by 邓西亮 on 16/8/16.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "XLHeader.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define view_scal (ScreenWidth/1242)

@implementation XLHeader

#pragma mark - 交给子类们去实现
/** 初始化 */
- (void)prepare NS_REQUIRES_SUPER
{
    [super prepare];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 100*view_scal)];
    label.backgroundColor = [UIColor redColor];
    [self addSubview:label];
    NSLog(@"hello");
}
/** 摆放子控件frame */
- (void)placeSubviews NS_REQUIRES_SUPER
{
    [super placeSubviews];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100*view_scal, ScreenWidth, 100*view_scal)];
    label.backgroundColor = [UIColor greenColor];
    [self addSubview:label];

    
    NSLog(@"world");
}

@end
