//
//  DetailQuestionExpertView.m
//  BaseProject
//
//  Created by YLCai on 16/10/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailQuestionExpertView.h"

@implementation DetailQuestionExpertView

-(void)setHeadImageView:(UIImageView *)headImageView{
    _headImageView = headImageView;
    _headImageView.layer.cornerRadius = 17;
    _headImageView.layer.masksToBounds = YES;
}

@end
