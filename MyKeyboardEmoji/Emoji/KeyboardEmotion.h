//
//  KeyboardEmotion.h
//  MyKeyboardEmoji
//
//  Created by 吕超 on 2017/10/13.
//  Copyright © 2017年 MAXTV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyboardEmotion : NSObject

/** 当前表情对应的文字  */
@property (nonatomic, strong) NSString *chs;
/** 当前表情对应的图片名称  */
@property (nonatomic, strong) NSString *png;
/** Emoji表情对应的十六进制字符串  */
@property (nonatomic, strong) NSString *code;

/** 是否是删除按钮  */
@property (nonatomic, assign, getter=isRemoveButtonFlag) BOOL removeButtonFlag;
/** 图片全路径  */
@property (nonatomic, strong) NSString *imagePath;
/** Emoji表情字符串  */
@property (nonatomic, strong) NSString *codeStr;


@end
