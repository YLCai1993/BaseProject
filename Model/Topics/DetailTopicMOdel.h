//
//  DetailTopicMOdel.h
//  BaseProject
//
//  Created by YLCai on 16/9/30.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class DetailTopicDataModel,DetailTopicDataSubjectModel;

@interface DetailTopicMOdel : BaseModel

@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) DetailTopicDataModel *data;
@property (nonatomic, assign) double code;

@end

@interface DetailTopicDataModel : BaseModel

@property (nonatomic, strong) DetailTopicDataSubjectModel *subject;
@property (nonatomic, strong) NSArray *hotList;
@property (nonatomic, strong) NSArray *latestList;

@end

@interface DetailTopicDataSubjectModel : BaseModel

@property (nonatomic, assign) double state;
@property (nonatomic, strong) NSString *classification;
@property (nonatomic, assign) double concernCount;
@property (nonatomic, strong) NSString *picurl;
@property (nonatomic, strong) NSArray *timeline;
@property (nonatomic, strong) NSString *subjectId;
@property (nonatomic, strong) NSArray *talkContent;
@property (nonatomic, strong) NSArray *relatedNews;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) double talkCount;
@property (nonatomic, strong) NSString *feature;
@property (nonatomic, assign) double createTime;
@property (nonatomic, strong) NSString *alias;
@property (nonatomic, assign) double timelineCount;
@property (nonatomic, strong) NSString *name;

@end

@interface DetailTopicDataHotListModel : BaseModel

@property (nonatomic, assign) double supportCount;
@property (nonatomic, assign) double auditState;
@property (nonatomic, strong) NSString *userHeadPicUrl;
@property (nonatomic, strong) NSArray *picurl;
@property (nonatomic, assign) double cTime;
@property (nonatomic, assign) double discussCount;
@property (nonatomic, strong) NSString *subjectId;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *talkId;
@property (nonatomic, strong) NSString *subjectName;
@property (nonatomic, strong) NSString *content;

@end

@interface DetailTopicDataLatestListModel : BaseModel

@property (nonatomic, assign) double supportCount;
@property (nonatomic, assign) double auditState;
@property (nonatomic, strong) NSString *userHeadPicUrl;
@property (nonatomic, strong) NSArray *picurl;
@property (nonatomic, assign) double cTime;
@property (nonatomic, assign) double discussCount;
@property (nonatomic, strong) NSString *subjectId;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *talkId;
@property (nonatomic, strong) NSString *subjectName;
@property (nonatomic, strong) NSString *content;

@end



































