//
//  DetailTopicMOdel.m
//  BaseProject
//
//  Created by YLCai on 16/9/30.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailTopicMOdel.h"

@implementation DetailTopicMOdel

@end

@implementation DetailTopicDataModel

+(NSDictionary *)objectClassInArray{
    return @{
             @"hotList":[DetailTopicDataHotListModel class],
             @"latestList":[DetailTopicDataLatestListModel class]
             };
}

@end

@implementation DetailTopicDataSubjectModel

@end

@implementation DetailTopicDataHotListModel

@end

@implementation DetailTopicDataLatestListModel

@end