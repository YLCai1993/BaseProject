//
//  ClassVideoModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ClassVideoModel.h"

@implementation ClassModel

+(NSDictionary *)objectClassInArray{
    return @{
             @"classModels":[ClassVideoModel class]
             };
}

@end


@implementation ClassVideoModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}

@end
