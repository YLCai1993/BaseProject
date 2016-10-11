//
//  QuestionModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "QuestionModel.h"

@implementation QuestionModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"datas":@"data"
             };
}

@end

@implementation QuestionDataModel

+(NSDictionary *)objectClassInArray{
    return @{
             @"expertList":[QuestionDataExpertListModel class]
             };
}

@end

@implementation QuestionDataExpertListModel


@end