//
//  XLHttpTool.m
//  Anxinlicai
//
//  Created by 邓西亮 on 16/7/28.
//  Copyright © 2016年 邓西亮. All rights reserved.
//

#import "XLHttpTool.h"
#import "AFNetworking.h"

@implementation XLHttpTool

// get形式请求网络数据
+ (void)getWithUrl:(NSString *)urlStr params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"eb0d7633268c4e4d346bd6cfa57a47e5" forHTTPHeaderField:@"apikey"];
    manager.requestSerializer.timeoutInterval = 8.0f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript",@"text/plain", nil];
    NSLog(@"---_____%@",urlStr);
    [manager GET:urlStr parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

             if (success) {
                 
                     success(responseObject);
                }

            }
     
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
             
             if (failure) {
                 failure(error);
             }
             
             
         }];
    
    
}
// post形式请求网络数据
+ (void)postWithUrl:(NSString *)urlStr params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure
{


    
}

// put形式请求网络数据
+ (void)putWithUrl:(NSString *)urlStr params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure
{


}
// del形式请求网络数据
+ (void)delWithUrl:(NSString *)urlStr params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure
{


}

@end
