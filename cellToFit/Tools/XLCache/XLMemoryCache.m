//
//  XLMemoryCache.m
//  Anxinlicai
//
//  Created by 邓西亮 on 16/9/5.
//  Copyright © 2016年 邓西亮. All rights reserved.
//

#import "XLMemoryCache.h"


@interface XLMemoryCache ()

@property (nonatomic, strong) NSCache *memoryCache;

@end

@implementation XLMemoryCache


- (id)init
{
    return [self initMemoryCache];
}

- (instancetype)initMemoryCache
{
    if ([super init]) {
        //初始化内存缓存
            _memoryCache = [[NSCache alloc] init];
            _memoryCache.name = @"com.message";
            _memoryCache.countLimit = _maxCacheSize;
    }
    return self;
}

- (void)setMemoryCacheObject:(id)obj forKey:(NSString *)keyString
{
    [self.memoryCache removeObjectForKey:keyString];
    [self.memoryCache setObject:obj forKey:keyString];
}

- (id)getMemoryCacheObjetForKey:(NSString *)keyString
{
    return [self.memoryCache objectForKey:keyString];
}

@end
