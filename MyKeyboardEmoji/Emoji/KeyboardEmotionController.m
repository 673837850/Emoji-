//
//  KeyboardEmotionController.m
//  MyKeyboardEmoji
//
//  Created by 吕超 on 2017/10/23.
//  Copyright © 2017年 MAXTV. All rights reserved.
//

#import "KeyboardEmotionController.h"

@interface KeyboardEmotionController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic ,copy) emotionDidSelectedCallBack emotionCallBack;

@property (nonatomic ,strong) UICollectionView * collectionView;
@property (nonatomic ,strong) UIToolbar * toolBar;


@end

@implementation KeyboardEmotionController

#pragma mark -懒加载
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal; //水平的移动
        CGFloat Swidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat cellWidth = Swidth/7; //显示7个
        layout.itemSize = CGSizeMake(cellWidth, cellWidth); //正方形
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.pagingEnabled = YES;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    }
    return _collectionView;
}
#pragma mark - 自定义的初始化方法
-(instancetype)initWithEmotionDidSelectCallBack:(emotionDidSelectedCallBack)callBack{
    self = [super init];
    if (self) {
        _emotionCallBack = callBack;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)addSubviews{
    [self.view addSubview:self.collectionView];
}


@end
