//
//  HeadRadioModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeadRadioModel.h"

@implementation HeadRadioModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"review":@"live_review",
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"review":[HeadLiveReviewModel class],
             @"top":[HeadTopModel class],
             @"future":[HeadFutureModel class]
             };
}

@end

@implementation HeadLiveReviewModel


@end

@implementation HeadTopModel

@end

@implementation HeadFutureModel


@end













