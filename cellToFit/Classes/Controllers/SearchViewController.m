//
//  SearchViewController.m
//  cellToFit
//
//  Created by 邓西亮 on 16/8/18.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "SearchViewController.h"
#import "XLDBManageer.h"
#import "UserInfodbManager.h"
#import "GetImageData.h"
#import "NSCache+XYCacheHelper.h"
#import "BNCache.h"
#import "BNMemCache.h"
#import "BNDiskCache.h"
#import "XLCache.h"
#import "UIImageView+XLCache.h"
#import "UIImageView+WebCache.h"
#import "Student.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define view_scal (ScreenWidth/1242)

@interface SearchViewController ()<UISearchBarDelegate>
{
    UIImageView *imageView_leftBottom;
}
@property (nonatomic, strong)NSDictionary *dic;
@property (nonatomic, strong)NSData *imageData;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = NO;
    self.view.backgroundColor = [UIColor whiteColor];

//    [self createSearchView];
//    self.dic = [UserInfodbManager getUserNamewithId:@"xl_10"];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithData:self.dic[@"imageData"]]];
//    NSLog(@"_______%ld",(long)[UserInfodbManager getformData]);
    
    
    
    UIImageView *imageView_left = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth/2, ScreenHeight/2)];
    UIImageView *imageView_right = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth/2, 0, ScreenWidth/2, ScreenHeight/2)];
//    imageView_left.backgroundColor = [UIColor redColor];
    imageView_right.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:imageView_left];
    [self.view addSubview:imageView_right];
    imageView_leftBottom = [[UIImageView alloc] initWithFrame:CGRectMake(0, ScreenHeight/2, ScreenWidth/2, ScreenHeight/2)];
    UIImageView *imageView_rightBottom = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth/2, ScreenHeight/2, ScreenWidth/2, ScreenHeight/2)];
    imageView_leftBottom.backgroundColor = [UIColor brownColor];
    imageView_rightBottom.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:imageView_leftBottom];
    [self.view addSubview:imageView_rightBottom];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    imageView_leftBottom.userInteractionEnabled = YES;
    [imageView_leftBottom addGestureRecognizer:tap];
    
    
    [imageView_left xl_setImageWithUrl:@"http://oss-upload-test.oss-cn-shanghai.aliyuncs.com/user/2b70878141ed4a81604198a3a369894a.jpg" placeholderImage:[UIImage imageNamed:@"chat"]];
    
    
    
//    [imageView_right sd_setImageWithURL:[NSURL URLWithString:@"http://oss-upload-test.oss-cn-shanghai.aliyuncs.com/user/2b70878141ed4a81604198a3a369894a.jpg"] placeholderImage:[UIImage imageNamed:@"me"]];
    
    

//    [[GetImageData shareManager] getbelowViewController:self ofType:0 ImageData:^(NSData *data){
//    
//        UIImage *image = [UIImage imageWithData:data];
//        imageView_right.image = image;
//        [[SDWebImageManager sharedManager].imageCache storeImage:image forKey:@"one"toDisk:YES];
//    
//        
//    }];
    
    
 

    
//    //下载图片
//
//    if ([[NSCache shareManager] objectForKey:@"httpimage"]) {
//        imageView_left.image = [[NSCache shareManager] objectForKey:@"httpimage"];
//        return;
//    }else{
//        
//        NSURL *url=[NSURL URLWithString:@"http://oss-upload-test.oss-cn-shanghai.aliyuncs.com/user/2b70878141ed4a81604198a3a369894a.jpg"];
//        
//        UIImage *img = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:url]];
//        imageView_right.image = img;
//        
//        UIImage *cacheImage;
//        if (img) {
//            [[NSCache shareManager] setObject:img forKey:@"httpimage"];
//        }
//        cacheImage = [[NSCache shareManager] objectForKey:@"httpimage"];
//        while (cacheImage) {
//            imageView_left.image = cacheImage;
//            return;
//        }
//    }
//
//    [[GetImageData shareManager] getbelowViewController:self ofType:0 ImageData:^(NSData *data){
    
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            
//            
//            self.imageData = data;
//            while (self.imageData) {
//                imageView_left.image = [UIImage imageWithData:self.imageData];
//                return;
//            }
//        });
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            [[NSCache shareManager] setObject:data forKey:@"test"];
//            while ([[NSCache shareManager] objectForKey:@"test"]) {
//                imageView_right.image = [UIImage imageWithData:[[NSCache shareManager] objectForKey:@"test"]];
//                return;
//            }
//
//            
//        });
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
////
////               [BNMemCache set:data forKey:@"cacheimg"];
////
////            while ([BNMemCache get:@"cacheimg"]) {
////                imageView_leftBottom.image = [UIImage imageWithData:[BNMemCache get:@"cacheimg"]];
////                return;
////            }
//////
////            
////        });
////        
////        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//
//            [[XLCache shareXLCache] saveObjectCache:data forKey:@"bogImg" ofCacheType:CacheRefresh];
//            NSData *imageData = [[XLCache shareXLCache] getObjectCacheforKey:@"bogImg"];
//        
//            imageView_rightBottom.image = [UIImage imageWithData:imageData];
////            while (imageData) {
////                imageView_rightBottom.image = [UIImage imageWithData:imageData];
////            }
//            
//        });
//        
//    }];
//    

    

    
    
}


- (void)tap
{
    UIImage *image = [[SDWebImageManager sharedManager].imageCache imageFromMemoryCacheForKey:@"one"];
    imageView_leftBottom.image = image;
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:@"http://oss-upload-test.oss-cn-shanghai.aliyuncs.com/user/2b70878141ed4a81604198a3a369894a.jpg"]
                                                          options:SDWebImageDownloaderHighPriority
                                                         progress:^(NSInteger alreadyReceiveSize,NSInteger expectedContentLength){
                                                             
                                                             NSLog(@"精度");
                                                         }
                                                        completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished){
                                                            
                                                            imageView_leftBottom.image = image;
                                                            [[SDImageCache sharedImageCache] removeImageForKey:@"one"];
                                                            [[SDWebImageManager sharedManager].imageCache storeImage:image forKey:@"http://oss-upload-test.oss-cn-shanghai.aliyuncs.com/user/2b70878141ed4a81604198a3a369894a.jpg" toDisk:YES];

                                                        }];
   
}

- (void)createSearchView
{
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40)];
    searchBar.placeholder = @"搜索";
    searchBar.backgroundImage = [UIImage imageNamed:@"searchBar_BG"];
    searchBar.delegate = self;
    [self.view addSubview:searchBar];;

}

#pragma mark - UISearchBarDelegate
#pragma mark 搜索文字改变
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
}
#pragma mark 搜索开始编辑
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [UIView animateWithDuration:0.1f animations:^{
         searchBar.frame = CGRectMake(0, 22, self.view.frame.size.width, 40);
        [self.navigationController.view addSubview: searchBar];
    }];
    //设置取消按钮样式
    //首先取出cancelBtn
    UIButton *cancelBtn = [searchBar valueForKey:@"cancelButton"];
    //取消按钮文字
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    //取消按钮文字颜色
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
}

#pragma mark  编辑
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    //展示取消按钮
    searchBar.showsCancelButton = YES;
    return YES;
}
#pragma mark  编辑
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    return YES;
}
#pragma mark 取消按钮点击
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.frame = CGRectMake(0, 64, self.view.frame.size.width, 40);
    [self.view addSubview:searchBar];
    searchBar.text = @"";
    //收起键盘
    [searchBar resignFirstResponder];
    //隐藏取消按钮
    [searchBar setShowsCancelButton:NO animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    
}

@end
