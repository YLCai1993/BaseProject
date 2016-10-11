//
//  DetailTopicNetmanager.m
//  BaseProject
//
//  Created by YLCai on 16/9/30.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailTopicNetmanager.h"

@implementation DetailTopicNetmanager

//http://topic.comment.163.com/topic/subject/details/SJ4511518634957116063.html
+(id)getDetailTopicsFromSubjectId:(NSString *)ID NextPage:(NSString *)nextPage completeHandle:(void(^)(DetailTopicMOdel *model, NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"http://topic.comment.163.com/topic/subject/details/%@.html",ID];
    return [self Get:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([DetailTopicMOdel objectWithKeyValues:responseObj],error);
    }];
}

@end
