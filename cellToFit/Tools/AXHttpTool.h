//
//  AXHttpTool.h
//  Anxinlicai
//
//  Created by 邓西亮 on 16/7/28.
//  Copyright © 2016年 邓西亮. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successHandle) (id result);
typedef void(^failureHandle) (NSError *error);

@interface AXHttpTool : NSObject

//冷笑话哈哈哈
+ (void)getCloudListParams:(NSDictionary *)params Succsee:(successHandle)completion failure:(failureHandle)failure;

@end
