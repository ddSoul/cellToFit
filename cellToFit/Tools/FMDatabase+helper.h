//
//  FMDatabase+helper.h
//  cellToFit
//
//  Created by 邓西亮 on 16/9/19.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "FMDatabase.h"
#import "Student.h"

@interface FMDatabase (helper)

//增
- (BOOL)xl_insertData:(NSDictionary *)dictionary withDateBase:(FMDatabase *)db;
//删
- (BOOL)xl_deleteData:(NSDictionary *)dictionary withDateBase:(FMDatabase *)db;
//改
- (BOOL)xl_updataData:(NSDictionary *)dictionary withDateBase:(FMDatabase *)db;
//查
- (instancetype)xl_selectData:(NSDictionary *)dictionary withDateBase:(FMDatabase *)db;

@end
