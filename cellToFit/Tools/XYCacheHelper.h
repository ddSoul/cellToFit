//
//  XYCacheHelper.h
//  cellToFit
//
//  Created by 邓西亮 on 16/9/2.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYCacheHelper : NSCache

+(XYCacheHelper *)shareManager;

////设置缓存
//- (void)cacheObject:(id)obj forKey:(NSString *)keyString;
//
////取出缓存
//- (instancetype)getCacheObjectForkey:(NSString *)keyString;
//
////清理缓存
//- (BOOL)clearMermery;

@end
