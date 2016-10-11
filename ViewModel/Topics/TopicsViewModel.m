//
//  TopicsViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TopicsViewModel.h"
#import "Topics2NetManager.h"

@interface TopicsViewModel()

/*  存储表头数据的数据 */
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,assign)NSInteger start;
@property(nonatomic,assign)NSInteger page;

/* 存储列表数据的数组  */
@property(nonatomic,strong)NSMutableArray *listDataArr;

@end

@implementation TopicsViewModel

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

-(NSArray *)getPictures{
    NSMutableArray *pictures = [NSMutableArray array];
    for (TpoicsChanneMyPropertylModel *model in self.dataArr) {
        [pictures addObject:model.picUrl];
    }
    return [pictures copy];
}

-(NSArray *)getTopicName{
    NSMutableArray *pictures = [NSMutableArray array];
    for (TpoicsChanneMyPropertylModel *model in self.dataArr) {
        [pictures addObject:model.topicName];
    }
    return [pictures copy];

}
-(NSString *)getTopicIDForIndex:(NSInteger )index{
    TpoicsChanneMyPropertylModel *model = self.dataArr[index];
    return model.topicId;
}

-(void)getTopicChannelCompleteaHandle:(void(^)(NSError *error))completeHandle{
    
    [Topics2NetManager getTopicsChannelFromType:nil completeHandle:^(TpoicsChannelModel *model, NSError *error) {
        self.dataArr = [model.myProperty1 copy];
        completeHandle(error);
    }];
    
}

#pragma mark - 获取列表数据
-(NSMutableArray *)listDataArr{
    if (!_listDataArr) {
        _listDataArr = [NSMutableArray array];
    }
    return _listDataArr;
}

-(NSInteger)rowNumber{
    return self.listDataArr.count;
}

/*  获取列表标题名字  */
-(NSString *)getTitleNameForSection:(NSInteger )section{
    TopicsDataSubjectListModel *model = self.listDataArr[section];
    NSString *name = [NSString stringWithFormat:@"# %@ #",model.name];
    return name;
}

/*  获取列表第一个评论人的头像  */
-(NSString *)getHead1ImageForSection:(NSInteger )section{
    TopicsDataSubjectListModel *model = self.listDataArr[section];
    TopicsDataSubjectListTalkContentModel *talkModel = model.talkContent[0];
    return talkModel.userHeadPicUrl;
}

/*  获取列表第二个评论人的头像  */
-(NSString *)getHeadImage2ForSection:(NSInteger )section{
    TopicsDataSubjectListModel *model = self.listDataArr[section];
    TopicsDataSubjectListTalkContentModel *talkModel = model.talkContent[1];
    return talkModel.userHeadPicUrl;
}

/*  获取列表第一个评论人的评论内容  */
-(NSString *)getContent1ForSection:(NSInteger )section{
    TopicsDataSubjectListModel *model = self.listDataArr[section];
    TopicsDataSubjectListTalkContentModel *talkModel = model.talkContent[0];
    return talkModel.content;
}

/*  获取列表第二个评论人的评论内容  */
-(NSString *)getContent2ForSection:(NSInteger )section{
    TopicsDataSubjectListModel *model = self.listDataArr[section];
    TopicsDataSubjectListTalkContentModel *talkModel = model.talkContent[1];
    return talkModel.content;
}

/*  获取列表的新闻属性  */
-(NSString *)getClassForSection:(NSInteger )section{
    TopicsDataSubjectListModel *model = self.listDataArr[section];
    return model.classification;
}

/*  获取列表关注人数  */
-(NSString *)getConcernForSection:(NSInteger )section{
    TopicsDataSubjectListModel *model = self.listDataArr[section];
    NSString *concern = [NSString stringWithFormat:@"%.ld关注",(NSInteger)model.concernCount];
    return concern;
}

/*  获取列表讨论人数  */
-(NSString *)getTalkForSection:(NSInteger )section{
    TopicsDataSubjectListModel *model = self.listDataArr[section];
    NSString *concern = [NSString stringWithFormat:@"%.ld讨论",(NSInteger)model.talkCount];
    return concern;
}

/*  获取对应列表的subjectID  */
-(NSString *)getSubjectIDForSection:(NSInteger )section{
    TopicsDataSubjectListModel *model = self.listDataArr[section];
    return model.subjectId;
}

-(void)getTopicsDataCompleteHandle:(void(^)(NSError *error))completeHandle{
    _page = 10;
    _start = 0;
    [self getTopcisCompleteHandle:completeHandle];
}
-(void)getMoreTopicsDataCompleteHandle:(void(^)(NSError *error))completeHandle{
    _start += 10;
    [self getTopcisCompleteHandle:completeHandle];
}

-(void)getTopcisCompleteHandle:(void(^)(NSError *error))completeHandle{
    [Topics2NetManager getTopicsFromStart:_start andPage:_page completeHandle:^(TopicsModel *model, NSError *error) {
        if (_start == 0) {
            [self.listDataArr removeAllObjects];
        }
        TopicsDataModel *dataModel = model.data;
        [self.listDataArr addObjectsFromArray:dataModel.subjectList];
        completeHandle(error);
    }];
}
@end







































