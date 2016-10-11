//
//  QuestionsChannelModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface QuestionsChannelModel : BaseModel

@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, assign) double code;

@end

@interface QuestionsChannelDataModel : BaseModel

@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *picurl;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double createTime;
@property (nonatomic, assign) double updateTime;


@end
