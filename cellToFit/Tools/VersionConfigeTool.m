//
//  VersionConfigeTool.m
//  meou
//
//  Created by 邓西亮 on 16/9/8.
//  Copyright © 2016年 北京麦芯科技有限公司. All rights reserved.
//

#import "VersionConfigeTool.h"

@implementation VersionConfigeTool

+ (BOOL)isNeedUploadLocationDatabaseWithDbName:(NSString *)dbNameString
{
    //读取工程中plist文件的数据库版本
    NSDictionary *appDictionary = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"confige.plist" ofType:nil]];
    NSString *newVersion = [appDictionary valueForKey:dbNameString];
    
    //获取本地沙盒路径
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //完整路径
    NSString *documentsPath = [path objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"db.version"];
    
    //获取本地已有数据
    NSDictionary *tempDictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSMutableDictionary *locationDictionary = @{}.mutableCopy;
    locationDictionary = [NSMutableDictionary dictionaryWithDictionary:tempDictionary];
    
    //本地缓存plist判null处理
    NSString *oldVersion = [locationDictionary valueForKey:dbNameString];
    if ([oldVersion isEqual:[NSNull null]]) {
        oldVersion = @"";
    }
    
    //如果本地缓存的plist中有该数据库，进行版本判断，若没有，新建
    if (oldVersion) {
        if (![oldVersion isEqualToString:newVersion]) {
            
            //更新操作，将新的版本号写入缓存的plist
            [locationDictionary setValue:newVersion forKey:dbNameString];
        }else{
            return NO;
        }
    }else{
        
        //没有这个库，需要新建，写入本地缓存的plist
        [locationDictionary setValue:newVersion forKey:dbNameString];
    }
    
    [locationDictionary writeToFile:plistPath atomically:YES];
    return YES;
}


@end
