//
//  AdsNetManager.m
//  BaseProject
//
//  Created by YLCai on 16/9/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AdsNetManager.h"

@implementation AdsNetManager

+(id)getAdsForm:(NSString *)type completeHandle:(void(^)(AdsModel *model ,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/%@/full.html",type];
//    NSLog(@"path:%@",path);
    return [self Get:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        adsClassModel *model1 = [adsClassModel objectWithKeyValues:responseObj[type]];
        AdsModel *model2 = [AdsModel new];
        model2.classModel = model1;
        completeHandle(model2,error);
    }];
}

+(id)getNormalAdsForm:(NSString *)ID completeHandle:(void(^)(NormalAdsModel *model ,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"http://c.m.163.com/photo/api/set/0001/%@.json",ID];
    return [self Get:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([NormalAdsModel objectWithKeyValues:responseObj],error);
    }];
}

@end
