//
//  QuestionModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class QuestionDataModel;

@interface QuestionModel : BaseModel

@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) QuestionDataModel *datas;
@property (nonatomic, assign) double code;

@end

@interface QuestionDataModel : BaseModel

@property (nonatomic, strong) NSArray *expertList;
@property (nonatomic, strong) NSArray *localExpert;

@end

@interface QuestionDataExpertListModel : BaseModel

@property (nonatomic, assign) double questionCount;
@property (nonatomic, strong) NSString *classification;
@property (nonatomic, strong) NSString *expertListDescription;
@property (nonatomic, assign) double expertState;
@property (nonatomic, strong) NSString *picurl;
@property (nonatomic, assign) double concernCount;
@property (nonatomic, assign) double state;
@property (nonatomic, strong) NSString *headpicurl;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double answerCount;
@property (nonatomic, strong) NSString *stitle;
@property (nonatomic, strong) NSString *alias;
@property (nonatomic, assign) double createTime;
@property (nonatomic, strong) NSString *expertId;
@property (nonatomic, strong) NSString *name;

@end