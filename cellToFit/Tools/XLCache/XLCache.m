//
//  XLCache.m
//  Anxinlicai
//
//  Created by 邓西亮 on 16/9/5.
//  Copyright © 2016年 邓西亮. All rights reserved.
//

#import "XLCache.h"
#import "XLDiskCache.h"
#import "XLMemoryCache.h"
#import "LDSDownloaderOperation.h"
#import "LDSImageDownloader.h"

@interface XLCache ()

@property (nonatomic, strong) XLDiskCache *diskCache;
@property (nonatomic, strong) XLMemoryCache *memoryCache;

@end

@implementation XLCache

+ (XLCache *)shareXLCache
{
    static XLCache *maganer = nil;
    
    static dispatch_once_t oncet;
    
    dispatch_once(&oncet, ^{
        
        maganer = [[[self class] alloc] init];
        
    });
    
    return maganer;
}


- (id)init
{
    return [self initWithCache];
}


- (instancetype)initWithCache
{
    self = [super init];
    if (self) {
        _memoryCache = [[XLMemoryCache alloc] init];
        _diskCache = [[XLDiskCache alloc] init];
    }
    return self;
}


- (void)saveObjectCache:(id)obj forKey:(NSString *)keyString ofCacheType:(options)option
{
    switch (option) {
        case CacheOptionDefult:
        {
            
        }
            break;
        case CacheRefresh:
        {
            _memoryCache.maxCacheSize = 10;
            [_memoryCache setMemoryCacheObject:obj forKey:keyString];
            [_diskCache setDiskCacheObject:obj forKey:keyString];
        }
            break;
            
        default:
            break;
    }
}

- (void)xl_setImageWithUrl:(NSString *)urlString progress:(ProgressBlock)progress completed:(CompletedBlock)completed
{
    NSURL *url;
    if ([urlString isKindOfClass:NSString.class]) {
        url = [NSURL URLWithString:urlString];
    }
    if (![url isKindOfClass:NSURL.class]) {
        url = nil;
    }
    
    NSData *_imageData = [self getObjectCacheforKey:urlString];
    if (_imageData) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            
            completed(_imageData);
            //读取缓存成功
        });

    }else{
        //下载
        [[LYImageDownloader shareDownloader] downloaderImageWithDownloaderWithURL:url
                                                                       DownloaderProgressBlock:^(NSInteger alreadyReceiveSize,NSInteger expectedContentLength){
                                                                           dispatch_async(dispatch_get_main_queue(), ^{
                                                                               //进度
                                                                               progress(alreadyReceiveSize,expectedContentLength);
                                                                           });
                                                                       }
                                                                      DownloaderCompletedBlock:^(NSData *data,UIImage *image,NSError *error,BOOL finished){
                                                                          dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                                                                              [self saveObjectCache:data forKey:urlString ofCacheType:CacheRefresh];
                                                                          });
         
                                                                          dispatch_async(dispatch_get_main_queue(), ^{
                                                                              
                                                                              completed(data);
         
                                                                          });
                                                                      }];
    }
    
//        }else{
//            NSLog(@"进入下载");
//
//        }
//    }];


}

- (id)getObjectCacheforKey:(NSString *)keyString
{
    
    NSData *_memoryData = [_memoryCache getMemoryCacheObjetForKey:keyString];
    NSData *_diskData = [_diskCache getDiskCacheObjetForKey:keyString];
    if (_memoryData) {
        return _memoryData;
    }else if (_diskData){
        return _diskData;
    }
    return nil;
    
}

@end
