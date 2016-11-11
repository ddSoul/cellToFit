//
//  XLDiskCache.h
//  Anxinlicai
//
//  Created by 邓西亮 on 16/9/5.
//  Copyright © 2016年 邓西亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XLDiskCache : NSObject

- (id)init;

- (void)setDiskCacheObject:(id)obj forKey:(NSString *)keyString;

- (id)getDiskCacheObjetForKey:(NSString *)keyString;

@end
