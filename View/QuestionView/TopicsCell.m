
//
//  TopicsCell.m
//  BaseProject
//
//  Created by YLCai on 16/9/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TopicsCell.h"

@implementation TopicsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setHead1ImageView:(UIImageView *)head1ImageView{
    _head1ImageView = head1ImageView;
    _head1ImageView.layer.cornerRadius = 12;
    _head1ImageView.layer.masksToBounds = YES;
}

-(void)setHead2ImageView:(UIImageView *)head2ImageView{
    _head2ImageView = head2ImageView;
    _head2ImageView.layer.cornerRadius = 12;
    _head2ImageView.layer.masksToBounds = YES;
}

@end
