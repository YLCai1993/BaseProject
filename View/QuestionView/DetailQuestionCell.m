//
//  DetailQuestionCell.m
//  BaseProject
//
//  Created by YLCai on 16/10/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailQuestionCell.h"

@implementation DetailQuestionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setAskHeadImageView:(UIImageView *)askHeadImageView{
    _askHeadImageView = askHeadImageView;
    _askHeadImageView.layer.cornerRadius = 12;
    _askHeadImageView.layer.masksToBounds = YES;
}

-(void)setAnswerHeadImageView:(UIImageView *)answerHeadImageView{
    _answerHeadImageView = answerHeadImageView;
    _answerHeadImageView.layer.cornerRadius = 12;
    _answerHeadImageView.layer.masksToBounds = YES;
}

@end
