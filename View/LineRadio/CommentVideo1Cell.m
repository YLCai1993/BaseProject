//
//  CommentVideo1Cell.m
//  BaseProject
//
//  Created by YLCai on 16/9/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "CommentVideo1Cell.h"

@implementation CommentVideo1Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setHeadButton:(UIButton *)headButton{
    _headButton = headButton;
    _headButton.layer.cornerRadius = 7;
    _headButton.layer.masksToBounds = YES;
}

@end
