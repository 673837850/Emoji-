//
//  EmotionPackages.h
//  MyKeyboardEmoji
//
//  Created by 吕超 on 2017/10/23.
//  Copyright © 2017年 MAXTV. All rights reserved.
//

#import <Foundation/Foundation.h>//表情包

#import "KeyboardEmotion.h"

@interface EmotionPackages : NSObject

/** 当前组对应的文件夹名称  */
@property (nonatomic, strong) NSString *ID;
/** 当前组的名称  */
@property (nonatomic, strong) NSString *group_name_cn;
/** 当前组所有的模型  */
@property (nonatomic, strong) NSMutableArray<KeyboardEmotion *> *emotions;

+ (NSArray *)loadPackages;

// 添加表情到最近
- (void)addFavoriteEmoticon:(KeyboardEmotion *)emoticon;
@end
