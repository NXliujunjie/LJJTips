//
//  BOPageTitleView.h
//  BuouHost
//
//  Created by 刘俊杰 on 2019/9/6.
//  Copyright © 2019 刘俊杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Tool.h"

NS_ASSUME_NONNULL_BEGIN


typedef void(^PageTitleIndex)(NSInteger index);

@interface BOPageTitleView : UIView

@property (nonatomic, strong) NSMutableArray<UIButton *> *titleButtonArray;
@property (nonatomic, strong) UIScrollView *titleScrollView;
@property (nonatomic, strong) UIView *selectTipView;//底部选中的View

/*
 选中第几个标签
 默认 从 0开始
 */
@property (nonatomic, copy) PageTitleIndex pageTitleIndex;

/**
 标签
 */
@property (nonatomic, copy) NSArray<NSString *> *pageTitle;//导航标题数组
@property (nonatomic, assign) CGFloat tTop;//标题距离顶部高度 默认12
@property (nonatomic, assign) int tWidth;//标题宽度 传一屏幕几个 3个就传3 默认3
@property (nonatomic, assign) CGFloat tHight;//标题高度 默认 22
@property (nonatomic, assign) CGFloat tFont;//标题文字打下 默认 16
@property (nonatomic, strong) UIColor *tColorNormal;//标题文字 未选中 颜色 默认 153
@property (nonatomic, strong) UIColor *tColorSelect;//标题文字 选中 颜色 默认 51
@property (nonatomic, strong) UIColor *bColorNormal;//标题按钮背景色 未选中 默认白色
@property (nonatomic, strong) UIColor *bColorSelect;//标题按钮背景色 选中 默认白色

/**
 标签底部横线
 */
@property (nonatomic, strong) UIColor *tipViewColor;//标题按钮底部选中标签颜色 默认 255 131 100 1
@property (nonatomic, assign) CGFloat tipVieTop;//标题按钮距离顶部高度 32
@property (nonatomic, assign) CGFloat tipVieWidth;//标题按钮底部选中标签宽度 109
@property (nonatomic, assign) CGFloat tipViewHeight;//标题按钮底部选中标签高度 4
@property (nonatomic, assign) int index;//默认选中第几个 默认第一个 0

/**
 构建UI
 */
- (void)builder;

/**
 切换标签
 */
- (void)changeIndex:(NSInteger)index;

/**
标签动画状态
 */
- (void)buttonAnimal:(NSInteger )index;

/**
 底部标签动画状态
 */
- (void)bottomAnimal:(CGFloat )index;

/**
 按钮切回原状态
 */
- (void)buttonState;
@end

NS_ASSUME_NONNULL_END
