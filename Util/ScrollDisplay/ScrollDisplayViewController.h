//
//  ScrollDisplayViewController.h
//  BaseProject
//
//  Created by YLCai on 16/9/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>

@class ScrollDisplayViewController;

@protocol scrollDisplayViewControllerDelegate <NSObject>
@optional
//当用户点击了某一页触发
-(void)scrollDisplayViewController:(ScrollDisplayViewController *)scrollDisplayViewController didSelectedIndex:(NSInteger)index;

//返回滑倒当前的那一页  实时回传当前的索引值
-(void)scrollDisplayViewController:(ScrollDisplayViewController *)scrollDisplayViewController currentIdenx:(NSInteger)index;

@end

@interface ScrollDisplayViewController : UIViewController{
    NSTimer *_timer;
}

@property(nonatomic,assign)id<scrollDisplayViewControllerDelegate> delegate;

//传入详细内容数组
@property(nonatomic,strong)NSArray *detailMessage;

//传入图片的地址数组
-(instancetype)initWithImgPaths:(NSArray *)paths;

//传入图片数组
-(instancetype)initWithImgNames:(NSArray *)names;

//传入视图控制器
-(instancetype)initWithViewControllers:(NSArray *)controllers;

//传入视图控制器的滚动方向
@property(nonatomic,assign)NSInteger diration;

@property(nonatomic,strong)NSArray *paths;
@property(nonatomic,strong)NSArray *names;
@property(nonatomic,strong)NSArray *controllers;

@property(nonatomic,readonly)UIPageViewController *pageVC;
@property(nonatomic,strong)UIPageControl *pageControl;

//设置是否循环滚动
@property(nonatomic,assign)BOOL canCycle;

//设置是否定时滚动
@property(nonatomic,assign)BOOL autoCycle;

//滚动的⌚️
@property(nonatomic,assign)NSTimeInterval duration;

//是否显示  页数提示 默认为YES 显示
@property(nonatomic,assign)BOOL showPageControl;

//当前页数
@property(nonatomic,assign)NSInteger currentPage;

//设置页数提示的垂直偏移量，正数表示向下移动
@property(nonatomic,assign)CGFloat pageControlOffset;

@end











































