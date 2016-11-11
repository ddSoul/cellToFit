//
//  GetImageData.h
//  FoodHoop
//
//  Created by 邓西亮 on 16/3/31.
//  Copyright © 2016年 邓西亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^imageDataBlock)(NSData *imageData);
typedef void(^imageBlock)(UIImage *image);

@interface GetImageData : NSObject<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIAlertViewDelegate>

@property (nonatomic, strong) imageDataBlock imageDataBlock;
@property (nonatomic, strong) imageBlock imageBlock;

+(GetImageData *)shareManager;
#pragma   type  0默认 1本地照片 2拍照
- (void)getbelowViewController:(UIViewController *)viewcontroller ofType:(NSInteger)type ImageData:(imageDataBlock )imagedata;

@end
