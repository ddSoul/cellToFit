//
//  BNMemCache.h
//  缓存管理
//
//  Created by xiaos on 16/6/17.
//  Copyright © 2016年 com.xsdota. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNMemCache : NSObject
+ (void)set:(id<NSCoding>)cache forKey:(NSString *)key;

+ (void)update:(id<NSCoding>)cache forKey:(NSString *)key;

+ (id<NSCoding>)get:(NSString *)key;

+ (void)del:(NSString *)key;

+ (void)delAll;
@end
