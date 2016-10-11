//
//  NewsNetManager.h
//  BaseProject
//
//  Created by YLCai on 16/9/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "OtherNormalModel.h"
#import "NewsDetailModel.h"
#import "NewsModel.h"

@interface NewsNetManager : BaseNetManager
//获取头条的数据
+(id)getNewsListForm:(NewsListType)type fn:(NSInteger )fn offset:(NSInteger)offset size:(NSInteger)size completeHandle:(void(^)(NewsModel *model ,NSError *error))completeHandle;

//获取 精选类型的数据
+(id)getNewsNormalListForm:(NSString *)type offset:(NSInteger)offset size:(NSInteger)size completeHandle:(void(^)(OtherNormalModel *model ,NSError *error))completeHandle;

//获取头条cell内部cell的数据
+(id)getDetailFromType:(NSString *)type completeHandle:(void(^)(NewsDetailModel *model ,NSError *error))completeHandle;
@end
