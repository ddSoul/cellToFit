//
//  UIImageView+XLCache.m
//  cellToFit
//
//  Created by 邓西亮 on 16/9/5.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "UIImageView+XLCache.h"
#import "XLCache.h"

@implementation UIImageView (XLCache)


- (void)xl_setImageWithUrl:(NSString *)urlString placeholderImage:(UIImage *)placeholder
{
    self.image = placeholder;
    __weak typeof(self) weakSelf = self;
    [[XLCache shareXLCache] xl_setImageWithUrl:urlString
                                      progress:^(NSInteger downloaded,NSInteger downloadCount){
                                          
                                          if (downloaded == downloadCount) {
                                              //进度条的一些事情
                                          }
                                          
                                      }
                                     completed:^(id responsObject){
                                         
                                         weakSelf.image = [UIImage imageWithData:responsObject];
                                         
                                     }];
}

@end
