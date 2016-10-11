//
//  OtherNormalModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "OtherNormalModel.h"
#import "Global.h"

@implementation OtherNormalModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{ @"classModel":@[@"T1467284926140",@"T1348648517839",@"T1348649079062",@"T1348648756099",@"T1348649580692",@"T1348650593803"][classIndex],
             };
}


+(NSDictionary *)objectClassInArray{
    return @{
             @"classModel":NSStringFromClass([classNormalModel class])
             };
}

@end

@implementation imgsrcNormalModel

@end

@implementation classNormalModel

+(NSDictionary *)objectClassInArray{
    return @{
             @"ads":[AdsNewsModel class],
             @"imgextra":[imgsrcNormalModel class],
             };
}

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"template1":@"template",
             @"tAG":@"TAG",
             @"tAGS":@"TAGS"
             };
}

@end











