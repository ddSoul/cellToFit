//
//  XLMemoryCache.h
//  Anxinlicai
//
//  Created by 邓西亮 on 16/9/5.
//  Copyright © 2016年 邓西亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XLMemoryCache : NSObject

@property (assign, nonatomic) NSUInteger maxCacheSize;

- (void)setMemoryCacheObject:(id)obj forKey:(NSString *)keyString;

- (id)getMemoryCacheObjetForKey:(NSString *)keyString;

@end
