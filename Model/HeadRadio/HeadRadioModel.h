//
//  HeadRadioModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface HeadRadioModel : BaseModel

@property (nonatomic, assign) double pageNo;
@property (nonatomic, strong) NSArray *review;
@property (nonatomic, assign) double nextPage;
@property (nonatomic, strong) NSArray *top;
@property (nonatomic, strong) NSArray *future;

@end

@interface HeadLiveReviewModel : BaseModel

@property (nonatomic, assign) double confirm;
@property (nonatomic, assign) double liveType;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, assign) double roomId;
@property (nonatomic, strong) NSString *roomName;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *endTime;
@property (nonatomic, assign) double userCount;
@property (nonatomic, assign) double liveStatus;
@property (nonatomic, assign) BOOL mutilVideo;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *startTime;
@property (nonatomic, assign) BOOL pano;
@property (nonatomic, assign) BOOL video;

@end

@interface HeadTopModel : BaseModel

@property (nonatomic, assign) double confirm;
@property (nonatomic, assign) double liveType;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, assign) double roomId;
@property (nonatomic, strong) NSString *roomName;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *endTime;
@property (nonatomic, assign) double liveStatus;
@property (nonatomic, assign) BOOL mutilVideo;
@property (nonatomic, assign) double userCount;
@property (nonatomic, strong) NSString *startTime;
@property (nonatomic, assign) BOOL pano;
@property (nonatomic, assign) BOOL video;

@end

@interface HeadFutureModel : BaseModel

@property (nonatomic, strong) NSString *startTime;
@property (nonatomic, strong) NSString *roomName;
@property (nonatomic, assign) double roomId;
@property (nonatomic, strong) NSString *image;

@end












