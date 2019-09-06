//
//  ViewController.m
//  BOTips
//
//  Created by 刘俊杰 on 2019/9/6.
//  Copyright © 2019 刘俊杰. All rights reserved.
//

#import "ViewController.h"
#import "BOScrollPageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController *vc1 = [[UIViewController alloc] init];
    UIViewController *vc2 = [[UIViewController alloc] init];
    UIViewController *vc3 = [[UIViewController alloc] init];
    UIViewController *vc4 = [[UIViewController alloc] init];
    UIViewController *vc5 = [[UIViewController alloc] init];
    UIViewController *vc6 = [[UIViewController alloc] init];
    UIViewController *vc7 = [[UIViewController alloc] init];
    UIViewController *vc8 = [[UIViewController alloc] init];
    
    [BOScrollPageView scrollPageView:^(BOScrollPageView * pageView) {
        pageView.frame = CGRectMake(0,100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64);
        pageView.titleArray = @[@"vc1",
                                @"vc2",
                                @"vc3",
                                @"vc4",
                                @"vc5",
                                @"vc6",
                                @"vc7",
                                @"vc8",
                                ];
        pageView.vcArray = @[vc1,
                             vc2,
                             vc3,
                             vc4,
                             vc5,
                             vc6,
                             vc7,
                             vc8,];
        [pageView builder];
        [self.view addSubview:pageView];
    }];
}


@end
