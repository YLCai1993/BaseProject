//
//  VideoPlayerController.h
//  VideoTest
//
//  Created by YLCai on 16/9/5.
//  Copyright © 2016年 YLCai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface VideoPlayerController : MPMoviePlayerController

@property(nonatomic,assign)CGRect frame;

-(instancetype)initWithFrame:(CGRect)frame;

-(void)dismiss;

@end
