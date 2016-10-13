//
//  DetailQuestionModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class DetailQuestionDataModel,DetailQuestionDataExpertModel,DetailQuestionDataHotListAnswerModel,DetailQuestionDataHotListQuestionModel;

@interface DetailQuestionModel : BaseModel

@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) DetailQuestionDataModel *data;
@property (nonatomic, assign) double code;

@end

@interface DetailQuestionDataModel : BaseModel

@property (nonatomic, strong) NSArray *hotList;
@property (nonatomic, strong) NSArray *latestList;
@property (nonatomic, strong) DetailQuestionDataExpertModel *expert;

@end

@interface DetailQuestionDataLatestListModel : BaseModel

@property (nonatomic, strong) DetailQuestionDataHotListAnswerModel *answer;
@property (nonatomic, strong) DetailQuestionDataHotListQuestionModel *question;

@end

@interface DetailQuestionDataExpertModel : BaseModel

@property (nonatomic, assign) double questionCount;
@property (nonatomic, strong) NSString *classification;
@property (nonatomic, strong) NSString *expertDescription;
@property (nonatomic, assign) double expertState;
@property (nonatomic, strong) NSString *picurl;
@property (nonatomic, assign) double concernCount;
@property (nonatomic, assign) double state;
@property (nonatomic, strong) NSArray *related;
@property (nonatomic, strong) NSString *headpicurl;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double answerCount;
@property (nonatomic, strong) NSString *stitle;
@property (nonatomic, strong) NSString *alias;
@property (nonatomic, assign) double createTime;
@property (nonatomic, strong) NSString *expertId;
@property (nonatomic, strong) NSString *name;

@end

@interface DetailQuestionDataExpertRelatedNewsModel : BaseModel

@property (nonatomic, strong) NSString *topicid;
@property (nonatomic, strong) NSString *docid;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *skipType;
@property (nonatomic, strong) NSString *ptime;
@property (nonatomic, strong) NSString *skipId;


@end

@interface DetailQuestionDataHotListModel : BaseModel

@property (nonatomic, strong) DetailQuestionDataHotListAnswerModel *answer;
@property (nonatomic, strong) DetailQuestionDataHotListQuestionModel *question;

@end

@interface DetailQuestionDataHotListAnswerModel : BaseModel

@property (nonatomic, assign) double replyCount;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *commentId;
@property (nonatomic, assign) double cTime;
@property (nonatomic, strong) NSString *relatedQuestionId;
@property (nonatomic, assign) double supportCount;
@property (nonatomic, strong) NSString *answerId;
@property (nonatomic, strong) NSString *specialistName;
@property (nonatomic, strong) NSString *board;
@property (nonatomic, strong) NSString *specialistHeadPicUrl;

@end

@interface DetailQuestionDataHotListQuestionModel : BaseModel

@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, assign) double cTime;
@property (nonatomic, strong) NSString *relatedExpertId;
@property (nonatomic, strong) NSString *questionId;
@property (nonatomic, strong) NSString *userHeadPicUrl;
@property (nonatomic, strong) NSString *state;

@end











