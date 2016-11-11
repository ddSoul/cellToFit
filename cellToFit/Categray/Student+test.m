//
//  Student+test.m
//  cellToFit
//
//  Created by 邓西亮 on 16/9/6.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "Student+test.h"
#import <objc/runtime.h>

static const char ksex;

@implementation Student (test)

-(NSString *)sex{
    return objc_getAssociatedObject(self, &ksex);
}
-(void)setSex:(NSString *)sex{
    objc_setAssociatedObject(self, &ksex,sex, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
