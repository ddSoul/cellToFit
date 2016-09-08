//
//  HomeViewController.m
//  cellToFit
//
//  Created by 邓西亮 on 16/8/16.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "HomeViewController.h"
#import "JokListViewController.h"
#import "ProgressHUD.h"
#import "ChatViewController.h"


@interface HomeViewController ()
- (IBAction)jokButton:(UIButton *)sender;
- (IBAction)chatButton:(UIButton *)sender;
- (IBAction)otherButton:(UIButton *)sender;
- (IBAction)dbButton:(UIButton *)sender;
@property (nonatomic, strong) NSData *imageData;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    
//    NSLog(@"________%@",[XLDBManageer getUserNamewithId:@"1"]);
    
//    [[NSCache shareManager] setObject:@"你查没打卡没电啦麽登陆" forKey:@"test"];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)jokButton:(UIButton *)sender {
    JokListViewController *push = [[JokListViewController alloc] init];
    [self.navigationController pushViewController:push animated:YES];
}

- (IBAction)chatButton:(UIButton *)sender {
    
    ChatViewController *push = [[ChatViewController alloc] init];
    [self.navigationController pushViewController:push animated:YES];
//    [ProgressHUD showSuccessWithString:@"有待完善"];
    
}

- (IBAction)otherButton:(UIButton *)sender {
    [ProgressHUD showSuccessWithString:@"有待完善"];

}

- (IBAction)dbButton:(UIButton *)sender {
       [ProgressHUD showSuccessWithString:@"有待完善"];
}
@end
