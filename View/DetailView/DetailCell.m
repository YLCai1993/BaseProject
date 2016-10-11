//
//  DetailCell.m
//  BaseProject
//
//  Created by YLCai on 16/9/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailCell.h"

@implementation DetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCommentLabel:(UILabel *)commentLabel{
    _commentLabel = commentLabel;
    _commentLabel.layer.cornerRadius = 4;
    _commentLabel.layer.masksToBounds = YES;
}


@end
