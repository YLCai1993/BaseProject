//
//  DetailTopicCell.m
//  BaseProject
//
//  Created by YLCai on 16/10/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailTopicCell.h"

@implementation DetailTopicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setUserHeadImageView:(UIImageView *)userHeadImageView{
    _userHeadImageView = userHeadImageView;
    _userHeadImageView.layer.cornerRadius = 12;
    _userHeadImageView.layer.masksToBounds = YES;
}

@end
