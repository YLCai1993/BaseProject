//
//  TuWanImageCell.h
//  BaseProject
//
//  Created by YLCai on 16/10/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLImageView.h"

@interface TuWanImageCell : UITableViewCell

/*  题目标签  */
@property(nonatomic,strong)UILabel *titleLb;

/*  点击数标签  */
@property(nonatomic,strong)UILabel *clicksNumLb;

/*  图片1   */
@property(nonatomic,strong)YLImageView *iconIV0;

/*  图片2   */
@property(nonatomic,strong)YLImageView *iconIV1;

/*  图片3   */
@property(nonatomic,strong)YLImageView *iconIV2;

@end
