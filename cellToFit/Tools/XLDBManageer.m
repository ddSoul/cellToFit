//
//  XLDBManageer.m
//  cellToFit
//
//  Created by 邓西亮 on 16/8/19.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "XLDBManageer.h"

static FMDatabase *_chatdb;
@implementation XLDBManageer

//创建格式化数据库
+ (void)configeChatDateBase
{
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"chatTool.sqlite"];
    NSLog(@"%@",path);
    _chatdb = [FMDatabase databaseWithPath:path];
    // 打开数据库
    if ([_chatdb open]) {
        NSLog(@"打开成功");
        // 创建信息表(指定字段 id idstr dict access_token)
        NSString *sql = @"CREATE TABLE IF NOT EXISTS xl_chatTie(userId TEXT PRIMARY KEY NOT NULL, nickname TEXT);";
        if ([_chatdb executeUpdate:sql]) {
            NSLog(@"信息表创建成功");
        }else{
            NSLog(@"信息表创建失败");
        }
    }else{
        NSLog(@"打开失败");
    }

}

//存储用户昵称
+ (BOOL)saveUserName:(NSString *)userName withUserId:(NSString *)userId
{
    // 如果执行查询方法
    FMResultSet *resultSet = [_chatdb executeQuery:@"SELECT * FROM xl_chatTie WHERE userId == ?;", userId];
    while ([resultSet next]) {
        // 如果这个userId的数据存在, 修改数据
        if ([_chatdb executeUpdate:@"UPDATE xl_chatTie SET nickName = ? WHERE userId == ?;", userName, userId]) {
            NSLog(@"保存昵称成功了哦");
            return YES;
        }
        NSLog(@"更改昵称失败了哦卧槽");
        return NO;
    }
    // 当这个userId的数据不存在, 创建一条数据
      if ([_chatdb executeUpdate:@"INSERT INTO xl_chatTie (userId,nickName) VALUES (?, ?);",userId, userName]) {
        NSLog(@"添加成功了哦");
        return YES;
    }
    return NO;
}

//获取用户昵称
+ (NSString *)getUserNamewithId:(NSString *)userId
{
    // 如果执行查询方法
    FMResultSet *resultSet = [_chatdb executeQuery:@"SELECT * FROM xl_chatTie WHERE userId == ?;", userId];
    // 如果下一条内容存在,循环查询赋值
    while ([resultSet next]) {
        return [resultSet stringForColumn:@"nickName"];
    }
    return @"";
}

//删除用户信息
+ (BOOL)removeUserInfoWithId:(NSString *)userId
{
    // 如果执行非查询方法成功
    if ([_chatdb executeUpdate:@"DELETE FROM xl_chatTie WHERE userId == ?;", userId]) {
        NSLog(@"删除数据成功");
        return YES;
    }
    NSLog(@"删除数据失败");
    return NO;
}

@end
