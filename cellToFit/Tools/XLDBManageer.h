//
//  XLDBManageer.h
//  cellToFit
//
//  Created by 邓西亮 on 16/8/19.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface XLDBManageer : NSObject

//创建格式化数据库
+ (void)configeChatDateBase;

//存储用户昵称
+ (BOOL)saveUserName:(NSString *)userName withUserId:(NSString *)userId;

//获取用户昵称
+ (NSString *)getUserNamewithId:(NSString *)userId;

//删除用户信息
+ (BOOL)removeUserInfoWithId:(NSString *)userId;

@end
