//
//  DetailQuestionViewController.h
//  BaseProject
//
//  Created by YLCai on 16/10/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailQuestionViewController : UIViewController

-(instancetype)initWithID:(NSString *)ID;
@property(nonatomic,strong)NSString *ID;

@end
