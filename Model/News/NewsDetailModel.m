//
//  NewsDetailModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "NewsDetailModel.h"
#import "Global.h"

@implementation NewsDetailModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"infoModel":specialID
             };
}

@end


@implementation NewsDetailInfoModel

+(NSDictionary *)objectClassInArray{
    return @{
             @"topics":[NewsDetailInfoTopicModel class]
             };
}

@end

@implementation NewsDetailInfoTopicModel
+(NSDictionary *)objectClassInArray{
    return @{
             @"docs":[NewsDetailInfoTopicDocModel class]
             };
}

@end

@implementation NewsDetailInfoTopicDocModel
+(NSDictionary *)objectClassInArray{
    return @{
             @"imgextra":[NewsDetailInfoTopicDocImgextraModel class]
             };
}

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"pixelFuture":[NewsDetailInfoTopicDocPixelFutureModel class]
             };
}
@end


@implementation NewsDetailInfoTopicDocImgextraModel


@end

@implementation NewsDetailInfoTopicDocPixelFutureModel


@end
































