//
//  ConmentCell.h
//  cellToFit
//
//  Created by ddSoul on 16/11/11.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Conment;

@interface ConmentCell : UITableViewCell

@property (nonatomic, copy) void (^allTitleButton)(UIButton *button);

@property (nonatomic, strong) Conment *model;

@end
