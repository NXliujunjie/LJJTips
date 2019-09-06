//
//  BOScrollPageView.m
//  BuouHost
//
//  Created by 刘俊杰 on 2019/9/6.
//  Copyright © 2019 刘俊杰. All rights reserved.
//

#import "BOScrollPageView.h"

#define IS_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#define NavHeight (IS_X ? 88 : 64)



@interface BOScrollPageView()<UIScrollViewDelegate>
{
    NSInteger currentPage;
    NSInteger startOffsetX;
}
/*
 顶部标签宽度
 默认 全屏
 */
@property (nonatomic, assign) CGFloat pageTitleW;

@end
@implementation BOScrollPageView

+ (instancetype)scrollPageView:(void (^)(BOScrollPageView *))initBlock {
    BOScrollPageView *sc = [[BOScrollPageView alloc]init];
    if (initBlock) {
        initBlock(sc);
    }
    return sc;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _pageTitleH = 44;
        _pageTitleW = [[UIScreen mainScreen] bounds].size.width;
        _scH =  [UIScreen mainScreen].bounds.size.height - _pageTitleH;
    }
    return self;
}

- (void)builder {
    
    self.pageTitleView.pageTitle = self.titleArray;
    
    self.scView.contentSize = CGSizeMake(self.titleArray.count * _pageTitleW,0);
    
    __weak typeof(self) weakSelf = self;
    [self.vcArray enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.view.frame = CGRectMake(weakSelf.pageTitleW * idx, 0,  self.scView.frame.size.width, self.scView.frame.size.height);
        [self.scView addSubview:obj.view];
    }];
    
    [self.pageTitleView setPageTitleIndex:^(NSInteger index) {
        [weakSelf scrollViewWillBeginDragging:weakSelf.scView];
        [weakSelf.scView setContentOffset:CGPointMake(index * weakSelf.pageTitleW, 0) animated:YES];
    }];
    
    [self.pageTitleView builder];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    startOffsetX = scrollView.contentOffset.x;
}

- (void)scrollViewDidScroll:(UIScrollView *) scrollView {
    currentPage = (scrollView.contentOffset.x) / scrollView.bounds.size.width;

    CGFloat scale = scrollView.contentOffset.x/self.frame.size.width;
    /*
     底部标签跟着滚动
     *///tWidth
    [self.pageTitleView bottomAnimal:scale];
    
    // 定义要获取的数据
    NSInteger sourceIndex = 0;
    NSInteger currentOffsetX = scrollView.contentOffset.x;
    if (currentOffsetX > startOffsetX) { // 左滑
        sourceIndex = (NSInteger)(scrollView.contentOffset.x/self.frame.size.width);
        NSInteger index = sourceIndex + 1;
        if (index>self.pageTitleView.titleButtonArray.count - 1) {
            index = self.pageTitleView.titleButtonArray.count - 1;
        }
        [self.pageTitleView buttonAnimal:index];
    } else { // 右滑
        sourceIndex = (NSInteger)(scrollView.contentOffset.x/self.frame.size.width);
        NSInteger index = sourceIndex ;
        if (index <=0) {
            index = 0;
        }
        [self.pageTitleView buttonAnimal:index];
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self.pageTitleView buttonState];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self.pageTitleView changeIndex:currentPage];
}

-(BOPageTitleView *)pageTitleView {
    if (!_pageTitleView) {
        _pageTitleView = [[BOPageTitleView alloc] init];
        _pageTitleView.frame = CGRectMake(0, 0, _pageTitleW, _pageTitleH);
        [self addSubview:self.pageTitleView];
    }
    return _pageTitleView;
}

-(UIScrollView *)scView {
    if (!_scView) {
        _scView = [[UIScrollView alloc]init];
        _scView.showsVerticalScrollIndicator = FALSE;
        _scView.showsHorizontalScrollIndicator = FALSE;
        _scView.frame = CGRectMake(0, _pageTitleH, _pageTitleW, _scH);;
        _scView.backgroundColor = [UIColor whiteColor];
        _scView.contentSize = CGSizeMake(0,0);
        _scView.pagingEnabled = YES;
        _scView.delegate = self;
        _scView.bounces = NO;
        [self addSubview:self.scView];
    }
    return _scView;
}

@end
