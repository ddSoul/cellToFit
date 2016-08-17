//
//  ChatViewController.m
//  cellToFit
//
//  Created by 邓西亮 on 16/8/16.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatDataSoure.h"
#import "FootToolViews.h"
#import "OtherChatTableViewCell.h"
#import "MineChatTableViewCell.h"
#import "MJExtension.h"
#import "ProgressHUD.h"
#import "Masonry.h"
#import "MJRefresh.h"
#import "XLHeader.h"
#import "UITableView+FDTemplateLayoutCell.h"

@interface ChatViewController ()<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate,senderMessageDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *allMutableArray;
@property (nonatomic, assign) CGFloat textViewHeight;
@property (nonatomic, strong) FootToolViews *foottoolViews;

@end

@implementation ChatViewController


- (NSMutableArray *)allMutableArray
{
    if (!_allMutableArray) {
        _allMutableArray = @[].mutableCopy;
    }
    return _allMutableArray;
}
- (FootToolViews *)foottoolViews
{
    if (!_foottoolViews) {
        _foottoolViews = [FootToolViews configureKeyboard];
        _foottoolViews.delegate = self;
    }
    return _foottoolViews;
}

#pragma mark Views
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = NO;
    self.title = @"Demo";
    [self createTableView];
    [self requestList];
    [self.view addSubview:self.foottoolViews];
}

- (void)createTableView
{
    self.tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.tableView registerClass:[MineChatTableViewCell class] forCellReuseIdentifier:@"chatCell"];
    [self.tableView registerClass:[OtherChatTableViewCell class] forCellReuseIdentifier:@"otherchatCell"];
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    
    //MJRefresh自定义刷新控件
    //    __weak typeof(self) weakSelf = self;
    //    self.tableView.mj_header = [XLHeader headerWithRefreshingBlock:^{
    //        [weakSelf refresh];
    //    }];
    //默认【上拉加载】
    //    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    
}

#pragma mark RequestData
- (void)requestList
{
    NSArray *array = @[
                       @{@"headerImageUrl":@"55",@"content":@"你好",@"userID":@"1",@"userNickName":@"55"},
                       @{@"headerImageUrl":@"55",@"content":@"哎呦不错啊啊啊",@"userID":@"2",@"userNickName":@"55"},
                       @{@"headerImageUrl":@"55",@"content":@"v哎呦大大大大不错啊啊大大大大大大大大大大大大大啊v哎呦不错啊啊啊佛扣扣密码烦什么覅是能否能使肌肤能使肌肤你手机",@"userID":@"2",@"userNickName":@"55"},
                       @{@"headerImageUrl":@"55",@"content":@"oosdmkdv",@"userID":@"1",@"userNickName":@"55"},
                       @{@"headerImageUrl":@"55",@"content":@"vv",@"userID":@"1",@"userNickName":@"55"},
                       @{@"headerImageUrl":@"55",@"content":@"vffsfsfsf",@"userID":@"2",@"userNickName":@"55"},
                       @{@"headerImageUrl":@"55",@"content":@"dadkamdkmadkmmdamkdmkamdkdadkamdkmadkmmdamkdmkamdkdadkamdkmadkmmdamkdmkamdkdadkamdkmadkmmdamkdmkamdk",@"userID":@"2",@"userNickName":@"55"},
                       @{@"headerImageUrl":@"55",@"content":@"vffffffffv",@"userID":@"1",@"userNickName":@"55"},
                       ];
    for (NSDictionary *value in array) {
        
        ChatDataSoure *dataSoureModel = [ChatDataSoure mj_objectWithKeyValues:value];
        [self.allMutableArray addObject:dataSoureModel];
    }
    [self.tableView reloadData];
}

#pragma mark MJRefresh Method
- (void)loadMore
{
    [ProgressHUD showStatus];
    [self.tableView.mj_footer beginRefreshing];
    NSDictionary *tempDic = @{@"headerImageUrl":@"55",@"content":@"=一",@"userID":@"2",@"userNickName":@"55"};
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
    NSDictionary *tempDic = @{@"headerImageUrl":@"55",@"content":@"啊啊啊啊啊一",@"userID":@"1",@"userNickName":@"55"};
    ChatDataSoure *chatModel = [ChatDataSoure mj_objectWithKeyValues:tempDic];
    [self.allMutableArray insertObject:chatModel atIndex:0];
    [self.tableView.mj_header endRefreshing];
    [self.tableView reloadData];
    [ProgressHUD statusDismiss];
    
}

#pragma mark tableview DelegateMethod
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allMutableArray.count;
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    ChatDataSoure *chatModel = self.allMutableArray[indexPath.row];
    if ([chatModel.userID isEqualToString:@"1"]) {

        return [tableView fd_heightForCellWithIdentifier:@"chatCell" configuration:^(MineChatTableViewCell *cell) {
            
            cell.model = chatModel;
            
        }];
    }else{
        return [tableView fd_heightForCellWithIdentifier:@"otherchatCell" configuration:^(OtherChatTableViewCell *cell) {
            
            cell.model = chatModel;
            
        }];
    }

    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ChatDataSoure *chatModel = self.allMutableArray[indexPath.row];

    if ([chatModel.userID isEqualToString:@"1"]) {
        MineChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chatCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = chatModel;
        return cell;
    }else{
        OtherChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"otherchatCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = chatModel;
        return cell;
    }
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.foottoolViews.inputTextView resignFirstResponder];
}

#pragma mark FootToolViews DelegateMethod
- (void)keyBoardDismiss
{
    [self.tableView setContentOffset:CGPointMake(0, 1000*view_scal) animated:YES];
}
- (void)keyBoardShow:(CGFloat)keyboardHeight
{
    [self.tableView setContentOffset:CGPointMake(0, 2000*view_scal) animated:YES];
}
- (void)inputTextViewHeightChange
{
    
}
- (void)senderMessage
{
    [self.tableView setContentOffset:CGPointMake(0, 3000*view_scal) animated:YES];
    NSLog(@"-________%@",self.foottoolViews.inputTextView.text);
    [ProgressHUD showStatus];
    [self.tableView.mj_footer beginRefreshing];
    NSDictionary *tempDic = @{@"headerImageUrl":@"55",@"content":self.foottoolViews.inputTextView.text,@"userID":@"2",@"userNickName":@"55"};
    ChatDataSoure *chatModel = [ChatDataSoure mj_objectWithKeyValues:tempDic];
    [self.allMutableArray insertObject:chatModel atIndex:self.allMutableArray.count];
    [self.tableView.mj_footer endRefreshing];
    [self.tableView reloadData];
    [ProgressHUD statusDismiss];
    self.foottoolViews.inputTextView.text = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
