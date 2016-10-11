//
//  MeTableHeaderView.m
//  BaseProject
//
//  Created by YLCai on 16/10/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MeTableHeaderView.h"


@implementation MeTableHeaderView

-(void)setSigInButton:(UIButton *)sigInButton{
    _sigInButton = sigInButton;
    _sigInButton.layer.cornerRadius = 5;
    _sigInButton.layer.masksToBounds = YES;
}

/*  邮箱/手机号登录  */
- (IBAction)sigInButtonClick:(UIButton *)sender {
    NSLog(@"邮箱/手机登录");
}


- (IBAction)weChatSigIn:(UIButton *)sender {
    NSLog(@"微信登录");
}

- (IBAction)weiBoSigIn:(UIButton *)sender {
    NSLog(@"微博登录");
}

- (IBAction)QQSigIn:(UIButton *)sender {
    NSLog(@"QQ登录");
}
@end
