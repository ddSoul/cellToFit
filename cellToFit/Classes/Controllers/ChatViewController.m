//
//  ChatViewController.m
//  cellToFit
//
//  Created by 邓西亮 on 16/8/16.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatDataSoure.h"
#import "ChatTableViewCell.h"
#import "MJExtension.h"
#import "ProgressHUD.h"
#import "Masonry.h"
#import "MJRefresh.h"
#import "XLHeader.h"
#import "UITableView+FDTemplateLayoutCell.h"

@interface ChatViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *allMutableArray;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = NO;
    self.title = @"Demo";
    [self createTableView];
    [self requestList];
}
- (void)requestList
{
    NSArray *array = @[
                       @{@"headerImageUrl":@"55",@"content":@"你好",@"userID":@"1",@"userNickName":@"55"},
                       @{@"headerImageUrl":@"55",@"content":@"哎呦不错啊啊啊",@"userID":@"2",@"userNickName":@"55"},
                       @{@"headerImageUrl":@"55",@"content":@"v哎呦大大大大不错啊啊大大大大大大大大大大大大大啊v哎呦不错啊啊啊佛扣扣密码烦什么覅是能否能使肌肤能使肌肤你手机",@"userID":@"1",@"userNickName":@"55"},
                       @{@"headerImageUrl":@"55",@"content":@"oosdmkdv",@"userID":@"1",@"userNickName":@"55"},
                       @{@"headerImageUrl":@"55",@"content":@"vv",@"userID":@"1",@"userNickName":@"55"},
                       @{@"headerImageUrl":@"55",@"content":@"vffsfsfsf",@"userID":@"2",@"userNickName":@"55"},
                       @{@"headerImageUrl":@"55",@"content":@"dadkamdkmadkmmdamkdmkamdkdadkamdkmadkmmdamkdmkamdkdadkamdkmadkmmdamkdmkamdkdadkamdkmadkmmdamkdmkamdk",@"userID":@"2",@"userNickName":@"55"},
                       @{@"headerImageUrl":@"55",@"content":@"vffffffffv",@"userID":@"2",@"userNickName":@"55"},
                       ];
    for (NSDictionary *value in array) {
        
        ChatDataSoure *dataSoureModel = [ChatDataSoure mj_objectWithKeyValues:value];
        [self.allMutableArray addObject:dataSoureModel];
    }
    [self.tableView reloadData];
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
   
}
- (void)createTableView
{
    self.tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.tableView registerClass:[ChatTableViewCell class] forCellReuseIdentifier:@"CustomCell"];
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
//
    
}
- (void)loadMore
{
    [ProgressHUD showStatus];
    [self.tableView.mj_footer beginRefreshing];
    NSDictionary *tempDic = @{@"headerImageUrl":@"55",@"content":@"====------====哦哦哦哦哦哦哦哦啪啪啪啪啪啪啪一一一一一一一一一",@"userID":@"2",@"userNickName":@"55"};
    ChatDataSoure *chatModel = [ChatDataSoure mj_objectWithKeyValues:tempDic];
    [self.allMutableArray insertObject:chatModel atIndex:self.allMutableArray.count];
    [self.tableView.mj_footer endRefreshing];
    [self.tableView reloadData];
    [ProgressHUD statusDismiss];
}

- (void)refresh
{
    [ProgressHUD showStatus];
    [self.tableView.mj_header beginRefreshing];
    NSDictionary *tempDic = @{@"headerImageUrl":@"55",@"content":@"啊啊啊啊啊啊啊啊哦哦哦哦哦哦哦哦哦啪啪啪啪啪啪啪一一一一一一一一一",@"userID":@"1",@"userNickName":@"55"};
    ChatDataSoure *chatModel = [ChatDataSoure mj_objectWithKeyValues:tempDic];
    [self.allMutableArray insertObject:chatModel atIndex:self.allMutableArray.count];
    [self.tableView.mj_header endRefreshing];
    [self.tableView reloadData];
    [ProgressHUD statusDismiss];
    
}

#pragma mark tableviewDelegate
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allMutableArray.count;
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:@"CustomCell" configuration:^(ChatTableViewCell *cell) {
        
        cell.model = self.allMutableArray[indexPath.row];
        
    }];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell" forIndexPath:indexPath];
    cell.model = self.allMutableArray[indexPath.row];
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
