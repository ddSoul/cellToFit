//
//  XYCacheHelper.m
//  cellToFit
//
//  Created by 邓西亮 on 16/9/2.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "XYCacheHelper.h"

@implementation XYCacheHelper

+(XYCacheHelper *)shareManager{
    
    static XYCacheHelper* manager = nil;
    
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        
        manager = [[[self class] alloc] init];
    });
    
    return manager;
    
}

////设置缓存
//- (void)cacheObject:(id)obj forKey:(NSString *)keyString
//{
//    
//}
//
////取出缓存
//- (instancetype)getCacheObjectForkey:(NSString *)keyString
//{
//    return nil;
//}
//
////清理缓存
//- (BOOL)clearMermery
//{
//    return YES;
//}

@end
