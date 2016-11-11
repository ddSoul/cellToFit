//
//  ChartViewController.m
//  cellToFit
//
//  Created by 邓西亮 on 16/9/6.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "ChartViewController.h"
#import "Student.h"
#import "Student+test.h"
#import "UITextView+placeholder.h"
#import "VersionConfigeTool.h"
#import "JKScrollFocus.h"
#import "UIImageView+WebCache.h"

@interface ChartViewController ()<UITextViewDelegate>

@property (nonatomic,strong)JKScrollFocus *jKScrollView;

@end

@implementation ChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.jKScrollView];
    [self setBannerModel];
    [VersionConfigeTool isNeedUploadLocationDatabaseWithDbName:@"hello"];
    // Do any additional setup after loading the view.
}

#pragma mark 循环轮播图
- (JKScrollFocus *)jKScrollView
{
    if (_jKScrollView == nil) {
        _jKScrollView = [[JKScrollFocus alloc] initWithFrame:CGRectMake(0, 100, 400, 200)];
        _jKScrollView.backgroundColor = [UIColor greenColor];
    }
    _jKScrollView.items = @[@"",@"",@""];
    [_jKScrollView didSelectJKScrollFocusItem:^(id item,NSInteger index) {
        NSLog(@"click %ld,item:%@",(long)index,item);
    }];
    return _jKScrollView;
}
- (void)setBannerModel
{
    [_jKScrollView downloadJKScrollFocusItem:^(id item, UIImageView *currentImageView) {
        
        [currentImageView sd_setImageWithURL:[NSURL URLWithString:@"http://oss-upload-test.oss-cn-shanghai.aliyuncs.com/user/2b70878141ed4a81604198a3a369894a.jpg"] placeholderImage:nil];
    }];
    [_jKScrollView titleForJKScrollFocusItem:^NSString *(id item, UILabel *currentLabel) {
        return @"你好";
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
