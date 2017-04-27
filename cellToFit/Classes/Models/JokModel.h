//
//  JokModel.h
//  Anxinlicai
//
//  Created by 邓西亮 on 16/8/10.
//  Copyright © 2016年 邓西亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JokModel,Contentlist;
@interface JokModel : NSObject

@property (nonatomic, strong) NSArray<Contentlist *> *contentlist;

@property (nonatomic, assign) NSInteger maxResult;

/**
 * 当前页
 */
@property (nonatomic, assign) NSInteger currentPage;

/**
 * 总数
 */
@property (nonatomic, assign) NSInteger allNum;

/**
 * 总页数
 */
@property (nonatomic, assign) NSInteger allPages;


@end

@interface Contentlist : NSObject

@property (nonatomic, copy) NSString *ct;

/**
 * 标题
 */
@property (nonatomic, copy) NSString *title;

/**
 * 类型
 */
@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *id;

@end

