//
//  ClassVideNetManager.m
//  BaseProject
//
//  Created by YLCai on 16/9/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ClassVideNetManager.h"

@implementation ClassVideNetManager

+(id)getClassfiyFormType:(NSString *)type completeHandle:(void(^)(ClassModel *model,NSError *err))completeHandle{
    NSString *path = @"http://data.live.126.net/livechannel/classifylist.json";
    return [self Get:path parameters:nil completionHandler:^(NSArray *responseObj, NSError *error) {
        NSMutableArray *arr = [NSMutableArray new];
        for (NSInteger i = 0; i<responseObj.count; i++) {
            ClassVideoModel *model2 = [ClassVideoModel objectWithKeyValues:responseObj[i]];
            [arr addObject:model2];
        }
        ClassModel *model1 = [ClassModel new];
        model1.classModels = arr;
        completeHandle(model1,error);
    }];
}

//http://data.live.126.net/livechannel/classify/4/1.json
+(id)getClassItemFromID:(NSInteger )ID andPage:(NSInteger )page completeHandle:(void(^)(HeadRadioModel
                                                                                        *model,NSError *err))completeHandle{
    NSString *path = [NSString stringWithFormat:@"http://data.live.126.net/livechannel/classify/%@/%@.json",@(ID),@(page)];
    return [self Get:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([HeadRadioModel objectWithKeyValues:responseObj],error);
    }];
}


@end
