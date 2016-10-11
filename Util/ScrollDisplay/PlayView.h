//
//  PlayView.h
//  VideoTest
//
//  Created by YLCai on 16/9/9.
//  Copyright © 2016年 YLCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayView : UIView

@property (nonatomic, strong, readonly) UIView *bottomBar;
@property (nonatomic, strong, readonly) UIButton *playButton;
@property (nonatomic, strong, readonly) UIButton *pauseButton;

/*  隐藏视频播放相关按钮  */
- (void)animateHide;
/*  显示视频播放相关按钮  */
- (void)animateShow;

@end
