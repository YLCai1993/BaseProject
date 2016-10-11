//
//  LiveRadioNetManager.m
//  BaseProject
//
//  Created by YLCai on 16/9/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LiveRadioNetManager.h"

@implementation LiveRadioNetManager

+(id)getRadioListFromType:(NSString *)type completeHandle:(void(^)(HeadRadioModel *model,NSError *error))completeHandle{
    NSString *path = @"http://data.live.126.net/livechannel/previewlist.json";
    return [self Get:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([HeadRadioModel objectWithKeyValues:responseObj],error);
    }];
}

@end
