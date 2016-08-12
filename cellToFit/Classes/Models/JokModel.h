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

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, assign) NSInteger allNum;

@property (nonatomic, assign) NSInteger allPages;


@end

@interface Contentlist : NSObject

@property (nonatomic, copy) NSString *ct;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *id;

@end

