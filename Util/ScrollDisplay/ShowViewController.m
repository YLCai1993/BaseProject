//
//  ShowViewController.m
//  BaseProject
//
//  Created by YLCai on 16/9/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ShowViewController.h"

@interface ShowViewController ()

@property(nonatomic,strong)UILabel *showLabel;

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

-(void)setMessage:(NSString *)message{
    _message = message;
    _showLabel = [[UILabel alloc] init];
        _showLabel.text = message;
    [self.view addSubview:_showLabel];
    [_showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.view.centerX).mas_equalTo(0);
        make.left.right.mas_equalTo(0);
    }];
}

@end
