//
//  FootToolViews.m
//  cellToFit
//
//  Created by 邓西亮 on 16/8/16.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "FootToolViews.h"
#import "Masonry.h"
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define view_scal (ScreenWidth/1242)
#define TextViewHeightDefult (34.5)
#define FootViewY (ScreenHeight-400*view_scal)
#define FootViewHeightDefult (200*view_scal)

@interface FootToolViews ()<UITextViewDelegate>

@property (nonatomic, assign) CGFloat keyBoardHeight;
@property (nonatomic, assign) CGFloat textViewChangeHeight;
@end

@implementation FootToolViews


+ (instancetype) configureKeyboard
{
    return [[self alloc] initWithFrame:CGRectMake(0, FootViewY, ScreenWidth, FootViewHeightDefult)];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor grayColor];
        
        self.inputTextView = [[UITextView alloc] init];
        self.inputTextView.delegate = self;
        self.inputTextView.font = [UIFont systemFontOfSize:50*view_scal];
        self.inputTextView.backgroundColor = [UIColor whiteColor];
        self.inputTextView.layer.cornerRadius = 5;
        self.inputTextView.layer.borderColor = [UIColor brownColor].CGColor;
        self.inputTextView.layer.borderWidth = 1;
        [self addSubview:self.inputTextView];
        
        
        UIImageView *hearderImageView = [[UIImageView alloc] init];
        hearderImageView.image = [UIImage imageNamed:@"me"];
        [self addSubview:hearderImageView];
        
        UIButton *sendBtton = [UIButton buttonWithType:UIButtonTypeCustom];
        [sendBtton setBackgroundImage:[UIImage imageNamed:@"chat"] forState:UIControlStateNormal];
        [sendBtton addTarget:self.delegate action:@selector(senderMessage) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:sendBtton];
        
        
        [self.inputTextView mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.mas_equalTo(self).offset(30*view_scal);
            make.left.mas_equalTo(200*view_scal);
            make.height.mas_equalTo(34.5);
            make.right.mas_equalTo(-200*view_scal);
            make.bottom.mas_equalTo(-60*view_scal).priorityHigh();
        }];
        
        [sendBtton mas_makeConstraints:^(MASConstraintMaker *make){
            
            make.height.mas_equalTo(TextViewHeightDefult);
            make.right.mas_equalTo(-30*view_scal);
            make.width.mas_equalTo(150*view_scal);
            make.bottom.mas_equalTo(-60*view_scal);
        }];
        
        [hearderImageView mas_makeConstraints:^(MASConstraintMaker *make){
            
            make.left.mas_equalTo(60*view_scal);
            make.height.width.mas_equalTo(120*view_scal);
            make.bottom.mas_equalTo(-60*view_scal);
        }];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillShow:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
   
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillHide:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
    }
    return self;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    CGSize myTextViewSize = [self.inputTextView sizeThatFits:CGSizeMake(self.inputTextView.frame.size.width, FLT_MAX)];

    if (myTextViewSize.height != TextViewHeightDefult) {
        [self upLayout:myTextViewSize.height];
        [self.delegate inputTextViewHeightChange];
    }
    return YES;
}
- (void)upLayout:(CGFloat)height
{
        [self.inputTextView mas_updateConstraints:^(MASConstraintMaker *make){
            make.left.mas_equalTo(200*view_scal);
            make.height.mas_equalTo(height);
            make.right.mas_equalTo(-200*view_scal);
            make.bottom.mas_equalTo(-60*view_scal);
        }];
    
        self.textViewChangeHeight = height-TextViewHeightDefult;
        self.frame = CGRectMake(0, FootViewY-self.keyBoardHeight-self.textViewChangeHeight, ScreenWidth, FootViewHeightDefult+self.textViewChangeHeight);

}

- (void)keyboardWillShow:(NSNotification *)aNotification
{
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    self.keyBoardHeight = height;
    self.frame = CGRectMake(0, ScreenHeight-height-400*view_scal, ScreenWidth, 200*view_scal);
    //keyboradshow delegate
    [self.delegate keyBoardShow:height];

}

- (void)keyboardWillHide:(NSNotification *)aNotification
{
    [self.delegate keyBoardDismiss];
    self.frame = CGRectMake(0, FootViewY-self.textViewChangeHeight, ScreenWidth, FootViewHeightDefult+self.textViewChangeHeight);
}

@end
