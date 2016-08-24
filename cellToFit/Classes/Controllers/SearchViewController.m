//
//  SearchViewController.m
//  cellToFit
//
//  Created by 邓西亮 on 16/8/18.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "SearchViewController.h"
#import "XLDBManageer.h"
#import "UserInfodbManager.h"

@interface SearchViewController ()<UISearchBarDelegate>

@property (nonatomic, strong)NSDictionary *dic;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSearchView];
//    [XLDBManageer saveUserName:@"hello" withUserId:@"1"];
    
    self.dic = [UserInfodbManager getUserNamewithId:@"xl_10"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithData:self.dic[@"imageData"]]];
    NSLog(@"_______%ld",(long)[UserInfodbManager getformData]);
}
- (void)createSearchView
{
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40)];
    searchBar.placeholder = @"搜索";
    searchBar.backgroundImage = [UIImage imageNamed:@"searchBar_BG"];
    searchBar.delegate = self;
    [self.view addSubview:searchBar];;

}

#pragma mark - UISearchBarDelegate
#pragma mark 搜索文字改变
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
}
#pragma mark 搜索开始编辑
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [UIView animateWithDuration:0.1f animations:^{
         searchBar.frame = CGRectMake(0, 22, self.view.frame.size.width, 40);
        [self.navigationController.view addSubview: searchBar];
    }];
    //设置取消按钮样式
    //首先取出cancelBtn
    UIButton *cancelBtn = [searchBar valueForKey:@"cancelButton"];
    //取消按钮文字
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    //取消按钮文字颜色
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
}

#pragma mark  编辑
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    //展示取消按钮
    searchBar.showsCancelButton = YES;
    return YES;
}
#pragma mark  编辑
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    return YES;
}
#pragma mark 取消按钮点击
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.frame = CGRectMake(0, 64, self.view.frame.size.width, 40);
    [self.view addSubview:searchBar];
    searchBar.text = @"";
    //收起键盘
    [searchBar resignFirstResponder];
    //隐藏取消按钮
    [searchBar setShowsCancelButton:NO animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
