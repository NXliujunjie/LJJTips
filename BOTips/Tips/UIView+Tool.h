//
//  UIView+Tool.h
//  BuouHost
//
//  Created by 刘俊杰 on 2019/8/1.
//  Copyright © 2019 刘俊杰. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Tool)

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGPoint origin;

@property (assign, nonatomic) CGFloat    top;
@property (assign, nonatomic) CGFloat    bottom;
@property (assign, nonatomic) CGFloat    left;
@property (assign, nonatomic) CGFloat    right;

/**
 渐变色
 colorArray : @[(id)[RGB(255, 185, 157) CGColor],(id)[RGB(255, 131, 100) CGColor]]
 rect 控件的Frame
*/
-(void)gradientColorArray:(NSArray *)colorArray andFrame:(CGRect)rect andCornerRadius:(CGFloat)radius;

/*
 上下抖动效果
 */
- (void)shakeAnimaion;
@end

NS_ASSUME_NONNULL_END
