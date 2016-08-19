//
//  AppDelegate.m
//  UITabBarController-Custom
//
//  Created by WangQiao on 16/8/19.
//  Copyright © 2016年 WangQiao. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewControllerOne.h"
#import "ViewControllerTwo.h"
#import "ViewControllerThree.h"
#import "ViewControllerFour.h"
#import "ViewControllerFive.h"
#import "HexColors.h"
#import "UIFont+Fonts.h"
#import "NSString+RenderingMode.h"
#import "UIColor+CreateImage.h"

typedef enum : NSUInteger {
    
    kDefaultStyle,
    kBlackStyle,
    kWhiteColorStyle,
    kCustomStyle,
    
} ETabBarControllerStyle;

typedef enum : NSUInteger {
    
    kImageTitleType,
    kTitleImageType,
    kImageCenterType,
    
} ETabBarType;

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window                 = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self setupWithWindow:self.window];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void) setupWithWindow:(UIWindow *)window {
    
    NSMutableArray <UIViewController *> *controllers = [NSMutableArray array];
    
    {
        ViewControllerOne *controllerOne  = [[ViewControllerOne alloc] init];
        controllerOne.tabBarItem          = [[UITabBarItem alloc] initWithTitle:@"首页" image:[@"Home" originalRenderImage] selectedImage:[@"Home_pre" originalRenderImage]];
        UINavigationController *oneNav    = [[UINavigationController alloc] initWithRootViewController:controllerOne];
        [controllers addObject:oneNav];
    }
    
    {
        ViewControllerTwo *controllerTwo  = [[ViewControllerTwo alloc] init];
        controllerTwo.tabBarItem          = [[UITabBarItem alloc] initWithTitle:@"孵化器" image:[@"fuhuaqi" originalRenderImage] selectedImage:[@"fuhuaqi_pre" originalRenderImage]];
        UINavigationController *twoNav    = [[UINavigationController alloc] initWithRootViewController:controllerTwo];
        [controllers addObject:twoNav];
    }
    
    {
        ViewControllerThree *controllerThree = [[ViewControllerThree alloc] init];
        controllerThree.tabBarItem           = [[UITabBarItem alloc] initWithTitle:@"服务" image:[@"service" originalRenderImage] selectedImage:[@"service_pre" originalRenderImage]];
        UINavigationController *threeNav     = [[UINavigationController alloc] initWithRootViewController:controllerThree];
        [controllers addObject:threeNav];
        
    }
    
    {
        ViewControllerFour *controllerFour = [[ViewControllerFour alloc] init];
        controllerFour.tabBarItem          = [[UITabBarItem alloc] initWithTitle:@"公司" image:[@"company" originalRenderImage] selectedImage:[@"company_pre" originalRenderImage]];
        UINavigationController *fourNav    = [[UINavigationController alloc] initWithRootViewController:controllerFour];
        [controllers addObject:fourNav];
    }
    
    {
        ViewControllerFive *controllerFive = [[ViewControllerFive alloc] init];
        controllerFive.tabBarItem          = [[UITabBarItem alloc] initWithTitle:@"我" image:[@"me" originalRenderImage] selectedImage:[@"me_pre" originalRenderImage]];
        UINavigationController *fiveNav    = [[UINavigationController alloc] initWithRootViewController:controllerFive];
        [controllers addObject:fiveNav];
    }
    
    // 调整字体的颜色,字体的大小
    {
        NSDictionary *normalStateAtr = @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"363c47"],NSFontAttributeName:[UIFont HeitiSCWithFontSize:10.f]};
        NSDictionary *SelectedStateAtr = @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"ffb141"],NSFontAttributeName:[UIFont HeitiSCWithFontSize:10.f]};
        [[UITabBarItem appearance] setTitleTextAttributes:normalStateAtr forState:UIControlStateNormal];
        [[UITabBarItem appearance] setTitleTextAttributes:SelectedStateAtr forState:UIControlStateSelected];
    }
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers     = controllers;
    tabBarController.delegate            = self;
    self.window.rootViewController       = tabBarController;
    
    // 设置tabBar的style
    [self tabBarController:tabBarController style:kCustomStyle];
    
    // 集中设置tabBarItem的类型
    for (UIViewController *controller in controllers) {
        
        [self setupController:controller tabBarItemType:kImageTitleType];
    }
}

- (void)setupController:(UIViewController *)controller tabBarItemType:(ETabBarType)type {
    
    if (type == kImageTitleType) { // 设置如图片在上,标题在下
        
        {  // 如下写法 offset < 0 图片位置是往上偏的
            CGFloat  offset                   = -2;
            controller.tabBarItem.imageInsets = UIEdgeInsetsMake(offset, 0, -offset, 0);
        }
        
        {   // 如下写法 offset < 0 图片位置是往上偏的
            CGFloat  offset                               = -2;
            controller.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, offset);
        }
        
    } else if (type == kTitleImageType) { // 设置标题在上,图片在下
        
        {   // 如下写法 offset > 0 图片的位置是往下偏的
            CGFloat  offset                   = 12;
            controller.tabBarItem.imageInsets = UIEdgeInsetsMake(offset, 0, -offset, 0);
        }
        
        {  // 如下写法 offset < 0 图片位置是往上偏的
            CGFloat  offset                               = -32;
            controller.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, offset);
        }
        
    } else if (type == kImageCenterType) { // 居中显示图片,这里就不能添加标题了,否则很难看
        
        {   // 如下写法 offset > 0 图片的位置是往下偏的 (其实是居中显示了)
            CGFloat  offset                   = 5;
            controller.tabBarItem.imageInsets = UIEdgeInsetsMake(offset, 0, -offset, 0);
        }
        
    } else {
        
        // 不设置就是默认
    }
}

- (void)tabBarController:(UITabBarController *)tabBarController style:(ETabBarControllerStyle)style {
    
    if (style == kDefaultStyle) { // 系统默认的style
        
        tabBarController.tabBar.barStyle = UIBarStyleDefault;
        
    } else if (style == kBlackStyle) {  // 系统的 UIBarStyleBlack
        
        tabBarController.tabBar.barStyle = UIBarStyleBlack;
        
    } else if (style == kWhiteColorStyle) { // The tint color to apply to the tab bar background.
        
        tabBarController.tabBar.barTintColor = [UIColor whiteColor];
        
    } else if (style == kCustomStyle) { // 自定义 the tab bar background,且没有线条
        
        UIImage *backgroundImage = [[[UIColor colorWithHexString:@"ffbbbb"] colorWithAlphaComponent:0.85f] imageWithFrame:CGRectMake(0, 0, 10, 10)];
        UIImage *shadowImage     = [[UIImage alloc] init];
        tabBarController.tabBar.backgroundImage = backgroundImage;
        tabBarController.tabBar.shadowImage     = shadowImage;
    }
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    for (int i = 0 ; i < tabBarController.viewControllers.count; i++) {
        
        if ([viewController isEqual:tabBarController.viewControllers[i]]) {
            
            NSLog(@"selected index - %d" , i);
        }
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
