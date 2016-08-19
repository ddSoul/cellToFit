//
//  CustomTableViewCell.h
//  cellToFit
//
//  Created by 邓西亮 on 16/8/12.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Contentlist;
@interface CustomTableViewCell : UITableViewCell

/**
 *  评论按钮的block
 */
@property (nonatomic, copy)void(^CommentBtnClickBlock)(UIButton *commentBtn,NSIndexPath * indexPath);

- (void)setModel:(Contentlist *)model indexPath:(NSIndexPath *)indexpath;

@end
