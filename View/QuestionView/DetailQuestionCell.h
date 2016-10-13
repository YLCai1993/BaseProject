//
//  DetailQuestionCell.h
//  BaseProject
//
//  Created by YLCai on 16/10/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailQuestionCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *askHeadImageView;

@property (weak, nonatomic) IBOutlet UILabel *askTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *askContentLabel;

@property (weak, nonatomic) IBOutlet UIImageView *answerHeadImageView;

@property (weak, nonatomic) IBOutlet UILabel *answerTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *answerContentLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIButton *zanButton;

@property (weak, nonatomic) IBOutlet UIButton *shareButton;





@end
