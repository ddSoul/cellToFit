//
//  CustomTableViewCell.m
//  cellToFit
//
//  Created by 邓西亮 on 16/8/12.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "JokCell.h"
#import "JokModel.h"
#import "UILabel+sizeTofitWdthAndHeigh.h"
#import "Masonry.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define view_scal (ScreenWidth/1242)

@interface JokCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *baseIamgeView;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end

@implementation JokCell


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
    self.baseIamgeView = [[UIImageView alloc] init];
    self.baseIamgeView.image = [UIImage imageNamed:@"chat"];
    [self.contentView addSubview:self.baseIamgeView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:50*view_scal];
    self.titleLabel.numberOfLines = 0;
    [self.baseIamgeView addSubview:self.titleLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(self.baseIamgeView).offset(100*view_scal);
        make.top.mas_equalTo(self.baseIamgeView).offset(60*view_scal);
        make.right.bottom.mas_equalTo(self.baseIamgeView).offset(-60*view_scal);
    }];
    
    [self.baseIamgeView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.left.mas_equalTo(60*view_scal);
        make.right.bottom.mas_equalTo(-60*view_scal);
    }];

    
}

- (void)setModel:(Contentlist *)model
{
    self.titleLabel.text = model.text;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
