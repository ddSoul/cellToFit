//
//  ChatTableViewCell.m
//  cellToFit
//
//  Created by 邓西亮 on 16/8/16.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "ChatTableViewCell.h"
#import "MienChatView.h"
#import "OtherChatView.h"
#import "ChatDataSoure.h"
#import "Masonry.h"

@interface ChatTableViewCell ()

@property (nonatomic, strong) MienChatView *mineChatView;
@property (nonatomic, strong) OtherChatView *otherChatView;

@end

@implementation ChatTableViewCell


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
    self.mineChatView = [[MienChatView alloc] init];
    self.otherChatView = [[OtherChatView alloc] init];
    
}

- (void)setModel:(ChatDataSoure *)model
{
    if ([model.userID isEqualToString:@"1"]) {
        self.mineChatView.model = model;
        [self.contentView addSubview:self.mineChatView];
        [self setMienLayout];
    }else{
        self.otherChatView.model = model;
        [self.contentView addSubview:self.otherChatView];
        [self setOtherLayout];
    }
}
- (void)setMienLayout
{
    [self.mineChatView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.left.right.bottom.mas_equalTo(0);
    }];
}

- (void)setOtherLayout{
    [self.otherChatView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.left.right.bottom.mas_equalTo(0);
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
