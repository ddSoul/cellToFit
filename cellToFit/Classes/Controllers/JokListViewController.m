//
//  JokListViewController.m
//  cellToFit
//
//  Created by 邓西亮 on 16/8/16.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "JokListViewController.h"
#import "JokModel.h"
#import "CustomTableViewCell.h"
#import "AXHttpTool.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "ProgressHUD.h"
#import "Masonry.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "XLHeader.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define view_scal (ScreenWidth/1242)

@interface JokListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *allMutableArray;
@property (nonatomic, assign) NSInteger page;


@end

@implementation JokListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = NO;
    self.title = @"Demo";
    self.page = 1;
    [self requestListofPage:@"1"];
    [self createTableView];
    
}

- (NSMutableArray *)allMutableArray
{
    if (!_allMutableArray) {
        _allMutableArray = @[].mutableCopy;
    }
    return _allMutableArray;
}
- (void)requestListofPage:(NSString *)page
{
    [ProgressHUD showStatus];
    [AXHttpTool getCloudListParams:@{@"page":page} Succsee:^(id responseObject){
        [ProgressHUD statusDismiss];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        JokModel *jkModel =
        [JokModel mj_objectWithKeyValues:responseObject[@"showapi_res_body"]];
        for (NSDictionary *value in jkModel.contentlist) {
            [self.allMutableArray addObject:value];
        }
        
        [ProgressHUD statusDismiss];
        [self.tableView reloadData];
        
    }failure:^(NSError *error){
        NSLog(@"%@",error);
    }];
    
}
- (void)createTableView
{
    self.tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"CustomCell"];
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    
    //MJRefresh自定义刷新控件
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [XLHeader headerWithRefreshingBlock:^{
        [weakSelf refresh];
    }];
    //默认【上拉加载】
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    
    
}
- (void)loadMore
{
    [ProgressHUD showStatus];
    NSString *pageStr = [NSString stringWithFormat:@"%ld",(self.page+1)];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_footer beginRefreshing];
        [self requestListofPage:pageStr];
    });
}

- (void)refresh
{
    self.page = 1;
    [ProgressHUD showStatus];
    [self.tableView.mj_header beginRefreshing];
    self.allMutableArray = @[].mutableCopy;
    [self requestListofPage:@"1"];
}

#pragma mark tableviewDelegate
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allMutableArray.count;
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:@"CustomCell" configuration:^(CustomTableViewCell *cell) {
        
        cell.model = self.allMutableArray[indexPath.row];
        
    }];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell" forIndexPath:indexPath];
    cell.model = self.allMutableArray[indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
