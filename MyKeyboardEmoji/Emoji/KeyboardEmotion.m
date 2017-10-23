//
//  KeyboardEmotion.m
//  MyKeyboardEmoji
//
//  Created by 吕超 on 2017/10/13.
//  Copyright © 2017年 MAXTV. All rights reserved.
//

#import "KeyboardEmotion.h"

@implementation KeyboardEmotion

- (instancetype)initWithId:(NSString *)Id
{
    self = [super init];
    if (self) {
        _ID = Id;
    }
    return self;
}


// 创建一个是删除按钮
- (instancetype)initWithId:(NSString *)Id removeBtnFlag:(BOOL)removeFlag
{
    if (self = [super init]) {
        _ID = Id;
        if (removeFlag == 0) {
            _removeButtonFlag = NO;
        } else {
            _removeButtonFlag = removeFlag;
        }
    }
    return self;
}
@end

