//
//  TopicsNetManager.h
//  BaseProject
//
//  Created by YLCai on 16/9/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "QuestionsChannelModel.h"
#import "QuestionModel.h"
#import "DetailQuestionModel.h"

@interface TopicsNetManager : BaseNetManager

//获取第三页话题上方内容
+(id)getTopicsChannelFromType:(NSString *)type completeHandle:(void(^)(QuestionsChannelModel *model ,NSError *error))completeHandle;


//获取下方tableView的内容
+(id)getTopicsFromBeginIndex:(NSInteger )index andPage:(NSInteger )page completeHandle:(void(^)(QuestionModel *model ,NSError *error))completeHandle;

/** 获取第三页下方向西内容 */
+(id)getDetailTopicsBeginAtIndex:(NSNumber *)index andID:(NSString *)ID completeHandle:(void(^)(DetailQuestionModel *model,NSError *error))completeHandle;


@end
