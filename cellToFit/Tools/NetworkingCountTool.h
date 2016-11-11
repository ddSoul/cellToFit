//
//  NetworkingCountTool.h
//  cellToFit
//
//  Created by 邓西亮 on 16/9/12.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkingCountTool : NSObject

+(int)get3GFlowIOBytes;
+(long)getWifiInterfaceBytes;

@end
