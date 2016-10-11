//
//  Topics2NetManager.m
//  BaseProject
//
//  Created by YLCai on 16/9/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "Topics2NetManager.h"

@implementation Topics2NetManager

//http://c.3g.163.com/recommend/getChanRecomNews?channel=T1460094487214&passport=&devId=FM%2BapFHrzucRVNL14WYhshFNsdWobtkzMNglAvUvz6WWLu%2BHDxiDNSY17IUThoU2&offset=0&size=5&version=15.1&spever=false&net=wifi&lat=StL9%2F5o4%2BpE4WbLG7n%2BKNg%3D%3D&lon=pZYCwvmaY6RBz8hYWteSHw%3D%3D&ts=1474972297&sign=e7E54KOaafp8yE%2BJ86kUBmJbZMW1xg11RI4egti0hSR48ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore
+(id)getTopicsChannelFromType:(NSString *)type completeHandle:(void(^)(TpoicsChannelModel *model ,NSError *error))completeHandle{
    NSString *path = @"http://c.3g.163.com/recommend/getChanRecomNews?channel=T1460094487214&passport=&devId=FM%2BapFHrzucRVNL14WYhshFNsdWobtkzMNglAvUvz6WWLu%2BHDxiDNSY17IUThoU2&offset=0&size=5&version=15.1&spever=false&net=wifi&lat=StL9%2F5o4%2BpE4WbLG7n%2BKNg%3D%3D&lon=pZYCwvmaY6RBz8hYWteSHw%3D%3D&ts=1474972297&sign=e7E54KOaafp8yE%2BJ86kUBmJbZMW1xg11RI4egti0hSR48ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore";
    return [self Get:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([TpoicsChannelModel objectWithKeyValues:responseObj],error);
    }];
}

////http://topic.comment.163.com/topic/list/subject/0-10.html
+(id)getTopicsFromStart:(NSInteger )start andPage:(NSInteger )page completeHandle:(void(^)(TopicsModel *model ,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"http://topic.comment.163.com/topic/list/subject/%ld-%ld.html",start,page];
    return [self Get:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        
        completeHandle([TopicsModel objectWithKeyValues:responseObj],error);
    }];
}

@end



















