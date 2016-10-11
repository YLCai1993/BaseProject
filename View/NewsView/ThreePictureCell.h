//
//  ThreePictureCell.h
//  BaseProject
//
//  Created by YLCai on 16/9/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreePictureCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *pictureOneView;

@property (weak, nonatomic) IBOutlet UIImageView *pictureTwoView;

@property (weak, nonatomic) IBOutlet UIImageView *pictureThreeView;

@property (weak, nonatomic) IBOutlet UILabel *classLabel;

@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@property (weak, nonatomic) IBOutlet UIButton *deleteButton;


@end
