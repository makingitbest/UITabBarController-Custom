//
//  ViewControllerOneNext.m
//  UITabBarController- System2
//
//  Created by WangQiao on 16/8/19.
//  Copyright © 2016年 WangQiao. All rights reserved.
//

#import "ViewControllerOneNext.h"
#import "UIColor+CreateImage.h"
#import "HexColors.h"
#import "UIView+SetRect.h"
#import "ViewControllerOneNextOne.h"

typedef enum : NSUInteger {
    
    kBackButtonTag = 1000,
    kNextButtonTag,
    
} EButtonTag;

@implementation ViewControllerOneNext

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor brownColor];

    [self setupNavigationItem];
}

- (void)setupNavigationItem {
    

    UIView *navigationView         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, StatusBarAndNavigationBarHeight)];
    navigationView.backgroundColor = [UIColor colorWithHexString:@"daf4fe"];
    [self.view addSubview:navigationView];
    
    {
        UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(10, StatusBarHeight, 50, NavigationBarHeight)];
        button.tag        = kBackButtonTag;
        [button setImage:[UIImage imageNamed:@"back_b"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(backbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [navigationView addSubview:button];
    }
    
    {
        UILabel *titleLabel        = [[UILabel alloc] initWithFrame:CGRectMake(Width / 2  - 80 , StatusBarHeight, 160, NavigationBarHeight)];
        titleLabel.text            = @"我就是这个页面";
        titleLabel.textAlignment   = NSTextAlignmentCenter;
        [navigationView addSubview:titleLabel];
    }
    
    {
        UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(Width - 10 - 50 , StatusBarHeight, 50, NavigationBarHeight)];
        button.tag        = kNextButtonTag;
        [button setImage:[UIImage imageNamed:@"Search Icon Copy"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(backbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [navigationView addSubview:button];
    }
}

- (void)backbuttonClick:(UIButton *)button {

    if (button.tag == kBackButtonTag) {
        
        [self.navigationController popViewControllerAnimated:YES];

    } else if (button.tag == kNextButtonTag) {
    
        ViewControllerOneNextOne *oneNextOne = [[ViewControllerOneNextOne alloc] init];
        [self.navigationController pushViewController:oneNextOne animated:YES];
    
    }
}

@end
