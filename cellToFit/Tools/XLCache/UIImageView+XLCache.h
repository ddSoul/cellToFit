//
//  UIImageView+XLCache.h
//  cellToFit
//
//  Created by 邓西亮 on 16/9/5.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (XLCache)

- (void)xl_setImageWithUrl:(NSString *)urlString placeholderImage:(UIImage *)placeholder;

@end
