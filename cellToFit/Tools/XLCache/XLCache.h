//
//  XLCache.h
//  Anxinlicai
//
//  Created by 邓西亮 on 16/9/5.
//  Copyright © 2016年 邓西亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,CacheType){
    /**
     * 默认类型
     */
    CacheTypeDefult,
    /**
     * 磁盘中缓存
     */
    CacheTypeDisk,
    /**
     * 内存中缓存
     */
    CacheTypeMemory
};

typedef NS_ENUM(NSInteger,options){
    /**
     * 默认不需要更新
     */
    CacheOptionDefult,
    /**
     * 数据不更新
     */
    CacheRefresh

};

/**
 *  <#Description#>
 *
 *  @param responseObject <#responseObject description#>
 */
typedef void (^CompletedBlock)(id responseObject);

/**
 *  下载回调信息，下载进度Block
 *
 *  @param AlreadyReceiveSize 已经接收大小
 *  @param NotReceiveSize     未接收大小
 */
typedef void(^ProgressBlock)(NSInteger alreadyReceiveSize,NSInteger expectedContentLength);


@interface XLCache : NSObject

/**
 *  init
 *
 *  @return XLCache Obj
 */
+ (XLCache *)shareXLCache;

/**
 *  缓存方法
 *
 *  @param obj       需要缓存的对象
 *  @param keyString key
 *  @param option    缓存方式
 */
- (void)saveObjectCache:(id)obj forKey:(NSString *)keyString ofCacheType:(options)option;

/**
 *  加载网络图片
 *
 *  @param urlString   链接
 *  @param placeholder 占位图
 */
- (void)xl_setImageWithUrl:(NSString *)urlString progress:(ProgressBlock)progress completed:(CompletedBlock)completed;

/**
 *  获取缓存
 *
 *  @param keyString key
 *
 *  @return 返回数据
 */
- (id)getObjectCacheforKey:(NSString *)keyString;

/**
 *  得到缓存大小
 *
 *  @return size
 */
- (NSInteger)getSizeOfCacheFile;

//清理缓存数据
- (BOOL)clearCacheFile;

@end
