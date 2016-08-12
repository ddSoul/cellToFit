//
//  ProgressHUD.h
//  Anxinlicai
//
//  Created by 邓西亮 on 16/7/20.
//  Copyright © 2016年 邓西亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVProgressHUD.h"

@interface ProgressHUD : NSObject

/**
 *  显示progress
 */
+ (void)showStatus;

/**
 *  progress消失
 */
+ (void)statusDismiss;

/**
 *  文字提示
 *
 *  @param errorString 错误文字
 */
+ (void)showErrorWithString:(NSString *)errorString;

/**
 *  文字提示
 *
 *  @param successString
 */
+ (void)showSuccessWithString:(NSString *)successString;

+ (void)showLocalErrorWithImage:(NSString *)imageName errorString:(NSString *)errorStr;


@end
