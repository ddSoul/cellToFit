//
//  UserInfodbManager.h
//  cellToFit
//
//  Created by 邓西亮 on 16/8/23.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface UserInfodbManager : NSObject

//创建格式化数据库
+ (void)configeChatDateBase;

//存储用户Id
+ (BOOL)saveUserName:(NSString *)userName withUserId:(NSString *)userId;

//存储用户个人签名
+ (BOOL)saveUserSign:(NSString *)signString withUserId:(NSString *)userId;

//存储用户头像
+ (BOOL)saveUserHaderImageData:(NSData *)imageData withUserId:(NSString *)userId;

//获取用信息
+ (NSDictionary *)getUserNamewithId:(NSString *)userId;

//删除用户信息
+ (BOOL)removeUserInfoWithId:(NSString *)userId;

//获取表数据count
+ (NSInteger)getfromDataCount;

//获取变得全部数据
+ (NSArray *)getformData;

@end
