//
//  NormalAdsModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "NormalAdsModel.h"

@implementation NormalAdsModel

+(NSDictionary *)objectClassInArray{
    return @{
             @"photos":[NorMalAdsPhotoModel class]
             };
}

@end


@implementation NorMalAdsPhotoModel

@end
