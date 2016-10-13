//
//  TopicsViewController.h
//  BaseProject
//
//  Created by YLCai on 16/9/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TopicsViewController;

@protocol topicsViewControllerShowDetagate <NSObject>

-(void)topicsViewController:(TopicsViewController *)topicsViewController sendExpertID:(NSString *)ID;

@end

@interface TopicsViewController : UIViewController

@property(nonatomic,weak)id<topicsViewControllerShowDetagate> delegate;

@end
