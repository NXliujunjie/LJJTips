//
//  BOScrollPageView.h
//  BuouHost
//
//  Created by 刘俊杰 on 2019/9/6.
//  Copyright © 2019 刘俊杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BOPageTitleView.h"
#import "UIView+Tool.h"

NS_ASSUME_NONNULL_BEGIN

@interface BOScrollPageView : UIView

+ (instancetype)scrollPageView:(void (^)(BOScrollPageView *))initBlock;

/**
 控制器数组
 */
@property (nonatomic, strong) NSArray<UIViewController *>  *vcArray;

/**
 标题数组
 */
@property (nonatomic, strong) NSArray<NSString *>  *titleArray;

/**
 控制顶部标签控件的View
 配置标签信息直接修改此标签属性就可以
 */
@property (nonatomic, strong) BOPageTitleView *pageTitleView;

/**
 控制界面 的ScrollView
 */
@property (nonatomic, strong) UIScrollView *scView;

/*
 顶部标签高度
 默认 44
 */
@property (nonatomic, assign) CGFloat pageTitleH;

/*
 底部scView 高度
 默认 全屏 - 导航 - 标签
 */
@property (nonatomic, assign) CGFloat scH;

/**
 构建UI
 调用函数之前 毕传参数为
 pageTitle
 */
- (void)builder;
@end

NS_ASSUME_NONNULL_END
