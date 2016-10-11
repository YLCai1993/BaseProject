//
//  YLTabBarController.m
//  BaseProject
//
//  Created by YLCai on 16/9/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YLTabBarController.h"

@interface YLTabBarController ()

@end

@implementation YLTabBarController

+(YLTabBarController *)standaedTabbarController{
    static YLTabBarController *tabbar = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabbar = [kStoryboard(@"Main") instantiateViewControllerWithIdentifier:@"YLTabBarController"];
    });
    return tabbar;
}

+(void)initialize{
    if (self == [YLTabBarController class]) {
        //0.获取tabBar的外观
        UITabBar *tabBar = [UITabBar appearance];

        
        //1.设置背景图
//        [tabBar setBackgroundImage:[UIImage imageNamed:@"tabbarBkg"]];
        
        //2.设置tabbar被选中的项的背景图
        [tabBar setSelectionIndicatorImage:[UIImage imageNamed:@"tab-arrow"]];
        
        UITabBarItem *baeItem = [UITabBarItem appearance];
        
        //3.2设置item中文字的普通样式
        NSMutableDictionary *normalAttributes = [NSMutableDictionary dictionary];
        normalAttributes[NSForegroundColorAttributeName] = [UIColor grayColor];
        normalAttributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:11];
        [baeItem setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];
        
        //3.3设置item中文字被选中的样式
        NSMutableDictionary *selectedaAttributes = [NSMutableDictionary dictionary];
        selectedaAttributes[NSForegroundColorAttributeName] = [UIColor redColor];
        selectedaAttributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:11];
        [baeItem setTitleTextAttributes:selectedaAttributes forState:UIControlStateSelected];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //渲染图片
    UIImage *selectedImage = [self.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem.selectedImage = selectedImage;

    
}

@end
