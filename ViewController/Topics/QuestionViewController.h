//
//  QuestionViewController.h
//  BaseProject
//
//  Created by YLCai on 16/9/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuestionViewController;

@protocol questionViewControllerDelegate <NSObject>

-(void)questionViewController:(QuestionViewController *)questionViewController didSendExpertID:(NSString *)ID;

@end

@interface QuestionViewController : UIViewController

@property(nonatomic,weak)id<questionViewControllerDelegate> delegate;

@end
