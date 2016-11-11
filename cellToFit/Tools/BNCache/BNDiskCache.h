
//  BNCache.h
//  缓存管理
//
//  Created by xiaos on 16/6/17.
//  Copyright © 2016年 com.xsdota. All rights reserved.
//

#import <Foundation/Foundation.h>


@class YYCache,YYDiskCache;
@interface BNDiskCache : NSObject

//同步操作
//存
+ (void)set:(id<NSCoding>)cache forKey:(NSString *)key;
//更新
+ (void)update:(id<NSCoding>)cache forKey:(NSString *)key;
//取
+ (id<NSCoding>)get:(NSString *)key;
//删除
+ (void)del:(NSString *)key;
//全删
+ (void)delAll;

//异步操作
+ (void)AsyncSet:(id<NSCoding>)cache
          forKey:(NSString *)key
            then:(void(^)())block;

+ (void)AsyncGet:(NSString *)key
            then:(void(^)(NSString *key, id<NSCoding> object))block;

+ (void)AsyncDelete:(NSString *)key then:(void(^)(NSString *))block;

+ (void)AsyncDeleteAll:(void(^)())block;

@end
