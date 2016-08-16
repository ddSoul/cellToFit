//
//  MienChatView.m
//  cellToFit
//
//  Created by 邓西亮 on 16/8/16.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "MienChatView.h"
#import "Masonry.h"
#import "ChatDataSoure.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define view_scal (ScreenWidth/1242)

@interface MienChatView ()

@property (nonatomic, strong) UIImageView *headerImageView;

@property (nonatomic, strong) UILabel *nickName;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIImageView *contentBaseImageView;

@end

@implementation MienChatView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.frame = frame;
        [self createControls];
        [self setAutoLayout];
    }
    return self;
}
- (void)createControls
{
    self.backgroundColor = [UIColor whiteColor];
    self.headerImageView = [[UIImageView alloc] init];
    self.headerImageView.image = [UIImage imageNamed:@"me"];
    [self addSubview:self.headerImageView];
    
    self.contentBaseImageView = [[UIImageView alloc] init];
    self.contentBaseImageView.image = [UIImage imageNamed:@"chat"];
    [self addSubview:self.contentBaseImageView];
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.font = [UIFont systemFontOfSize:50*view_scal];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.preferredMaxLayoutWidth = ScreenWidth - 400*view_scal;
    [self.contentBaseImageView addSubview:self.contentLabel];

}
- (void)setAutoLayout
{
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.top.mas_equalTo(60*view_scal);
        make.height.width.mas_equalTo(100*view_scal).priorityHigh();
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(100*view_scal);
        make.top.mas_equalTo(60*view_scal);
        make.bottom.mas_equalTo(-60*view_scal);
    }];
    
    [self.contentBaseImageView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(60*view_scal);
        make.left.mas_equalTo(self.headerImageView).offset(120*view_scal);
        make.bottom.mas_equalTo(-60*view_scal);
        make.right.mas_equalTo(self.contentLabel).offset(60*view_scal);
    }];

}
- (void)setModel:(ChatDataSoure *)model
{
    self.contentLabel.text = model.content;
}

@end