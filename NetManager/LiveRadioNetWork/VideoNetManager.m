//
//  VideoNetManager.m
//  BaseProject
//
//  Created by YLCai on 16/9/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "VideoNetManager.h"

@implementation VideoNetManager

+(id)getRadioFromRoomID:(NSString *)roomID andPage:(NSInteger )page completeHandle:(void(^)(ViedoModel *model,NSError *error))completeHandle{
    NSString *path1 = [NSString stringWithFormat:@"/%@",@(page)];
//    NSString *path = [NSString stringWithFormat:@"http://data.live.126.net/liveAll/%@.json",roomID];
    NSMutableString *path = [NSMutableString stringWithFormat:@"http://data.live.126.net/liveAll/%@.json",roomID];
    if (page == 0) {
        
    }else{
        [path appendString:path1];
    }
    
    NSLog(@"path:%@",path);
    return [self Get:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
//        ViedoModel *qqq = [ViedoModel objectWithKeyValues:responseObj];
        completeHandle([ViedoModel objectWithKeyValues:responseObj],error);
    }];
}

@end
