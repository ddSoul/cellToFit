//
//  ExpansionViewController.m
//  cellToFit
//
//  Created by ddSoul on 16/11/11.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "ExpansionViewController.h"
#import "ConmentCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "Conment.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ExpansionViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *commentList;
@property (nonatomic, strong) NSMutableArray *commentListData;

@end

@implementation ExpansionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.commentList];
    [self loaddata];
}

#pragma mark - tableviewelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:@"cell" configuration:^(ConmentCell *cell) {
        
        cell.model = self.commentListData[indexPath.row];
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.commentListData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ConmentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"
                                                        forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.commentListData[indexPath.row];
    
    __weak typeof(self) weakSelf = self;
    cell.allTitleButton = ^(UIButton *button){
        
        Conment *cM = [Conment new];
        cM = self.commentListData[indexPath.row];
        if (!cM.expansion) {
            cM.title = @" hello world\n nice to meet you\n ai you bu cuo a\n mo xi mo xi\n dongci da ci";
            cM.expansion = YES;
        }else{
            cM.title = @" hello world";
            cM.expansion = NO;
        }
        [weakSelf.commentListData replaceObjectAtIndex:indexPath.row
                                            withObject:cM];
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil]
                         withRowAnimation:UITableViewRowAnimationAutomatic];
        
    };
    return cell;
}

#pragma mark - loadDate
- (void)loaddata{
    for (int i = 0; i<10; i++) {
        Conment *model = [Conment new];
        model.expansion = NO;
        model.title = @"hello world";
        [self.commentListData addObject:model];
    }
}


#pragma mark - setter,getter
- (UITableView *)commentList
{
    if (!_commentList) {
        _commentList = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)  style:UITableViewStylePlain];
        _commentList.delegate = self;
        _commentList.dataSource = self;
        [_commentList registerClass:[ConmentCell class] forCellReuseIdentifier:@"cell"];
    }
    return _commentList;
}
- (NSMutableArray *)commentListData
{
    if (!_commentListData) {
        _commentListData = @[].mutableCopy;
    }
    return _commentListData;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
