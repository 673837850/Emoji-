//
//  ViewController.m
//  MyKeyboardEmoji
//
//  Created by 吕超 on 2017/10/13.
//  Copyright © 2017年 MAXTV. All rights reserved.
//

#import "ViewController.h"
#import "EmojiTextview.h"
#import "Header.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomHeight;
@property (nonatomic ,weak) EmojiTextview * myTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //对键盘高度进行监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    
    EmojiTextview * textview = [[EmojiTextview alloc] init];
    textview.backgroundColor = [UIColor greenColor];
    [self.view addSubview:textview];
    [textview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 200));
        make.top.equalTo(self.view).with.offset(50);
        make.centerX.equalTo(self.view);
    }];
    _myTextView = textview;
    
    
    
}
-(void)keyboardWillChangeFrame:(NSNotification *)noti{
     NSDictionary *userInfo = noti.userInfo;
    // 动画的持续时间
    double duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    // 键盘的frame
    CGRect keyboardFBegin = [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue]; //键盘动作的开始
     CGRect keyboardFEnd = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];//键盘做出相应动作的结束
    __weak typeof(self) weakSelf = self;
    
    if (keyboardFBegin.origin.y>keyboardFEnd.origin.y) {//如果键盘动作开始的时候的位置y值大于动作结束的时候的y值，那么就是键盘从底部弹出 反之即为收回
        [UIView animateWithDuration:duration animations:^{
            
        } completion:^(BOOL finished) {
            
            weakSelf.bottomHeight.constant = -keyboardFEnd.size.height;
        }];
        
    }else{
        [UIView animateWithDuration:duration animations:^{
            
        } completion:^(BOOL finished) {
            
            weakSelf.bottomHeight.constant = 0;
        }];
        
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_myTextView resignFirstResponder];
}

@end
