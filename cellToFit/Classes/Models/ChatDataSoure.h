//
//  ChatDataSoure.h
//  cellToFit
//
//  Created by 邓西亮 on 16/8/16.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatDataSoure : NSObject

/**
 * 头像Url
 */
@property (nonatomic, copy) NSString *headerImageUrl;

/**
 * 内容
 */
@property (nonatomic, copy) NSString *content;

/**
 * 用户id
 */
@property (nonatomic, copy) NSString *userID;

/**
 * 昵称
 */
@property (nonatomic, copy) NSString *userNickName;

@end
