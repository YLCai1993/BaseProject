//
//  BestGroupCell.h
//  BaseProject
//
//  Created by YLCai on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLImageView.h"

@interface BestGroupCell : UITableViewCell
@property(nonatomic,strong) YLImageView *iconView1;
@property(nonatomic,strong) YLImageView *iconView2;
@property(nonatomic,strong) YLImageView *iconView3;
@property(nonatomic,strong) YLImageView *iconView4;
@property(nonatomic,strong) YLImageView *iconView5;

@property(nonatomic,strong) UILabel *titleLb;
@property(nonatomic,strong) UILabel *descLb;



@end
