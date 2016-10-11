//
//  SigInViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "SigInViewController.h"
//#import "UMSocial.h"

@interface SigInViewController ()



@end

@implementation SigInViewController

-(void)setSigInButton:(UIButton *)sigInButton{
    _sigInButton = sigInButton;
    _sigInButton.layer.cornerRadius = 5;
    _sigInButton.layer.masksToBounds = YES;
}

/**  QQ账号登陆  */
- (IBAction)sigInForQQ:(UIButton *)sender {
//    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
//    
//    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
//        
//        //          获取微博用户名、uid、token等
//        
//        if (response.responseCode == UMSResponseCodeSuccess) {
//            
//            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
//            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
//            //                NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
//            
//        }});
}


- (void)viewDidLoad {
    [super viewDidLoad];
   self.navigationItem.title = @"登录网易新闻";
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(back:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
}

-(void)back:(UISwipeGestureRecognizer *)swipe{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
