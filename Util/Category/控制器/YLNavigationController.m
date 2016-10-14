//
//  YLNavigationController.m
//  BaseProject
//
//  Created by YLCai on 16/9/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YLNavigationController.h"

@interface YLNavigationController ()

@end

@implementation YLNavigationController

+(void)initialize{
    if (self == [YLNavigationController class]) {
        //0.预备步骤，先要获取导航条的外观
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        UINavigationBar *bar = [UINavigationBar appearance];
        
        //1.可以设置背景色
        //        [bar setBarTintColor:[UIColor colorWithHex:0x777777 andAlpha:1.0]];
        
        //2.可以设置背景图
        [bar setBackgroundImage:[UIImage imageNamed:@"navibg"] forBarMetrics:UIBarMetricsDefault];
        
        //3.可以设置左右按钮的文字颜色  注意不是标题文字的颜色
        [bar setTintColor:[UIColor whiteColor]];
        
        //4.可以设置标题文字的垂直位置
        [bar setTitleVerticalPositionAdjustment:0 forBarMetrics:UIBarMetricsDefault];
        //
        //5.设置导航栏的样式－－影响状态栏中文字的颜色
        [bar setBarStyle:UIBarStyleBlack];
        
        //5.可以设置标题栏文字的样式
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
        attributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
        [bar setTitleTextAttributes:attributes];

    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"调用了");
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"你好" style:UIBarButtonItemStylePlain target:self action:@selector(change:)];
}

@end
