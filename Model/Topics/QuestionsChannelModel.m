//
//  QuestionsChannelModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "QuestionsChannelModel.h"

@implementation QuestionsChannelModel

+(NSDictionary *)objectClassInArray{
    return @{
             @"data":[QuestionsChannelDataModel class]
             };
}

@end

@implementation QuestionsChannelDataModel


@end