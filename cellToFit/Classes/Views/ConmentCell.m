//
//  ConmentCell.m
//  cellToFit
//
//  Created by ddSoul on 16/11/11.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "ConmentCell.h"
#import "Masonry.h"
#import "Conment.h"

@interface ConmentCell ()

@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) UIButton *alltitleButon;

@end


@implementation ConmentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self createControls];
    }
    return self;
}
/**
 *  创建控件
 */
- (void)createControls
{
    self.commentLabel = [[UILabel alloc] init];
    self.commentLabel.backgroundColor = [UIColor whiteColor];
    self.commentLabel.numberOfLines = 0;
    self.commentLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.commentLabel];
    
    self.alltitleButon = [UIButton buttonWithType:UIButtonTypeCustom];
    self.alltitleButon.backgroundColor = [UIColor greenColor];
    [self.alltitleButon addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.alltitleButon];
    
    [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    
    [self.alltitleButon mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(self.commentLabel.mas_bottom).offset(10);
        make.bottom.mas_equalTo(-10);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(50);
    }];
}

- (void)setModel:(Conment *)model
{
    self.commentLabel.text = model.title;
}


- (void)click:(UIButton *)button
{
    if (self.allTitleButton) {
        self.allTitleButton(button);
    }
}


@end
