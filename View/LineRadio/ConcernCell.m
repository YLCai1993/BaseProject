//
//  ConcernCell.m
//  BaseProject
//
//  Created by YLCai on 16/9/30.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ConcernCell.h"

@implementation ConcernCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setHeadImageView:(UIImageView *)headImageView{
    _headImageView = headImageView;
    _headImageView.layer.cornerRadius = 5;
    _headImageView.layer.masksToBounds = YES;
}

-(void)setConcernButton:(UIButton *)concernButton{
    _concernButton = concernButton;
    _concernButton.layer.cornerRadius = 12;
    _concernButton.layer.masksToBounds = YES;
}

@end
