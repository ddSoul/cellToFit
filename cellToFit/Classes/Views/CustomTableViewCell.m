//
//  CustomTableViewCell.m
//  cellToFit
//
//  Created by 邓西亮 on 16/8/12.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "JokModel.h"
#import "UILabel+sizeTofitWdthAndHeigh.h"
#import "Masonry.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define view_scal (ScreenWidth/1242)

@interface CustomTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation CustomTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self createControls];
        [self setAutoLayout];
    }
    return self;
}
/**
 *  创建控件
 */
- (void)createControls
{
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:50*view_scal];
    self.titleLabel.backgroundColor = [UIColor redColor];
    self.titleLabel.numberOfLines = 0;
    [self.contentView addSubview:self.titleLabel];
    
}
- (void)setAutoLayout
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.left.mas_equalTo(60*view_scal);
        make.right.bottom.mas_equalTo(-60*view_scal);
        //        make.height.mas_equalTo(70*view_scal);
    }];
}
- (void)setModel:(Contentlist *)model
{
    self.titleLabel.text = model.text;
    CGFloat height = [UILabel getHeightByWidth:ScreenWidth-120*view_scal title:model.text font:[UIFont systemFontOfSize:50*view_scal]];
    [self upLayout:height];
}
- (void)upLayout:(CGFloat)height
{
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make){
        make.height.mas_equalTo(height);
        make.top.left.mas_equalTo(60*view_scal);
        make.bottom.mas_equalTo(-60*view_scal);
    }];
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
