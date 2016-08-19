//
//  ViewControllerOneNextOne.m
//  UITabBarController- System2
//
//  Created by WangQiao on 16/8/19.
//  Copyright © 2016年 WangQiao. All rights reserved.
//

#import "ViewControllerOneNextOne.h"

@implementation ViewControllerOneNextOne

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self.navigationController popViewControllerAnimated:YES];
}

@end
