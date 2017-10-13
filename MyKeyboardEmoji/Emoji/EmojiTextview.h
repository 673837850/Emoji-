//
//  EmojiTextview.h
//  MyKeyboardEmoji
//
//  Created by 吕超 on 2017/10/13.
//  Copyright © 2017年 MAXTV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyboardEmotion.h"



@interface EmojiTextview : UITextView

/**
 *  插入表情
 *
 */
-(void)insertEmojition:(KeyboardEmotion *)emotion;


/**
 *  获取文本内容
 *
 *  @return 内容
 */
- (NSString *)getContentStr;
@end
