//
//  KeyboardEmotionController.h
//  MyKeyboardEmoji
//
//  Created by 吕超 on 2017/10/23.
//  Copyright © 2017年 MAXTV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyboardEmotion.h"

typedef void (^emotionDidSelectedCallBack)(KeyboardEmotion * emotion);

@interface KeyboardEmotionController : UIViewController

-(instancetype)initWithEmotionDidSelectCallBack:(emotionDidSelectedCallBack )callBack;


@end
