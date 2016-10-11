//
//  TpoicsChannelModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TpoicsChannelModel.h"

@implementation TpoicsChannelModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"myProperty1":@"话题"
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"myProperty1":[TpoicsChanneMyPropertylModel class]
             };
}

@end

@implementation TpoicsChanneMyPropertylModel


@end