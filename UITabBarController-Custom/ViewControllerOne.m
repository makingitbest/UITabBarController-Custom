//
//  ViewController.m
//  UITabBarController-Custom
//
//  Created by WangQiao on 16/8/19.
//  Copyright © 2016年 WangQiao. All rights reserved.
//

#import "ViewControllerOne.h"
#import "ViewControllerOneNext.h"

@interface ViewControllerOne ()

@property(nonatomic, strong) UIButton *button;

@end

@implementation ViewControllerOne

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor   = [UIColor cyanColor];
    
    self.button                 = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 75, 100, 150, 44)];
    self.button.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.button setBackgroundColor:[UIColor grayColor]];
    [self.button setTitle:@"点我进入下一个页面" forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)buttonClicked:(UIButton *)button {
    
    NSLog(@"我被点击了");
    ViewControllerOneNext *oneNext   = [[ViewControllerOneNext alloc] init];
    oneNext.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:oneNext animated:YES];
}

@end
