//
//  UITextView+placeholder.h
//  cellToFit
//
//  Created by 邓西亮 on 16/9/6.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (placeholder)

//@property (nonatomic, copy)NSString *placeholder;
//
////@property (nonatomic, copy)UIColor *placeholderColor;
////
////@property (nonatomic, copy)UIFont *placeholderFont;
//
///**
// * 占位提示语标签
// */
//@property (nonatomic, strong, readonly) UILabel *placeholderLabel;

/**
 * 占位提示语
 */
@property (nonatomic, copy)   NSString *hdf_placeholder;

/**
 * 占位提示语的字体颜色
 */
@property (nonatomic, strong) UIColor *hdf_placeholderColor;

/**
 * 占位提示语的字体
 */
@property (nonatomic, strong) UIFont  *hdf_placeholderFont;

/**
 * 占位提示语标签
 */
@property (nonatomic, strong, readonly) UILabel *hdf_placeholderLabel;


@end
