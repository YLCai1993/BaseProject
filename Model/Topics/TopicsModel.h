//
//  TopicsModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class TopicsDataModel,TopicsDataRecomendExpertModel;

@interface TopicsModel : BaseModel

@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) TopicsDataModel *data;
@property (nonatomic, assign) double code;

@end

@interface TopicsDataModel : BaseModel

@property (nonatomic, strong) NSArray *subjectList;
@property (nonatomic, strong) TopicsDataRecomendExpertModel *recomendExpert;

@end

@interface TopicsDataSubjectListModel : BaseModel

@property (nonatomic, assign) double state;
@property (nonatomic, strong) NSString *classification;
@property (nonatomic, assign) double concernCount;
@property (nonatomic, strong) NSString *picurl;
@property (nonatomic, strong) NSString *feature;
@property (nonatomic, strong) NSString *subjectId;
@property (nonatomic, strong) NSArray *talkContent;
@property (nonatomic, assign) double talkCount;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) double createTime;
@property (nonatomic, strong) NSString *alias;
@property (nonatomic, strong) NSString *name;

@end

@interface TopicsDataSubjectListTalkContentModel : BaseModel

@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *userHeadPicUrl;
@property (nonatomic, strong) NSString *talkId;

@end

@interface TopicsDataRecomendExpertModel : BaseModel

@property (nonatomic, strong) NSArray *expertList;
@property (nonatomic, assign) double position;  //上面的数组放的位置

@end

@interface TopicsDataRecomendExpertExpertListModel : BaseModel

@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *expertListIdentifier;
@property (nonatomic, assign) double questionCount;
@property (nonatomic, strong) NSString *headpicurl;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double concernCount;

@end































