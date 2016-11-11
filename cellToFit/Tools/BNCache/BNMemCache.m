//
//  BNMemCache.m
//  缓存管理
//
//  Created by xiaos on 16/6/17.
//  Copyright © 2016年 com.xsdota. All rights reserved.
//

#import "BNMemCache.h"
#import "YYCache.h"

@implementation BNMemCache

+ (YYMemoryCache *)memCache {
    static YYMemoryCache *cache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [[YYMemoryCache alloc] init];
    });
    return cache;
}

+ (void)set:(id<NSCoding>)cache forKey:(NSString *)key {
    [[BNMemCache memCache] setObject:cache forKey:key];
}

//同步更新
+ (void)update:(id<NSCoding>)cache forKey:(NSString *)key {
    [[BNMemCache memCache] setObject:cache forKey:key];
}

//同步取出
+ (id<NSCoding>)get:(NSString *)key {
    return [[BNMemCache memCache] objectForKey:key];
}

//同步删除
+ (void)del:(NSString *)key {
    [[BNMemCache memCache] removeObjectForKey:key];
}

//同步删除全部
+ (void)delAll {
    [[BNMemCache memCache] removeAllObjects];
}


@end
