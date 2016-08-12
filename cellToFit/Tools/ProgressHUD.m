//
//  ProgressHUD.m
//  Anxinlicai
//
//  Created by 邓西亮 on 16/7/20.
//  Copyright © 2016年 邓西亮. All rights reserved.
//

#import "ProgressHUD.h"

@implementation ProgressHUD

+ (void)showStatus
{
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
}

+ (void)statusDismiss
{
    [SVProgressHUD dismiss];
}

+ (void)showErrorWithString:(NSString *)errorString
{
    [SVProgressHUD showErrorWithStatus:errorString maskType:SVProgressHUDMaskTypeGradient];
}

+ (void)showSuccessWithString:(NSString *)successString
{
    [SVProgressHUD showSuccessWithStatus:successString maskType:SVProgressHUDMaskTypeBlack];
}

+ (void)showLocalErrorWithImage:(NSString *)imageName errorString:(NSString *)errorStr
{
    [SVProgressHUD showImage:[UIImage imageNamed:imageName]
                      status:errorStr
                    maskType:SVProgressHUDMaskTypeBlack];
}



@end
