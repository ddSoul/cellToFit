//
//  FootToolViews.h
//  cellToFit
//
//  Created by 邓西亮 on 16/8/16.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol senderMessageDelegate <NSObject>

//发送消息按钮代理时间
- (void)senderMessage;
//键盘出现
- (void)keyBoardShow:(CGFloat)keyboardHeight;
//键盘消失
- (void)keyBoardDismiss;
//输入框高度变化
- (void)inputTextViewHeightChange;

@end

@interface FootToolViews : UIView

//输入框
@property (nonatomic, strong) UITextView *inputTextView;
/**
 *  创建keyBoard视图
 *
 *  @return 视图
 */
+ (instancetype) configureKeyboard;

@property (nonatomic, assign) id<senderMessageDelegate> delegate;

@end
