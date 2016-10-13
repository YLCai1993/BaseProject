//
//  TuWanLisCell.h
//  BaseProject
//
//  Created by YLCai on 16/10/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLImageView.h"

@interface TuWanLisCell : UITableViewCell

/*  左侧图片 */
@property(nonatomic,strong)YLImageView *iconIV;

/*  题目标签  */
@property(nonatomic,strong)UILabel *titleLb;

/* 常标题  */
@property(nonatomic,strong)UILabel *longTitleLb;

/*   */
@property(nonatomic,strong)UILabel *clicksNumLb;

@end
