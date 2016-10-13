//
//  PlayMuiscView.h
//  BaseProject
//
//  Created by YLCai on 16/10/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PlayMuiscView : UIView

-(void)playerWithURl:(NSURL *)musicURL;

+(PlayMuiscView *)sharedInstance;
@property(nonatomic,strong)AVPlayer *player;
@property(nonatomic, strong) UIButton *playBtn;

@end
