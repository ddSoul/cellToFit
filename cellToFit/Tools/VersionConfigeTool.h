//
//  VersionConfigeTool.h
//  meou
//
//  Created by 邓西亮 on 16/9/8.
//  Copyright © 2016年 北京麦芯科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VersionConfigeTool : NSObject


/**
 *  是否需要更新本地的数据库
 *
 *  @param dbNameString 数据库名字
 *
 *  @return YES or NO
 */
+ (BOOL)isNeedUploadLocationDatabaseWithDbName:(NSString *)dbNameString;

@end
