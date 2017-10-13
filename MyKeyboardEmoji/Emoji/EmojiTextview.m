//
//  EmojiTextview.m
//  MyKeyboardEmoji
//
//  Created by 吕超 on 2017/10/13.
//  Copyright © 2017年 MAXTV. All rights reserved.
//

#import "EmojiTextview.h"
#import "KeyboardAttachment.h"

@implementation EmojiTextview

-(void)insertEmojition:(KeyboardEmotion *)emotion{
    //插入emoji表情
    if (emotion.code) {//判断是否是emoji
        UITextRange * range = self.selectedTextRange;// 获取当前选中的获取,默认光标也是有个选中范围
        [self replaceRange:range withText:emotion.codeStr];
    }else if (emotion.png !=nil){
        //根据当前的textview 上面的属性字符串生成一个可变的属性字符串
        
        NSMutableAttributedString * currentAttriText = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
        // 2、创建表情字符串
        KeyboardAttachment *attachment = [[KeyboardAttachment alloc] init];
        attachment.image = [UIImage imageWithContentsOfFile:emotion.imagePath];
        attachment.imageTitle = emotion.chs;
        // 获取文字高度
        CGFloat height = self.font.lineHeight;//文本每行高度
        attachment.bounds = CGRectMake(0,-4,height,height);
        // 根据附件创建一个属性字符串
        NSAttributedString *emoticonStr = [NSAttributedString attributedStringWithAttachment:attachment];
        NSRange range = [self selectedRange];
        [currentAttriText replaceCharactersInRange:NSMakeRange(range.location,range.length) withAttributedString:emoticonStr];
        //将文字和emoji加进来以后，设置原来的位置是原来的大小，否则后面加入的文字或表情会有差异
        [currentAttriText addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(range.location, range.length)];
        self.attributedText = currentAttriText;
        
        //重置光标的位置
        self.selectedRange = NSMakeRange(range.location+1, 0);
        if (emotion.removeButtonFlag) {
            [self deleteBackward];//删除按钮的点击
        }
    }
    
}

-(NSString *)getContentStr{
    
    
    
    return nil;
    
}

@end
