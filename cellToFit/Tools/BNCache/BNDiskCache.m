//
//  BNCache.m
//  缓存管理
//
//  Created by xiaos on 16/6/17.
//  Copyright © 2016年 com.xsdota. All rights reserved.
//

#import "BNDiskCache.h"
#import "YYCache.h"

#define DirName @"COM.BONC.TEMPCACHE"

@implementation BNDiskCache

+ (YYDiskCache *)diskCache {
    static YYDiskCache *diskCache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        diskCache = [[YYDiskCache alloc] initWithPath:[[BNDiskCache cachesDirectory] stringByAppendingPathComponent:DirName]];
    });
    return diskCache;
}

//同步存入
+ (void)set:(id<NSCoding>)cache forKey:(NSString *)key {
    [[BNDiskCache diskCache] setObject:cache forKey:key];
}

//同步更新
+ (void)update:(id<NSCoding>)cache forKey:(NSString *)key {
    [[BNDiskCache diskCache] setObject:cache forKey:key];
}

//同步取出
+ (id<NSCoding>)get:(NSString *)key {
    return [[BNDiskCache diskCache] objectForKey:key];
}

//同步删除
+ (void)del:(NSString *)key {
    [[BNDiskCache diskCache] removeObjectForKey:key];
}

//同步删除全部
+ (void)delAll {
    [[BNDiskCache diskCache] removeAllObjects];
}

//适用于大文件 大数据的存取操作
//异步存入
+ (void)AsyncSet:(id<NSCoding>)cache
          forKey:(NSString *)key
            then:(void(^)())block{
    YYDiskCache *diskCache = [BNDiskCache diskCache];
    [diskCache setObject:cache forKey:key withBlock:^{
        block();
    }];
}

//异步取出
+ (void)AsyncGet:(NSString *)key
            then:(void(^)(NSString *key, id<NSCoding> object))block{
    YYDiskCache *diskCache = [BNDiskCache diskCache];
    [diskCache objectForKey:key withBlock:^(NSString *key, id<NSCoding> object) {
        block(key,object);
    }];
}

//异步删除
+ (void)AsyncDelete:(NSString *)key then:(void(^)(NSString *))block{
    [[BNDiskCache diskCache] removeObjectForKey:key withBlock:^(NSString *key) {
        block(key);
    }];
}

//异步全部删除
+ (void)AsyncDeleteAll:(void(^)())block{
    [[BNDiskCache diskCache] removeAllObjectsWithBlock:^{
        block();
    }];
}

#pragma mark - 获取cache目录路径
+ (NSString *)cachesDirectory {
    NSString * cachesDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    return cachesDirectory;
}



@end
