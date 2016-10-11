//
//  DetailTopicHeaderView.m
//  BaseProject
//
//  Created by YLCai on 16/9/30.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailTopicHeaderView.h"

@implementation DetailTopicHeaderView

-(void)setConcernView:(UIButton *)concernView{
    _concernView = concernView;
    _concernView.layer.cornerRadius = 15;
    _concernView.layer.masksToBounds = YES;
}
@end
