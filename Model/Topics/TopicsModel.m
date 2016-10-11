//
//  TopicsModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TopicsModel.h"

@implementation TopicsModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             
             };
}

@end

@implementation TopicsDataModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"data ":[TopicsDataSubjectListModel class]
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"subjectList":[TopicsDataSubjectListModel class]
             };
}

@end

@implementation TopicsDataSubjectListModel

+(NSDictionary *)objectClassInArray{
    return @{
             @"talkContent":[TopicsDataSubjectListTalkContentModel class]
             };
}

@end

@implementation TopicsDataSubjectListTalkContentModel

@end

@implementation TopicsDataRecomendExpertModel

+(NSDictionary *)objectClassInArray{
    return @{
             @"expertList":[TopicsDataRecomendExpertExpertListModel class]
             };
}


@end

@implementation TopicsDataRecomendExpertExpertListModel

@end







