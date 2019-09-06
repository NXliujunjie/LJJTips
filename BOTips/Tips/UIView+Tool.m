//
//  UIView+Tool.m
//  BuouHost
//
//  Created by 刘俊杰 on 2019/8/1.
//  Copyright © 2019 刘俊杰. All rights reserved.
//

#import "UIView+Tool.h"

@implementation UIView (Tool)

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}
- (CGFloat)centerY
{
    return self.center.y;
}

-(CGSize)size
{
    return self.frame.size;
}

-(CGFloat)width
{
    return self.frame.size.width;
}
-(CGFloat)height
{
    return self.frame.size.height;
}
-(CGFloat)x
{
    return self.frame.origin.x;
}
-(CGFloat)y
{
    return self.frame.origin.y;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return self.frame.size.height + self.frame.origin.y;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)right
{
    return self.frame.size.width + self.frame.origin.x;
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

-(void)gradientColorArray:(NSArray *)colorArray andFrame:(CGRect)rect andCornerRadius:(CGFloat)radius{
    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    gradientLayer.frame = rect;
    gradientLayer.cornerRadius = radius;
    gradientLayer.masksToBounds = YES;
    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
    gradientLayer.locations = @[@(0.5),@(1.0)];//渐变点
    [gradientLayer setColors:colorArray];//渐变数组
    [self.layer addSublayer:gradientLayer];
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

- (void)shakeAnimaion  {
    CAKeyframeAnimation * keyAnimaion = [CAKeyframeAnimation animation];
    keyAnimaion.keyPath = @"transform.rotation";
    keyAnimaion.values = @[@(-10 / 180.0 * M_PI),@(10 /180.0 * M_PI),@(-10/ 180.0 * M_PI),@(0 /180.0 * M_PI)];//度数转弧度
    keyAnimaion.removedOnCompletion = NO;
    keyAnimaion.fillMode = kCAFillModeForwards;
    keyAnimaion.duration = 0.3;
    keyAnimaion.repeatCount = 3;//动画次数
    [self.layer addAnimation:keyAnimaion forKey:nil];
}

//- (void)shockAnimaion {
//    CGFloat t =4.0;
//    CGAffineTransform translateRight  =CGAffineTransformTranslate(CGAffineTransformIdentity, t,0.0);
//    CGAffineTransform translateLeft =CGAffineTransformTranslate(CGAffineTransformIdentity,-t,0.0);
//    self.liveButton.transform = translateLeft;
//    [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
//        [UIView setAnimationRepeatCount:2.0];
//        self.liveButton.transform = translateRight;
//    } completion:^(BOOL finished){
//        if(finished){
//            [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
//                self.liveButton.transform =CGAffineTransformIdentity;
//            } completion:NULL];
//        }
//    }];
//}


@end
