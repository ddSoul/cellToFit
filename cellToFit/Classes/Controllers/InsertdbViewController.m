//
//  InsertdbViewController.m
//  cellToFit
//
//  Created by 邓西亮 on 16/8/23.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "InsertdbViewController.h"
#import "UserInfodbManager.h"
#import "GetImageData.h"
#import "ProgressHUD.h"

@interface InsertdbViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *nicknameTf;
@property (strong, nonatomic) IBOutlet UITextField *signTf;
- (IBAction)ImageButton:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *insertButton;
- (IBAction)insertButton:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *hearderImageButton;

@property (nonatomic, strong) NSData *user_iamgeData;

@end

@implementation InsertdbViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.nicknameTf.delegate = self;
    self.signTf.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)ImageButton:(UIButton *)sender {
    
    [[GetImageData shareManager] getbelowViewController:self ofType:0 ImageData:^void(NSData *imageData){
        UIImage *headerImage = [UIImage imageWithData:imageData];
        [self.hearderImageButton setBackgroundImage:headerImage forState:UIControlStateNormal];
        self.user_iamgeData = imageData;
        
    }];
}
- (IBAction)insertButton:(UIButton *)sender {
    
    NSString *userId = [NSString stringWithFormat:@"%@%@",@"xl_",self.nicknameTf.text];
    [UserInfodbManager saveUserName:self.nicknameTf.text withUserId:userId];
    [UserInfodbManager saveUserSign:self.signTf.text withUserId:userId];
    [UserInfodbManager saveUserHaderImageData:self.user_iamgeData withUserId:userId];
    [ProgressHUD showSuccessWithString:@"保存成功"];
}
@end
