//
//  NewsNetManager.m
//  BaseProject
//
//  Created by YLCai on 16/9/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "NewsNetManager.h"

@implementation NewsNetManager
+(id)getNewsListForm:(NewsListType)type fn:(NSInteger )fn offset:(NSInteger)offset size:(NSInteger)size completeHandle:(void(^)(NewsModel *model ,NSError *error))completeHandle;{
    NSString *newType = nil;
    switch (type) {
        case NewsListTypeTouTiao:
            newType = @"toutiao";
            break;
        default:
            break;
    }
    //&version=15.1&spever=false&net=wifi&lat=voAhmWdzhI3j5CPGaXnf0g%3D%3D&lon=%2BdFUvcQw2XwFJyBRhq%2Bo8A%3D%3D&ts=1474705798&sign=iStpEBpQhD8xSnXG67YsN8OrBkzy4wDri72fs84zF7h48ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore
    NSMutableString *url = nil;
    url = [NSMutableString stringWithFormat:@"%@",@"http://c.3g.163.com/recommend/getSubDocPic?"];
    [url appendFormat:@"from=%@",newType];
    [url appendFormat:@"&fn=%ld&prog=LMA1",fn];
    [url appendString:@"&passport=&devId=FM%2BapFHrzucRVNL14WYhshFNsdWobtkzMNglAvUvz6WWLu%2BHDxiDNSY17IUThoU2&"];
    [url appendFormat:@"offset=%ld&size=%ld",offset,size];
//    [url appendString:@"version=15.1&spever=false&net=wifi&lat=voAhmWdzhI3j5CPGaXnf0g%3D%3D&lon=%2BdFUvcQw2XwFJyBRhq%2Bo8A%3D%3D&ts=1474705798&sign=iStpEBpQhD8xSnXG67YsN8OrBkzy4wDri72fs84zF7h48ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore"];
//    NSLog(@"path:%@",url);
    return [self Get:url parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([NewsModel objectWithKeyValues:responseObj],error);
    }];
}

+(id)getNewsNormalListForm:(NSString *)type offset:(NSInteger)offset size:(NSInteger)size completeHandle:(void(^)(OtherNormalModel *model ,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/list/%@/%ld-%ld.html",type,offset,size];
    return [self Get:path parameters:nil completionHandler:^(NSDictionary * responseObj, NSError *error) {
       
        //换种解析方法
        NSMutableArray *array = [classNormalModel objectArrayWithKeyValuesArray:responseObj[type]];
        OtherNormalModel *model = [OtherNormalModel new];
        model.classModel = array;
        completeHandle(model,error);
    }];
}

+(id)getDetailFromType:(NSString *)type completeHandle:(void(^)(NewsDetailModel *model ,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"http://c.m.163.com/nc/special/%@.html",type];
    return [self Get:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        
        NewsDetailInfoModel *model = [NewsDetailInfoModel objectWithKeyValues:responseObj[type]];
        
        NewsDetailModel *model1 = [NewsDetailModel new];
        
        model1.infoModel = model;
        
        completeHandle(model1,error);
    }];
}

@end

























