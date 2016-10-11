//
//  AdsModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AdsModel.h"
#import "Global.h"

@implementation AdsModel

+(NSDictionary *)replacedKeyFromPropertyName{
//    NSLog(@"调用Str:%@",adsStr);
    return @{
             @"classModel":adsStr
             };
}

@end

@implementation adsClassModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"sourceinfo":[adsClassSourceinfoModel class]
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"img":[adsClassImgModel class]
             };
}


@end

@implementation adsClassSourceinfoModel


@end

@implementation adsClassImgModel


@end