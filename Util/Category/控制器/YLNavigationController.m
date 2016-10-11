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
        UINavigationBar *bar = [UINavigationBar appearance];
        [bar setBarTintColor:[UIColor redColor]];
         [bar setBarStyle:UIBarStyleBlack];
        [bar setBackgroundImage:[UIImage imageNamed:@"top_navigation_background"] forBarMetrics:UIBarMetricsDefault];
        [bar setTintColor:[UIColor whiteColor]];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"调用了");
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"你好" style:UIBarButtonItemStylePlain target:self action:@selector(change:)];
}

@end
