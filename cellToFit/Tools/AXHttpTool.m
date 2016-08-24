//
//  AXHttpTool.m
//  Anxinlicai
//
//  Created by 邓西亮 on 16/7/28.
//  Copyright © 2016年 邓西亮. All rights reserved.
//

#import "AXHttpTool.h"
#import "XLHttpTool.h"

@implementation AXHttpTool
//冷笑话
+ (void)getCloudListParams:(NSDictionary *)params Succsee:(successHandle)completion failure:(failureHandle)failure
{
    NSString *urlStr = [NSString stringWithFormat:@"%@",@"http://apis.baidu.com/showapi_open_bus/showapi_joke/joke_text"];
    [XLHttpTool getWithUrl:urlStr
                    params:params
                   success:^(id responseObject)
    {
                    completion(responseObject);
    }
                   failure:^(NSError *error)
    {
                    failure(error);
                                            }];
}

@end
