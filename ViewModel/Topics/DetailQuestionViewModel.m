//
//  DetailQuestionViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailQuestionViewModel.h"

@interface DetailQuestionViewModel()

@property(nonatomic,strong) DetailQuestionDataModel *dataModel;

@end

@implementation DetailQuestionViewModel

-(instancetype)initWithID:(NSString *)ID{
    if (self = [super init]) {
        self.ID = ID;
    }
    return self;
}


/**  返回行数 */
-(NSInteger )rowNumber{
    return self.dataModel.hotList.count;
}

-(NSURL *)getHeaderVewImage{
    DetailQuestionDataExpertModel *model = self.dataModel.expert;
    return [NSURL URLWithString:model.picurl];
}

/**  获取内容信息 */
-(NSString *)getContentStr{
    DetailQuestionDataExpertModel *model = self.dataModel.expert;
    return model.alias;
}

/**  获取专家头像 */
-(NSURL *)getExpertHeaderImage{
     DetailQuestionDataExpertModel *model = self.dataModel.expert;
    return [NSURL URLWithString:model.headpicurl];
}

/**  获取专家名字 */
-(NSString *)getExpertName{
     DetailQuestionDataExpertModel *model = self.dataModel.expert;
    return model.name;
}

/**  获取专家职业 */
-(NSString *)getExpertZhiYe{
     DetailQuestionDataExpertModel *model = self.dataModel.expert;
    return model.title;
}

/**  获取专家介绍 */
-(NSString *)getExpertRecommand{
     DetailQuestionDataExpertModel *model = self.dataModel.expert;
    return model.expertDescription;
}

/*   首次刷新数据  */
-(void)getDetailTopicDataFromComleteHandle:(void(^)(NSError *error))completeHandle{
    [self getDetailQuestionCompleteHandle:completeHandle];
}

/**  获取相关新闻内容 */
-(NSArray *)getRelateNews{
    DetailQuestionDataExpertModel *model = self.dataModel.expert;
    NSMutableArray *arr = [NSMutableArray new];
    for (DetailQuestionDataExpertRelatedNewsModel *detail in model.related) {
        [arr addObject:detail.title];
    }
    return [arr copy];
}

/* 获取提问人的头像图片 */
-(NSURL *)getAskHeaderImageForRow:(NSInteger )row{
    NSArray *askArr = self.dataModel.hotList;
    DetailQuestionDataHotListModel *hot = askArr[row];
    DetailQuestionDataHotListQuestionModel *question = hot.question;
    return [NSURL URLWithString:question.userHeadPicUrl];
}

/* 获取提问人的名称 */
-(NSString *)getAskNameForRow:(NSInteger )row{
    NSArray *askArr = self.dataModel.hotList;
    DetailQuestionDataHotListModel *hot = askArr[row];
    DetailQuestionDataHotListQuestionModel *question = hot.question;
    return question.userName;
}

/* 获取提问人的内容 */
-(NSString *)getAskContentForRow:(NSInteger )row{
    NSArray *askArr = self.dataModel.hotList;
    DetailQuestionDataHotListModel *hot = askArr[row];
    DetailQuestionDataHotListQuestionModel *question = hot.question;
    return question.content;
}

/* 是否进行回答了 */
-(BOOL )isRepleyedForRow:(NSInteger )row{
    NSArray *askArr = self.dataModel.hotList;
    DetailQuestionDataHotListModel *hot = askArr[row];
    DetailQuestionDataHotListQuestionModel *question = hot.question;
    return [question.state isEqualToString:@"replied"] ? YES : NO;
}

/* 获取回答人的头像图片 */
-(NSURL *)getAnswerHeaderImageForRow:(NSInteger )row{
    NSArray *askArr = self.dataModel.hotList;
    DetailQuestionDataHotListModel *hot = askArr[row];
    DetailQuestionDataHotListAnswerModel *answer = hot.answer;
    return [NSURL URLWithString:answer.specialistHeadPicUrl];
}

/* 获取回答人的名称 */
-(NSString *)getAnswerNameForRow:(NSInteger )row{
    NSArray *askArr = self.dataModel.hotList;
    DetailQuestionDataHotListModel *hot = askArr[row];
    DetailQuestionDataHotListAnswerModel *answer = hot.answer;
    return answer.specialistName;
}

/* 获取回答人的内容 */
-(NSString *)getAnswerContentForRow:(NSInteger )row{
    NSArray *askArr = self.dataModel.hotList;
    DetailQuestionDataHotListModel *hot = askArr[row];
    DetailQuestionDataHotListAnswerModel *answer = hot.answer;
    return answer.content;
}

/* 相关回复的ID */
-(NSString *)getAnswerRelatedQuestionIdForRow:(NSInteger )row{
    NSArray *askArr = self.dataModel.hotList;
    DetailQuestionDataHotListModel *hot = askArr[row];
    DetailQuestionDataHotListAnswerModel *answer = hot.answer;
    return answer.relatedQuestionId;
}

/*  返回每个单元格的高度 */
-(CGFloat )cellHightForRow:(NSInteger )row{
    //CGFloat textH = [self.title boundingRectWithSize:CGSizeMake(textW , MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil].size.height;
    CGFloat height = 0;
    height = 20 + 20 + 10;
    CGFloat textW = kWindowW - 45 - 15;
    CGFloat askTextH = [[self getAskContentForRow:row] boundingRectWithSize:CGSizeMake(textW , MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18]} context:nil].size.height;
    height = height + askTextH + 10 + 11 +10 + 20 + 10;
    CGFloat questionTextH = [[self getAnswerContentForRow:row] boundingRectWithSize:CGSizeMake(textW , MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18]} context:nil].size.height;
    height = height + questionTextH + 10 + 16 + 20;
    return height;
}


/*   下拉获取更多数据*/
-(void)getMoreDetailTopicDataFromComleteHandle:(void(^)(NSError *error))completeHandle{
    
}


-(void)getDetailQuestionCompleteHandle:(void(^)(NSError *error))completeHandle{
    [TopicsNetManager getDetailTopicsBeginAtIndex:@(1) andID:self.ID completeHandle:^(DetailQuestionModel *model, NSError *error) {
        self.dataModel = model.data;
        completeHandle(error);
    }];
}
@end
