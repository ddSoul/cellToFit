//
//  XLHttpTool.h
//  Anxinlicai
//
//  Created by 邓西亮 on 16/7/28.
//  Copyright © 2016年 邓西亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XLHttpTool : NSObject

// get形式请求网络数据
+ (void)getWithUrl:(NSString *)urlStr params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;
// post形式请求网络数据
+ (void)postWithUrl:(NSString *)urlStr params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;
// put形式请求网络数据
+ (void)putWithUrl:(NSString *)urlStr params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;
// del形式请求网络数据
+ (void)delWithUrl:(NSString *)urlStr params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

@end
