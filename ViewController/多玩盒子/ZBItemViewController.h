//
//  ZBItemViewController.h
//  BaseProject
//
//  Created by YLCai on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLImageView.h"

@interface ZBItemViewController : UIViewController
- (id)initWithTag:(NSString *)tag name:(NSString *)name;
@property(nonatomic,strong) NSString *tag;
@end

@interface ZBItemCell : UICollectionViewCell
@property(nonatomic,strong) YLImageView *iconView;
@property(nonatomic,strong) UILabel *nameLb;
@end