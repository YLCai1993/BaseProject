//
//  MusicListViewController.h
//  BaseProject
//
//  Created by YLCai on 16/10/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MusicListViewController : UIViewController

- (instancetype)initWithAlbumId:(NSInteger)albumId;
@property(nonatomic) NSInteger albumId;

@end
