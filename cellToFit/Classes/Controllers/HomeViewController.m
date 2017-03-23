//
//  HomeViewController.m
//  cellToFit
//
//  Created by 邓西亮 on 16/8/16.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "HomeViewController.h"
#import "JokListViewController.h"
#import "ExpansionViewController.h"
#import "ProgressHUD.h"

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    /** xin pei zhi github commit test*/
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction
- (IBAction)jokButton:(UIButton *)sender {
    JokListViewController *push = [[JokListViewController alloc] init];
    [self.navigationController pushViewController:push animated:YES];
}

- (IBAction)chatButton:(UIButton *)sender {
    
    ExpansionViewController *push = [[ExpansionViewController alloc] init];
    [self.navigationController pushViewController:push animated:YES];

    
}

- (IBAction)otherButton:(UIButton *)sender {

    [ProgressHUD showSuccessWithString:@"有待完善"];

}

- (IBAction)dbButton:(UIButton *)sender {
    [ProgressHUD showSuccessWithString:@"有待完善"];
}
@end
