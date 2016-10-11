//
//  PlayView.m
//  VideoTest
//
//  Created by YLCai on 16/9/9.
//  Copyright © 2016年 YLCai. All rights reserved.
//

#import "PlayView.h"

static const CGFloat kVideoControlBarHeight = 40.0;
static const CGFloat kVideoControlAnimationTimeinterval = 0.3;
static const CGFloat kVideoControlBarAutoFadeOutTimeinterval = 5.0;

@interface PlayView()

@property(nonatomic,strong)UIView *bottomBar;
@property(nonatomic,strong)UIButton *playButton;
@property(nonatomic,strong)UIButton *pauseButton;

@property(nonatomic,assign)BOOL isBarShowing;

@end

@implementation PlayView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.bottomBar];
        [self.bottomBar addSubview:self.playButton];
        [self.bottomBar addSubview:self.pauseButton];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.bottomBar.frame = CGRectMake(CGRectGetMinX(self.bounds), self.bounds.size.height - kVideoControlBarHeight,self.bounds.size.width, kVideoControlBarHeight);
    self.playButton.frame = CGRectMake(CGRectGetMinX(self.bounds), self.bottomBar.bounds.size.height/2 - self.playButton.bounds.size.height/2, self.playButton.bounds.size.width, self.playButton.bounds.size.height);
    self.pauseButton.frame = CGRectMake(CGRectGetMinX(self.bounds), self.bottomBar.bounds.size.height/2 - self.playButton.bounds.size.height/2, self.playButton.bounds.size.width, self.playButton.bounds.size.height);

}

-(void)didMoveToSuperview{
    [super didMoveToSuperview];
    self.isBarShowing = YES;
}

/*  隐藏视频播放相关按钮 */
- (void)animateHide
{
    /*  如果不是显示状态直接return  */
    if (!self.isBarShowing) {
        return;
    }
    [UIView animateWithDuration:kVideoControlAnimationTimeinterval animations:^{
        self.bottomBar.alpha = 0.0;
    } completion:^(BOOL finished) {
        self.isBarShowing = NO;
    }];
}

-(void)animateShow{
//    NSLog(@"%d",self.isBarShowing);
    if (self.isBarShowing) {
        return;
    }
    
    [UIView animateWithDuration:kVideoControlAnimationTimeinterval animations:^{
        self.bottomBar.alpha = 1.0;
    } completion:^(BOOL finished) {
        self.isBarShowing = YES;
        [self autoFadeOutControlBar];
    }];
}

-(void)autoFadeOutControlBar{
    NSLog(@"调用");
    if (!self.isBarShowing) {
        return;
    }
    
    /*  显示状态 */
    /*   cancelPreviousPerformRequestsWithTarget取消执**函数  */
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(animateHide) object:nil];
    
    /*  5秒之后执行函数 */
    [self performSelector:@selector(animateHide) withObject:nil afterDelay:kVideoControlBarAutoFadeOutTimeinterval];
}

#pragma mark - 懒加载
- (UIView *)bottomBar
{
    if (!_bottomBar) {
        _bottomBar = [UIView new];
        _bottomBar.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    }
    return _bottomBar;
}

- (UIButton *)playButton
{
    if (!_playButton) {
        _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playButton setBackgroundImage:[UIImage imageNamed:@"ipad_contentview_play"] forState:UIControlStateNormal];
        _playButton.bounds = CGRectMake(0, 0, kVideoControlBarHeight, kVideoControlBarHeight);
    }
    return _playButton;
}

-(UIButton *)pauseButton{
    if (!_pauseButton) {
        _pauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pauseButton setBackgroundImage:[UIImage imageNamed:@"player_pause"] forState:UIControlStateNormal];
        //_pauseButton.backgroundColor = [UIColor grayColor];
        _pauseButton.bounds = CGRectMake(0, 0, kVideoControlBarHeight, kVideoControlBarHeight);
    }
    return _pauseButton;
}
@end













































