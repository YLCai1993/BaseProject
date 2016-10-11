//
//  HeadLineViewController.h
//  BaseProject
//
//  Created by YLCai on 16/9/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseNetManager.h"

@interface HeadLineViewController : UIViewController

@property(nonatomic,strong)NSString *className;
@property(nonatomic,assign)NewsListType type;

@end
