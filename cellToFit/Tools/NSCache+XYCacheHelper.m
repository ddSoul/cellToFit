//
//  NSCache+XYCacheHelper.m
//  cellToFit
//
//  Created by 邓西亮 on 16/9/2.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "NSCache+XYCacheHelper.h"

@implementation NSCache (XYCacheHelper)

+(NSCache *)shareManager{
    
    static NSCache* manager = nil;
    
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        
        manager = [[[self class] alloc] init];
    });
    
    return manager;
    
}


@end
