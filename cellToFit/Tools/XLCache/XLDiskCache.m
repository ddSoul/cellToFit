//
//  XLDiskCache.m
//  Anxinlicai
//
//  Created by 邓西亮 on 16/9/5.
//  Copyright © 2016年 邓西亮. All rights reserved.
//

#import "XLDiskCache.h"
#import <CommonCrypto/CommonDigest.h>

@interface XLDiskCache ()

@property(strong,nonatomic) NSFileManager *fileMange;
@property(strong,nonatomic) NSString *diskCachePath;
@property(strong,nonatomic) dispatch_queue_t ioSerialQueue;

@end

@implementation XLDiskCache


- (id)init
{
    return [self initWithCacheSpace:@"default"];
}


- (instancetype)initWithCacheSpace:(NSString *)path
{
    self = [super init];
    if (self) {
        
        /**
         *  文件路径
         */
        NSString *fullPath = [@"com.XLCache." stringByAppendingString:path];
        
        //创建IO串行队列
        _ioSerialQueue = dispatch_queue_create("com.message.Queue", DISPATCH_QUEUE_SERIAL);
        
        //获取Cache目录路径,初始化磁盘缓存路径
        NSArray *cacPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        _diskCachePath = [[cacPath objectAtIndex:0] stringByAppendingPathComponent:fullPath];
        
        //初始化fileMange
        dispatch_sync(self.ioSerialQueue, ^{
            _fileMange = [NSFileManager defaultManager];
        });
    }
    return self;
}


- (void)setDiskCacheObject:(id)obj forKey:(NSString *)KeyString
{
    dispatch_sync(self.ioSerialQueue, ^{
        if (![_fileMange fileExistsAtPath:_diskCachePath]) {
            [_fileMange createDirectoryAtPath:_diskCachePath withIntermediateDirectories:YES attributes:nil error:nil];
        }
        NSString *pathForKey = [self defaultCachePathForKey:KeyString];
        
        [_fileMange createFileAtPath:pathForKey contents:obj attributes:nil];
    });
}

- (id)getDiskCacheObjetForKey:(NSString *)keyString
{
    NSString *pathForKey = [self defaultCachePathForKey:keyString];

    NSData *_diskData = [NSData dataWithContentsOfFile:pathForKey];
    return _diskData;

}

#pragma mark pathMethed

- (NSString *)cachePathForKey:(NSString *)key inPath:(NSString *)path {
    NSString *filename = [self cachedFileNameForKey:key];
    return [path stringByAppendingPathComponent:filename];
}

- (NSString *)defaultCachePathForKey:(NSString *)key {
    return [self cachePathForKey:key inPath:self.diskCachePath];
}

- (NSString *)cachedFileNameForKey:(NSString *)key {
    const char *str = [key UTF8String];
    if (str == NULL) {
        str = "";
    }
    unsigned char r[16];
    CC_MD5(str, (uint32_t)strlen(str), r);
    NSString *filename = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                          r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8], r[9], r[10], r[11], r[12], r[13], r[14], r[15]];
    
    return filename;
}


@end
