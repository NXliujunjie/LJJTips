//
//  BOPageTitleView.m
//  BuouHost
//
//  Created by 刘俊杰 on 2019/9/6.
//  Copyright © 2019 刘俊杰. All rights reserved.
//

#import "BOPageTitleView.h"

@interface BOPageTitleView(){
    CGFloat titleWidth;
}

@end

@implementation BOPageTitleView

#pragma mark: --设置默认值
- (instancetype)init {
    self = [super init];
    if (self) {
        _titleButtonArray = [[NSMutableArray alloc] init];
        _pageTitle = [[NSMutableArray alloc] init];
        _tWidth = 3;
        titleWidth = [UIScreen mainScreen].bounds.size.width / _tWidth;
        _tipVieWidth = titleWidth;
        _tHight = 22;
        _tTop = 12;
        _tipViewHeight= 4;
        _tColorNormal = [UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1];
        _tColorSelect = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1];
        _bColorNormal = [UIColor whiteColor];
        _bColorSelect = [UIColor whiteColor];
        _tipViewColor = [UIColor colorWithRed:255/255.0f green:131/255.0f blue:100/255.0f alpha:1];
        _index = 0;
        _tipVieTop = 32;
        _tFont = 16;
    }
    return self;
}

#pragma mark: --构建
- (void)builder {
    
    titleWidth = [UIScreen mainScreen].bounds.size.width / _tWidth;
    
    if (self.pageTitle.count<=0) {return;}
    
    [self addSubview:self.titleScrollView];
    self.titleScrollView.contentSize = CGSizeMake(self.pageTitle.count * titleWidth,0);
    
    [self.pageTitle enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:obj forState:UIControlStateNormal];
        [button setTitleColor:self.tColorNormal forState:UIControlStateNormal];
        [button setTitleColor:self.tColorSelect forState:UIControlStateSelected];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.titleLabel.font = [UIFont systemFontOfSize:self.tFont];
        button.titleLabel.adjustsFontSizeToFitWidth = YES;
        [button addTarget:self action:@selector(selectorSender:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(self->titleWidth *idx, self.tTop, self->titleWidth, self.tHight);
        button.tag = idx;
        button.selected = NO;
        button.backgroundColor = self.bColorNormal;
        [self.titleScrollView addSubview:button];
        [self.titleButtonArray addObject:button];
        
        //默认选中
        if (idx == self.index) {
            [button sendActionsForControlEvents:(UIControlEventTouchUpInside)];
        }
    }];
}

#pragma mark: --切换标签
- (void)changeIndex:(NSInteger)index {
    UIButton *btn = self.titleButtonArray[index];
    [btn sendActionsForControlEvents:(UIControlEventTouchUpInside)];
}

#pragma mark: --标签动画
- (void)buttonAnimal:(NSInteger )index {
    UIButton * btn = self.titleButtonArray[index];
    btn.titleLabel.font = [UIFont systemFontOfSize:self.tFont + 2];
}

#pragma mark: --按钮切回原状态
- (void)buttonState {
    [self.titleButtonArray enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setTitleColor:self.tColorNormal forState:UIControlStateNormal];
        [obj setTitleColor:self.tColorSelect forState:UIControlStateSelected];
        obj.titleLabel.font = [UIFont systemFontOfSize:self.tFont];
    }];
}

 #pragma mark: 底部标签动画状态
- (void)bottomAnimal:(CGFloat )index {
    self.selectTipView.x =  titleWidth * index;
    [self.titleScrollView bringSubviewToFront:self.selectTipView];
}

#pragma mark: --按钮选择
- (void)selectorSender:(UIButton *)sender {
    
    [self buttonState];
    
    if (!sender.selected) {
        
        !self.pageTitleIndex ?: self.pageTitleIndex(sender.tag);
        
        [self.titleButtonArray enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.selected = NO;
            obj.backgroundColor = self.bColorNormal;
        }];
        
        [UIView animateWithDuration:0.1 animations:^{
            self.selectTipView.frame = CGRectMake(sender.tag * self.tipVieWidth, self.tipVieTop, self.tipVieWidth, self.tipViewHeight);
            self.selectTipView.centerX = sender.centerX;
            [self.titleScrollView bringSubviewToFront:self.selectTipView];
        }];
        
        sender.selected = !sender.selected;
        if (sender.tag >= 2 && sender.tag <= self.titleButtonArray.count - (_tWidth - 1)) {
            if (sender.tag == _titleButtonArray.count - 1 ) {
                [self.titleScrollView setContentOffset:CGPointMake(titleWidth*_titleButtonArray.count - self.bounds.size.width , 0) animated:YES];
            }
            else{
                CGFloat widths = (sender.tag-1) * titleWidth;
                if (widths >= self.titleScrollView.contentSize.width) {
                    widths = self.titleScrollView.contentSize.width;
                }
                [self.titleScrollView setContentOffset:CGPointMake(widths, 0) animated:YES];
            }
        }else if(sender.tag > self.titleButtonArray.count - (_tWidth - 1)) {}
        else
        {
            [self.titleScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        }
    }
}

#pragma mark: --懒加载
-(UIScrollView *)titleScrollView {
    if (!_titleScrollView) {
        _titleScrollView = [[UIScrollView alloc]init];
        _titleScrollView.showsVerticalScrollIndicator = FALSE;
        _titleScrollView.showsHorizontalScrollIndicator = FALSE;
        _titleScrollView.frame = self.bounds;
        _titleScrollView.backgroundColor = [UIColor whiteColor];
        _titleScrollView.contentSize = CGSizeMake(0,0);
        _titleScrollView.bounces = NO;
    }
    return _titleScrollView;
}

- (UIView *)selectTipView {
    if (!_selectTipView) {
        _selectTipView = [[UIView alloc] init];
        _selectTipView.backgroundColor = self.tipViewColor;
        [self.titleScrollView addSubview:_selectTipView];
    }
    return _selectTipView;
}
@end
