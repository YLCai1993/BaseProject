//
//  DetailViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailViewModel.h"

@interface DetailViewModel()

@property(nonatomic,strong)NewsDetailModel *model;

@end

@implementation DetailViewModel

-(NSString *)getNaviGationname{
    NewsDetailInfoModel *infoModel = self.model.infoModel;
    return infoModel.sname;
}

-(instancetype)initWithType:(NSString *)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}
-(NSInteger)rowNumberForSection:(NSInteger)section{
    NSArray *topics = self.model.infoModel.topics;
    NewsDetailInfoTopicModel *topic = topics[section];
    return topic.docs.count;
}

-(NSInteger)sectionNumber{
    return [self getInfoModel].topics.count;
}

-(NSString *)titleForSection:(NSInteger )section{
    NSArray *arr = [self getClassMessage];
    return arr[section];
}

-(NSString *)titleForIndexPath:(NSIndexPath *)indexPath{
    NSArray *topics = self.model.infoModel.topics;
    NewsDetailInfoTopicModel *topic = topics[indexPath.section];
    NewsDetailInfoTopicDocModel *doc= topic.docs[indexPath.row];
    return doc.title;
}

-(NSString *)commentForIndexPath:(NSIndexPath *)indexPath{
    NSArray *topics = self.model.infoModel.topics;
    NewsDetailInfoTopicModel *topic = topics[indexPath.section];
    NewsDetailInfoTopicDocModel *doc= topic.docs[indexPath.row];
    return [NSString stringWithFormat:@"%.0lf跟帖",doc.votecount];
}

-(NewsDetailInfoModel *)getInfoModel{
    return self.model.infoModel;
}

-(NSArray *)getClassMessage{
    NSMutableArray *arr = [NSMutableArray new];
    for (NewsDetailInfoTopicModel *model in [self getInfoModel].topics) {
        [arr addObject:model.shortname];
    }
    return [arr copy];
}

-(NSURL *)getHeaderImageURL{
    return [NSURL URLWithString:[self getInfoModel].banner];
}

-(NSURL *)iconForIndexPath:(NSIndexPath *)indexPath{
    NSArray *topics = self.model.infoModel.topics;
    NewsDetailInfoTopicModel *topic = topics[indexPath.section];
    NewsDetailInfoTopicDocModel *doc= topic.docs[indexPath.row];
    return [NSURL URLWithString:doc.imgsrc];
}

-(void)refreshDataCompleteHandle:(void(^)(NSError *error))complete{
    [NewsNetManager getDetailFromType:_type completeHandle:^(NewsDetailModel *model, NSError *error) {
        self.model = model;
        if (error) {
            NSLog(@"error:%@",error);
        }
         complete(error);
    }];
}

@end
