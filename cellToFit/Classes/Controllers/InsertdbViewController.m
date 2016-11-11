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
#import "UIImageView+WebCache.h"
#import "DBVersionUDTool.h"

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
    
    
//    UIImageView *testImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 300, 300)];
//    [testImageView sd_setImageWithURL:[NSURL URLWithString:@"https://a1.easemob.com/mesage/meou/chatfiles/de123e00-7979-11e6-9ac4-2fdd822ee911"] placeholderImage:[UIImage imageNamed:@"me"]];
//    [self.view addSubview:testImageView];

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
    
    DBVersionUDTool *tool = [DBVersionUDTool new];
    [tool userDataBaseVersionUpdata];
    
//    [[GetImageData shareManager] getbelowViewController:self ofType:0 ImageData:^void(NSData *imageData){
//        UIImage *headerImage = [UIImage imageWithData:imageData];
//        [self.hearderImageButton setBackgroundImage:headerImage forState:UIControlStateNormal];
//        self.user_iamgeData = imageData;
//        
//    }];
}
- (IBAction)insertButton:(UIButton *)sender {
    
    NSString *userId = [NSString stringWithFormat:@"%@%@",@"xl_",self.nicknameTf.text];
//
//    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        for (int i = 0; i<1000; i++) {
//            [UserInfodbManager saveUserName:self.nicknameTf.text withUserId:userId];
//            NSLog(@"uuuuuuuuuuuuuuuuuuuu");
//        }
//    });
//    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        for (int i = 0; i<1000; i++) {
//            [UserInfodbManager test:self.nicknameTf.text withUserId:userId];
//            NSLog(@"22223333333333444444455");
//        }
//
//    });

    
    [UserInfodbManager saveUserSign:self.signTf.text withUserId:userId];
    [UserInfodbManager saveUserHaderImageData:self.user_iamgeData withUserId:userId];
    [ProgressHUD showSuccessWithString:@"保存成功"];
    
    
}
@end
