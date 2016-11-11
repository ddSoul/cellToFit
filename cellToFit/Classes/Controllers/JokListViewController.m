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
#import "NSCache+XYCacheHelper.h"
#import "NetworkingCountTool.h"



#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define view_scal (ScreenWidth/1242)

@interface JokListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *allMutableArray;
@property (nonatomic, assign) NSInteger page;


@end

@implementation JokListViewController

- (void)viewDidDisappear:(BOOL)animated
{
    int count = [NetworkingCountTool get3GFlowIOBytes];
    long wifiCount = [NetworkingCountTool getWifiInterfaceBytes];
    NSLog(@"____3G%d___WIFI%ld",count/1024/1024,wifiCount/1024/1024);
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = NO;
    self.title = @"Demo";
    self.page = 1;
    [self requestListofPage:@"1"];
    [self createTableView];

<<<<<<< Updated upstream
=======
    NSString *str = [[NSCache shareManager] objectForKey:@"test"];
    NSLog(@"___________%@==========test=======",str);

>>>>>>> Stashed changes
    
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
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"cell"];
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
    return [tableView fd_heightForCellWithIdentifier:@"cell" configuration:^(CustomTableViewCell *cell) {
        
        [cell setModel:self.allMutableArray[indexPath.row] indexPath:indexPath];
        
    }];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell setModel:self.allMutableArray[indexPath.row] indexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.CommentBtnClickBlock = ^(UIButton *commentBtn,NSIndexPath * indexPath)
    {
        NSLog(@"你点击的cell的index.row=%ld",(long)indexPath.row);

    };

    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
