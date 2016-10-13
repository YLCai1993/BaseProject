//
//  TopicsNetManager.m
//  BaseProject
//
//  Created by YLCai on 16/9/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TopicsNetManager.h"

@implementation TopicsNetManager

//http://c.m.163.com/newstopic/list/classification.html
+(id)getTopicsChannelFromType:(NSString *)type completeHandle:(void(^)(QuestionsChannelModel *model ,NSError *error))completeHandle{
    NSString *path = @"http://c.m.163.com/newstopic/list/classification.html";
    return [self Get:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([QuestionsChannelModel objectWithKeyValues:responseObj],error);
    }];
}

//http://c.m.163.com/newstopic/list/expert/6ams6Z6N5bGx/0-10.html
+(id)getTopicsFromBeginIndex:(NSInteger )index andPage:(NSInteger )page completeHandle:(void(^)(QuestionModel *model ,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"http://c.m.163.com/newstopic/list/expert/6ams6Z6N5bGx/%ld-%ld.html",index,page];
    return [self Get:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([QuestionModel objectWithKeyValues:responseObj],error);
    }];
    
}

//http://c.m.163.com/newstopic/qa/EX01683146813708615596.html
+(id)getDetailTopicsBeginAtIndex:(NSNumber *)index andID:(NSString *)ID completeHandle:(void(^)(DetailQuestionModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:@"http://c.m.163.com/newstopic/qa/%@.html",ID];
    return [self Get:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([DetailQuestionModel objectWithKeyValues:responseObj],error);
    }];

}


@end
