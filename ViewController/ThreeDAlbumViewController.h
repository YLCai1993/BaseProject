//
//  ThreeDAlbumViewController.h
//  BaseProject
//
//  Created by YLCai on 16/10/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ThreeDAlbumViewController;

@protocol threeDAlbumViewControllerDelegate <NSObject>

-(void)threeDAlbumViewController:(ThreeDAlbumViewController *)threeDAlbumViewController;

@end

@interface ThreeDAlbumViewController : UIViewController

@property(nonatomic,weak)id<threeDAlbumViewControllerDelegate>delegate;

/* 存储图片网络地址  */
@property(nonatomic,strong)NSArray *pictures;

@end
