//
//  DetailQuestionModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailQuestionModel.h"
/**
 *  <#Description#>
 */
@implementation DetailQuestionModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return nil;
}

@end

/**
 *  <#Description#>
 */
@implementation DetailQuestionDataModel

+(NSDictionary *)objectClassInArray{
    return @{
             @"hotList":[DetailQuestionDataHotListModel class],
             @"latestList":[DetailQuestionDataLatestListModel class]
             };
}

@end

/**
 *  <#Description#>
 */
@implementation DetailQuestionDataLatestListModel


@end

/**
 *  <#Description#>
 */
@implementation DetailQuestionDataExpertModel

+(NSDictionary *)replacedKeyFromPropertyName{
   return @{
      @"expertDescription":@"description",
      @"related":@"relatedNews"
      };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"related":[DetailQuestionDataExpertRelatedNewsModel class]
             };
}

@end

@implementation DetailQuestionDataExpertRelatedNewsModel



@end

/**
 *  <#Description#>
 */
@implementation DetailQuestionDataHotListModel


@end

/**
 *  <#Description#>
 */
@implementation DetailQuestionDataHotListAnswerModel


@end

/**
 *  <#Description#>
 */
@implementation DetailQuestionDataHotListQuestionModel


@end


















