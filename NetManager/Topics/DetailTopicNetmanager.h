//
//  DetailTopicNetmanager.h
//  BaseProject
//
//  Created by YLCai on 16/9/30.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "DetailTopicMOdel.h"

//http://topic.comment.163.com/topic/subject/details/SJ4511518634957116063.html
@interface DetailTopicNetmanager : BaseNetManager

+(id)getDetailTopicsFromSubjectId:(NSString *)ID NextPage:(NSString *)nextPage completeHandle:(void(^)(DetailTopicMOdel *model, NSError *error))completeHandle;

@end
