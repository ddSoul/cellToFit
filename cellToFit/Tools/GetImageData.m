//
//  GetImageData.m
//  FoodHoop
//
//  Created by 邓西亮 on 16/3/31.
//  Copyright © 2016年 邓西亮. All rights reserved.
//

#import "GetImageData.h"

@implementation GetImageData
{
    UIViewController *blong_ViewController;
    NSInteger typeNum;
}

+(GetImageData *)shareManager{
    
    static GetImageData* manager = nil;
    
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        
        manager = [[[self class] alloc] init];
    });
    
    return manager;
    
}

#pragma mark ----上传头像
-(void)changeImage{
    
   
    if (typeNum == 0) {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;

        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"更换图片" message:nil preferredStyle:(UIAlertControllerStyleActionSheet)];
        //    UIAlertControllerStyleActionSheet、、UIAlertControllerStyleAlert
        
        UIAlertAction *photeAction = [UIAlertAction actionWithTitle:@"相册" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
            //相册
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
            {
                imagePickerController.sourceType =  UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            }
            [blong_ViewController presentViewController:imagePickerController animated:YES completion:nil];
        }];
        
        UIAlertAction *takephoteAction = [UIAlertAction actionWithTitle:@"拍照" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
            //拍照
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            }
            else
            {
//                [MyMD5 progress:@"此设备没有该功能"];
                return;
            }
            [blong_ViewController presentViewController:imagePickerController animated:YES completion:nil];
            
        }];
        // 创建按钮
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
            [alertController removeFromParentViewController];
        }];
        
        [alertController addAction:photeAction];
        [alertController addAction:takephoteAction];
        [alertController addAction:cancelAction];
        [blong_ViewController presentViewController:alertController animated:YES completion:nil];
        

    }else if (typeNum == 1){
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;

        //相册
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
        {
            imagePickerController.sourceType =  UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        }
        [blong_ViewController presentViewController:imagePickerController animated:YES completion:nil];

    }else if (typeNum == 2){
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;

        //拍照
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
        else
        {
//            [MyMD5 progress:@"此设备没有该功能"];
            return;
        }
        [blong_ViewController presentViewController:imagePickerController animated:YES completion:nil];
        

    }
    
}

//
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *head = [info objectForKey:UIImagePickerControllerEditedImage];
    //等比压缩图片，保护流量
//        UIImage *image = [PublicMethod imageWithImageSimple:head scaledToSize:CGSizeMake(100, 100)];
    //    imageView.image = head;
    UIImage *smallImage=[self scaleFromImage:head toSize:head.size];
    NSData *old_imageData = UIImageJPEGRepresentation(smallImage, 0.5);
    self.imageDataBlock(old_imageData);
    [picker dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - 压缩
- (UIImage *)scaleFromImage:(UIImage *)image toSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)getbelowViewController:(UIViewController *)viewcontroller ofType:(NSInteger)type ImageData:(imageDataBlock )imagedata
{
    blong_ViewController = viewcontroller;
    self.imageDataBlock = imagedata;
    typeNum = type;
    [self changeImage];
}


@end
