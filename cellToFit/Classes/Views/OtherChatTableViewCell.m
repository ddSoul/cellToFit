//
//  OtherChatTableViewCell.m
//  cellToFit
//
//  Created by 邓西亮 on 16/8/16.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "OtherChatTableViewCell.h"
#import "Masonry.h"
#import "ChatDataSoure.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define view_scal (ScreenWidth/1242)

@interface OtherChatTableViewCell ()

@property (nonatomic, strong) UIImageView *headerImageView;

@property (nonatomic, strong) UILabel *nickName;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIImageView *contentBaseImageView;

@end

@implementation OtherChatTableViewCell


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
- (void)createControls
{
    self.backgroundColor = [UIColor whiteColor];
    self.headerImageView = [[UIImageView alloc] init];
    self.headerImageView.image = [UIImage imageNamed:@"you"];
    [self.contentView addSubview:self.headerImageView];
    
    self.contentBaseImageView = [[UIImageView alloc] init];
    self.contentBaseImageView.image = [UIImage imageNamed:@"right"];
    [self.contentView addSubview:self.contentBaseImageView];
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.font = [UIFont systemFontOfSize:50*view_scal];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.preferredMaxLayoutWidth = ScreenWidth - 400*view_scal;
    [self.contentBaseImageView addSubview:self.contentLabel];
    
}

- (void)setAutoLayout
{
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(60*view_scal);
        make.right.mas_equalTo(-60*view_scal);
        make.height.width.mas_equalTo(150*view_scal);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(60*view_scal);
        make.bottom.mas_equalTo(-60*view_scal);
        make.right.mas_equalTo(-60*view_scal);
    }];
    
    [self.contentBaseImageView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(60*view_scal);
        make.left.mas_equalTo(self.contentLabel).offset(-60*view_scal);
        make.bottom.mas_equalTo(-60*view_scal);
        make.right.mas_equalTo(-210*view_scal);
    }];
    
}
- (void)setModel:(ChatDataSoure *)model
{
    self.contentLabel.text = model.content;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
