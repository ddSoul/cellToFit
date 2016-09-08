//
//  UITextView+placeholder.m
//  cellToFit
//
//  Created by 邓西亮 on 16/9/6.
//  Copyright © 2016年 dxl. All rights reserved.
//

//#import "UITextView+placeholder.h"
//#import <objc/runtime.h>
//#import "Masonry.h"
//
//static const char *x_TextViewPlaceholderLabelKey = "x_TextViewPlaceholderLabelKey";
//static const char *x_TextViewPlaceholderTextKey = "x_TextViewPlaceholderTextKey";
//
//@interface UITextView (placeholder)
//
//@property (nonatomic, strong) UILabel *placeholderLabel;
//
//@end
//
//@implementation UITextView (placeholder)
//
//-(UILabel *)placeholderLabel{
//    
//    UILabel *label = objc_getAssociatedObject(self, &x_TextViewPlaceholderLabelKey);
//    
//    if (label == nil || ![label isKindOfClass:[UILabel class]]) {
//        label = [[UILabel alloc] init];
//        label.textAlignment = NSTextAlignmentLeft;
//        label.font = self.font;
//        label.backgroundColor = [UIColor clearColor];
//        [self addSubview:label];
//
//        __weak typeof(self) weakSelf;
//        weakSelf.placeholderLabel = label;
//        [label mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.mas_equalTo(UIEdgeInsetsMake(7.5, 10, 0, 0));
//        }];
//        label.enabled = NO;
//        
//        
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(x_placehoderTextChange:)
//                                                     name:UITextViewTextDidChangeNotification
//                                                   object:nil];
//
//
//    }
//    return label;
//}
//-(void)setPlaceholderLabel:(UILabel *)placeholderLabel{
//    objc_setAssociatedObject(self, &x_TextViewPlaceholderLabelKey,placeholderLabel, OBJC_ASSOCIATION_COPY_NONATOMIC);
//}
//-(NSString *)placeholder{
//    return objc_getAssociatedObject(self, &x_TextViewPlaceholderTextKey);
//}
//-(void)setPlaceholder:(NSString *)placeholder{
//    
//    __weak typeof(self) weakSelf;
//    objc_setAssociatedObject(self, &x_TextViewPlaceholderTextKey, placeholder, OBJC_ASSOCIATION_COPY_NONATOMIC);
//    if ([placeholder isEqualToString:@""]) {
//        [self.placeholderLabel removeFromSuperview];
//        return;
//    }
//    
//    if ([self.text isEqualToString:@""]) {
//        self.placeholderLabel.text = placeholder;
//    }else{
//        self.placeholderLabel.text = @"";
//    }
//    
//}
//
//- (void)x_placehoderTextChange:(NSNotification *)notification {
//
//        __weak typeof(self) weakSelf;
//        if (![self.text isEqualToString:@""]) {
//            self.placeholderLabel.text = @"";
//        } else {
//            self.placeholderLabel.text = self.placeholder;
//        }
//}
//
//@end

#import "UITextView+placeholder.h"
#import <objc/runtime.h>
#import "Masonry.h"

static const void *s_hdfTextViewPlaceholderLabelKey = "s_hdfTextViewPlaceholderLabelKey";
static const void *s_hdfTextViewPlaceholderTextKey = "s_hdfTextViewPlaceholderTextKey";



@interface UITextView (HDFPlaceholderTextView)

@property (nonatomic, strong) UILabel *placeholderLabel;

@end

@implementation UITextView (HDFPlaceholderTextView)

- (void)setPlaceholderLabel:(UILabel *)placeholderLabel {
    objc_setAssociatedObject(self,
                             s_hdfTextViewPlaceholderLabelKey,
                             placeholderLabel,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)placeholderLabel {
    UILabel *label = objc_getAssociatedObject(self, s_hdfTextViewPlaceholderLabelKey);
    
    if (label == nil || ![label isKindOfClass:[UILabel class]]) {
        label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = self.font;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor redColor];
        [self addSubview:label];
        
//        kWeakObject(self);
//        __weak typeof(self) weakSelf;
        self.placeholderLabel = label;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.left.right.bottom.mas_equalTo(0, 0, 0, 0);
            make.edges.mas_equalTo(UIEdgeInsetsMake(7.5, 10, 0, 0));
        }];
        label.enabled = NO;
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector:@selector(hdf_placehoderTextChange:)
                                    name:UITextViewTextDidChangeNotification
                                  object:nil];
    }
    
    return label;
}

//- (void)hdf_placehoderTextChange:(NSNotification *)notification {
//    
//    if (![self.text isEqualToString:@""]) {
//        self.placeholderLabel.text = @"";
//    } else {
//        self.placeholderLabel.text = self.hdf_placeholder;
//    }
//    
//}

@end

@implementation UITextView (HDFTextView)

- (void)hdf_placehoderTextChange:(NSNotification *)notification {

        if (![self.text isEqualToString:@""]) {
            self.placeholderLabel.text = @"";
        } else {
            self.placeholderLabel.text = self.hdf_placeholder;
        }

}

- (UILabel *)hdf_placeholderLabel {
    return self.placeholderLabel;
}

- (void)setHdf_placeholder:(NSString *)hdf_placeholder {
    if ([hdf_placeholder isEqualToString:@""]) {
        objc_setAssociatedObject(self, s_hdfTextViewPlaceholderLabelKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self.placeholderLabel removeFromSuperview];
        return;
    }
    
    objc_setAssociatedObject(self,
                             s_hdfTextViewPlaceholderTextKey,
                             hdf_placeholder,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    if ([self.text isEqualToString:@""]) {
        self.placeholderLabel.text = @"";
    } else {
        self.placeholderLabel.text = hdf_placeholder;
    }
}

- (NSString *)hdf_placeholder {
    return objc_getAssociatedObject(self, s_hdfTextViewPlaceholderTextKey);
}

- (void)setHdf_placeholderColor:(UIColor *)hdf_placeholderColor {
    self.placeholderLabel.textColor = hdf_placeholderColor;
}

- (UIColor *)hdf_placeholderColor {
    return self.placeholderLabel.textColor;
}

- (void)setHdf_placeholderFont:(UIFont *)hdf_placeholderFont {
    self.placeholderLabel.font = hdf_placeholderFont;
}

- (UIFont *)hdf_placeholderFont {
    return self.placeholderLabel.font;
}

@end
