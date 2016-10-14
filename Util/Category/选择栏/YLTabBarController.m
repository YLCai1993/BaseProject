//
//  YLTabBarController.m
//  BaseProject
//
//  Created by YLCai on 16/9/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YLTabBarController.h"
#import "YQSlideMenuController.h"

@interface YLTabBarController ()<YQContentViewControllerDelegate>

@end

@implementation YLTabBarController

+(YLTabBarController *)standaedTabbarController{
    static YLTabBarController *tabbar = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabbar = [kStoryboard(@"Main") instantiateViewControllerWithIdentifier:@"YLTabBarController"];
        tabbar.tabBar.tintColor = [UIColor colorWithRed:242/255.0 green:158/255.0 blue:39/255.0 alpha:1.0];
        tabbar.tabBarItem.selectedImage = [tabbar.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    });
    return tabbar;
}

+(void)initialize{
    if (self == [YLTabBarController class]) {
         //1.设置背景图
//        [tabBar setBackgroundImage:[UIImage imageNamed:@"tabbarBkg"]];
        
        //2.设置tabbar被选中的项的背景图
//        [tabBar setSelectionIndicatorImage:[UIImage imageNamed:@"yello_spot"]];
        
        UITabBarItem *barItem = [UITabBarItem appearance];
        
        //3.2设置item中文字的普通样式
        NSMutableDictionary *normalAttributes = [NSMutableDictionary dictionary];
        normalAttributes[NSForegroundColorAttributeName] = [UIColor grayColor];
        normalAttributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:11];
        [barItem setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];
        
        //3.3设置item中文字被选中的样式
        NSMutableDictionary *selectedaAttributes = [NSMutableDictionary dictionary];
        selectedaAttributes[NSForegroundColorAttributeName] = [UIColor blackColor];
        selectedaAttributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:11];
        [barItem setTitleTextAttributes:selectedaAttributes forState:UIControlStateSelected];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //渲染图片
    self.tabBar.tintColor = [UIColor colorWithRed:242/255.0 green:158/255.0 blue:39/255.0 alpha:1.0];
    self.tabBarItem.selectedImage = [self.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (UINavigationController *)yq_navigationController {
    return self.selectedViewController;
}


@end
