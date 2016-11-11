//
//  UserInfodbManager.m
//  cellToFit
//
//  Created by 邓西亮 on 16/8/23.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "UserInfodbManager.h"
#import "VersionConfigeTool.h"

static FMDatabase *_chatdb;
//static FMDatabase *_testdb;
@implementation UserInfodbManager

//创建格式化数据库
+ (void)configeChatDateBase
{
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"userinfo.sqlite"];
    NSLog(@"%@",path);
    _chatdb = [FMDatabase databaseWithPath:path];
    // 打开数据库
    if ([_chatdb open]) {
        NSLog(@"打开成功");
        NSString *sql = @"CREATE TABLE IF NOT EXISTS xl_userinfo(userId TEXT PRIMARY KEY NOT NULL, nickname TEXT, sign TEXT,headerimagedata blob);";
        if ([_chatdb executeUpdate:sql]) {
            NSLog(@"用户信息表创建成功");
        }else{
            NSLog(@"信息表创建失败");
        }
        
    }else{
        NSLog(@"打开失败");
    }
    
    if ([VersionConfigeTool isNeedUploadLocationDatabaseWithDbName:@"us"]) {
        //更新操作
        //1.更换表名字
        [_chatdb executeQuery:@"ALTER TABLE xl_userinfo RENAME TO temp_userinfo"];
        
        
    }
}

//存储用户Id
+ (BOOL)saveUserName:(NSString *)userName withUserId:(NSString *)userId
{
    // 如果执行查询方法
    FMResultSet *resultSet = [_chatdb executeQuery:@"SELECT * FROM xl_userinfo WHERE userId == ?;", userId];
    while ([resultSet next]) {
        // 如果这个userId的数据存在, 修改数据
        if ([_chatdb executeUpdate:@"UPDATE xl_userinfo SET nickname = ? WHERE userId == ?;", userName, userId]) {
            return YES;
        }
        return NO;
    }
    // 当这个userId的数据不存在, 创建一条数据
    if ([_chatdb executeUpdate:@"INSERT INTO xl_userinfo (userId,nickname,sign,headerimagedata) VALUES (?, ?, ?, ?);",userId, userName, @"", nil]) {
        return YES;
    }
    return NO;

}

//存储用户个人签名
+ (BOOL)saveUserSign:(NSString *)signString withUserId:(NSString *)userId
{
    // 如果执行查询方法
    FMResultSet *resultSet = [_chatdb executeQuery:@"SELECT * FROM xl_userinfo WHERE userId == ?;", userId];
    while ([resultSet next]) {
        // 如果这个userId的数据存在, 修改数据
        if ([_chatdb executeUpdate:@"UPDATE xl_userinfo SET sign = ? WHERE userId == ?;", signString, userId]) {
            return YES;
        }
        return NO;
    }
    // 当这个userId的数据不存在, 创建一条数据
    if ([_chatdb executeUpdate:@"INSERT INTO xl_userinfo (userId,nickname,sign,headerimagedata) VALUES (?, ?, ?, ?);",userId, @"", signString, nil]) {
        return YES;
    }
    return NO;

    
}

//存储用户头像
+ (BOOL)saveUserHaderImageData:(NSData *)imageData withUserId:(NSString *)userId
{
    // 如果执行查询方法
    FMResultSet *resultSet = [_chatdb executeQuery:@"SELECT * FROM xl_userinfo WHERE userId == ?;", userId];
    while ([resultSet next]) {
        // 如果这个userId的数据存在, 修改数据
        if ([_chatdb executeUpdate:@"UPDATE xl_userinfo SET headerimagedata = ? WHERE userId == ?;", imageData, userId]) {
            return YES;
        }
        return NO;
    }
    // 当这个userId的数据不存在, 创建一条数据
    if ([_chatdb executeUpdate:@"INSERT INTO xl_userinfo (userId,nickname,sign,headerimagedata) VALUES (?, ?, ?, ?);",userId, @"", @"", imageData]) {
        return YES;
    }
    return NO;
}

//获取信息
+ (NSDictionary *)getUserNamewithId:(NSString *)userId
{
    // 如果执行查询方法
    FMResultSet *resultSet = [_chatdb executeQuery:@"SELECT * FROM xl_userinfo WHERE userId == ?;", userId];
    // 如果下一条内容存在,循环查询赋值
    while ([resultSet next]) {
        
        NSDictionary *dic;
        if ([resultSet stringForColumn:@"nickname"] && [resultSet stringForColumn:@"sign"] && [resultSet dateForColumn:@"headerimagedata"] ) {
            dic = @{
                    @"nameString":[resultSet stringForColumn:@"nickname"],
                    @"signString":[resultSet stringForColumn:@"sign"],
                    @"imageData":[resultSet dataForColumn:@"headerimagedata"],
                    };
        }
        return dic;

    }
    return nil;

}

//删除用户信息
+ (BOOL)removeUserInfoWithId:(NSString *)userId
{
    // 如果执行非查询方法成功
    if ([_chatdb executeUpdate:@"DELETE FROM xl_userinfo WHERE userId == ?;", userId]) {
        NSLog(@"删除数据成功");
        return YES;
    }
    NSLog(@"删除数据失败");
    return NO;

}

//获取表数据count
+ (NSInteger)getfromDataCount
{
    FMResultSet *resultSet = [_chatdb executeQuery:@"SELECT count(*) as 'count' FROM xl_userinfo"];
    while ([resultSet next])
        
    {
        NSInteger count = [resultSet intForColumn:@"count"];
        return count;
        
    }
    return 0;
}

//获取变得全部数据
+ (NSArray *)getformData
{
    NSMutableArray *_allMutableData = @[].mutableCopy;
     FMResultSet *resultSet = [_chatdb executeQuery:@"SELECT * FROM xl_userinfo"];
    
    while ([resultSet next]) {
        NSDictionary *_tempDic;
        _tempDic = @{
                @"useridString":[resultSet stringForColumn:@"userId"],
                @"nameString":[resultSet stringForColumn:@"nickname"],
                @"signString":[resultSet stringForColumn:@"sign"],
                @"imageData":[resultSet dataForColumn:@"headerimagedata"]
                };
        [_allMutableData addObject:_tempDic];
    }
    return _allMutableData;
}



@end
