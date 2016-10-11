//
//  VideoPlayerController.m
//  VideoTest
//
//  Created by YLCai on 16/9/5.
//  Copyright © 2016年 YLCai. All rights reserved.
//

#import "VideoPlayerController.h"
#import "PlayView.h"

static const CGFloat kVideoPlayerControllerAnimationTimeinterval = 0.3f;

@interface VideoPlayerController()

@property(nonatomic,strong)PlayView *playView;

@end

@implementation VideoPlayerController

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super init];
    if (self) {
        self.view.frame = frame;
        self.view.backgroundColor = [UIColor blackColor];
        self.controlStyle = MPMovieRepeatModeNone;
        [self.view addSubview:self.playView];
        self.playView.frame = self.view.bounds;
        self.playView.pauseButton.hidden = YES;
        [self configObserver];
        [self configControlAction];
    }
    return self;
}
-(void)setContentURL:(NSURL *)contentURL{
    [super setContentURL:contentURL];
    [self play];
}

//-(void)showWindow{
//    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
//    if (!keyWindow) {
//        keyWindow = [[[UIApplication sharedApplication] windows] firstObject];
//    }
//    [keyWindow addSubview:self.view];
//    self.view.alpha = 0.0;
//
//    [UIView animateWithDuration:UIStatusBarAnimationFade animations:^{
//        self.view.alpha = 1.0;
//    } completion:^(BOOL finished) {
//        
//    }];
//    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
//}

-(void)configControlAction{
    [self.playView.playButton addTarget:self action:@selector(playVideo) forControlEvents:UIControlEventTouchUpInside];
    [self.playView.pauseButton addTarget:self action:@selector(pauseVideo) forControlEvents:UIControlEventTouchUpInside];
}

/*  监控视频的播放状态  */
-(void)configObserver{
    /*  视频的播放状态发生改变  */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onMPMoviePlayerPlaybackStateDidChangeNotification) name:MPMoviePlayerPlaybackStateDidChangeNotification object:nil];
}

-(void)onMPMoviePlayerPlaybackStateDidChangeNotification{
    if (self.playbackState == MPMoviePlaybackStatePlaying) {
        self.playView.pauseButton.hidden = NO;
        self.playView.playButton.hidden = YES;
    }else{
        self.playView.pauseButton.hidden = YES;
        self.playView.playButton.hidden = NO;
        if (self.playbackState == MPMoviePlaybackStateStopped) {
            [self.playView animateShow];
        }
    }
}

-(void)playVideo{
    [self play];
    self.playView.playButton.hidden = YES;
    self.playView.pauseButton.hidden = NO;
}

-(void)pauseVideo{
    [self pause];
    self.playView.playButton.hidden = NO;
    self.playView.pauseButton.hidden = YES;
}

-(void)dismiss{
    [self stop];
    [UIView animateWithDuration:kVideoPlayerControllerAnimationTimeinterval animations:^{
        self.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    
}

-(PlayView *)playView{
    if (!_playView) {
        _playView = [[PlayView alloc] init];
    }
    return _playView;
}
@end











































