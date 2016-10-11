//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "MobClick.h"
#import "AppDelegate+Category.h"
#import "NewsViewController.h"
#import "YQSlideMenuController.h"
#import "LeftViewController.h"
#import "YLTabBarController.h"



#define AppKey @"57fb66abe0f55a10340033c1"


@interface AppDelegate ()

@end

@implementation AppDelegate

//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
//{
//    BOOL result = [UMSocialSnsService handleOpenURL:url];
//    if (result == FALSE) {
//        //调用其他SDK，例如支付宝SDK等
//    }
//    return result;
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /*  友盟统计注册  */
    [MobClick startWithAppkey:AppKey reportPolicy:BATCH channelId:nil];
    

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    YLTabBarController *contentViewController = [YLTabBarController standaedTabbarController];
    LeftViewController *leftVC = [[LeftViewController alloc] init];
    YQSlideMenuController *sideMenuController = [[YQSlideMenuController alloc] initWithContentViewController:contentViewController leftMenuViewController:leftVC];
    sideMenuController.scaleContent = YES;
    
    self.window.rootViewController = sideMenuController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end































