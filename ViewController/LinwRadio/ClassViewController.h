//
//  ClassViewController.h
//  BaseProject
//
//  Created by YLCai on 16/9/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ClassViewController;

@protocol classViewControllerDelegate <NSObject>

-(void)classViewController:(ClassViewController *)ClassViewController sendIndex:(NSInteger )index;

@end

@interface ClassViewController : UIViewController

@property(nonatomic,weak)id<classViewControllerDelegate> delegate;

@end
