//
//  FMDatabase+helper.m
//  cellToFit
//
//  Created by 邓西亮 on 16/9/19.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "FMDatabase+helper.h"

@implementation FMDatabase (helper)

- (BOOL)xl_insertData:(NSDictionary *)dictionary withDateBase:(FMDatabase *)db
{
    // 如果执行查询方法
    NSString *_whereStr = [dictionary allKeys].firstObject;
    NSArray *_valueSte = [dictionary allValues].firstObject;
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM xl_chatTie WHERE %@ == ?;",_whereStr];
    FMResultSet *resultSet = [db executeQuery:sql, _valueSte];
    while ([resultSet next]) {
        // 如果这个userId的数据存在, 修改数据
        if ([db executeUpdate:@"UPDATE xl_chatTie SET nickName = ? WHERE userId == ?;", @"", @""]) {
            NSLog(@"保存昵称成功了哦");
            return YES;
        }
        NSLog(@"更改昵称失败了哦卧槽");
        return NO;
    }
    // 当这个userId的数据不存在, 创建一条数据
    if ([db executeUpdate:@"INSERT INTO xl_chatTie (userId,nickName) VALUES (?, ?);",@"", @""]) {
        NSLog(@"添加成功了哦");
        return YES;
    }
    return NO;

    return YES;
}

- (BOOL)xl_deleteData:(NSDictionary *)dictionary withDateBase:(FMDatabase *)db
{
    return YES;
}

- (BOOL)xl_updataData:(NSDictionary *)dictionary withDateBase:(FMDatabase *)db
{
    return YES;
}

- (instancetype)xl_selectData:(NSDictionary *)dictionary withDateBase:(FMDatabase *)db
{
    return nil;
}

@end
