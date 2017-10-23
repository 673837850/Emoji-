//
//  EmotionPackages.m
//  MyKeyboardEmoji
//
//  Created by 吕超 on 2017/10/23.
//  Copyright © 2017年 MAXTV. All rights reserved.
//

#import "EmotionPackages.h"

@implementation EmotionPackages


- (instancetype)initWithId:(NSString *)ID
{
    if (self = [super init]) {
        _ID = ID;
    }
    return self;
}
+(NSArray *)loadPackages{
    //做空的表情包，做最近表情用
    NSMutableArray<EmotionPackages *> * emotionsArr = [[NSMutableArray alloc] init];
    EmotionPackages * emptyPackage = [[EmotionPackages alloc] initWithId:@"nullIDPackages"];
    //添加空的,开始默认为无表情
    [emptyPackage appendEmptyEmoticons];
    [emotionsArr addObject:emptyPackage];
    
    // 获取路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"emoticons.plist" ofType:nil inDirectory:@"Emoticons.bundle"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *packages = dict[@"packages"];
    // 遍历
    for (NSDictionary *packageDict in packages) {
        // 创建组模型
        EmotionPackages *emoticonPackage = [[EmotionPackages alloc] initWithId:packageDict[@"id"]];
        // 加载当前组的所有模型
        [emoticonPackage loadEmoticons];
        // 追加空白按钮
        [emoticonPackage appendEmptyEmoticons];
        // 将当前组添加到数组中
        [emotionsArr addObject:emoticonPackage];
    }

    return emotionsArr;
    
}
- (void)loadEmoticons
{
    // 根据id接接路径
    NSString *path = [[NSBundle mainBundle] pathForResource:self.ID ofType:nil inDirectory:@"Emoticons.bundle"];
    // 拼接info.plist路径
    NSString *filePath = [path stringByAppendingPathComponent:@"info.plist"];
    
    // 加载plist
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    // 取出当前组名
    self.group_name_cn = dict[@"group_name_cn"];
    
    // 取出当前组中的所有的表情"字典数组"
    NSArray *emoticons = dict[@"emoticons"];
    
    // 创建一个用来存放表情模型的数组
    NSMutableArray<KeyboardEmotion *> *models = [NSMutableArray array];
    
    NSInteger index = 0;
    // 遍历字典转模型
    for (NSDictionary *emoticonDict in emoticons) {
        
        if (index == 20) {
            index = 0;
            // 添加删除
            [models addObject:[[KeyboardEmotion alloc] initWithId:self.ID removeBtnFlag:YES]];
        }
        
        // 创建组模型
        KeyboardEmotion *emoticon = [[KeyboardEmotion alloc] initWithId:self.ID];
        // 加载
        emoticon.chs = emoticonDict[@"chs"];
        emoticon.png = emoticonDict[@"png"];
        emoticon.code = emoticonDict[@"code"];
        [models addObject:emoticon];
        
        index ++;
    }
    
    //将加载的表情赋值给当前组模型
    self.emotions = models;
}
// 追加空白表情,并最后添加删除按钮图片
- (void)appendEmptyEmoticons
{
    if (self.emotions == nil) {
        self.emotions = [NSMutableArray array];
        [self.emotions addObject:[[KeyboardEmotion alloc] initWithId:@""]];
    }
    
    NSInteger count = self.emotions.count % 21;
    while (count < 20 && count != 0) {
        [self.emotions addObject:[[KeyboardEmotion alloc] initWithId:self.ID]];
        count ++;
    }
    // 到第二十个,添加删除
    KeyboardEmotion *cancelEmoticon = [[KeyboardEmotion alloc] initWithId:self.ID removeBtnFlag:YES];
    [self.emotions addObject:cancelEmoticon];
}
@end
