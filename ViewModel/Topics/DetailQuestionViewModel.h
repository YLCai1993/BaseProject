//
//  DetailQuestionViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TopicsNetManager.h"

@interface DetailQuestionViewModel : BaseViewModel

-(instancetype)initWithID:(NSString *)ID;
@property(nonatomic,strong)NSString *ID;

/**  返回行数 */
-(NSInteger )rowNumber;

/**  获取背景图片 */
-(NSURL *)getHeaderVewImage;

/**  获取内容信息 */
-(NSString *)getContentStr;

/**  获取专家头像 */
-(NSURL *)getExpertHeaderImage;

/**  获取专家名字 */
-(NSString *)getExpertName;

/**  获取专家职业 */
-(NSString *)getExpertZhiYe;

/**  获取专家介绍 */
-(NSString *)getExpertRecommand;

/**  获取相关新闻内容 */
-(NSArray *)getRelateNews;

/* 获取提问人的头像图片 */
-(NSURL *)getAskHeaderImageForRow:(NSInteger )row;

/* 获取提问人的名称 */
-(NSString *)getAskNameForRow:(NSInteger )row;

/* 获取提问人的内容 */
-(NSString *)getAskContentForRow:(NSInteger )row;

/* 是否进行回答了 */
-(BOOL )isRepleyedForRow:(NSInteger )row;

/* 获取回答人的头像图片 */
-(NSURL *)getAnswerHeaderImageForRow:(NSInteger )row;

/* 获取回答人的名称 */
-(NSString *)getAnswerNameForRow:(NSInteger )row;

/* 获取回答人的内容 */
-(NSString *)getAnswerContentForRow:(NSInteger )row;

/* 相关回复的ID */
-(NSString *)getAnswerRelatedQuestionIdForRow:(NSInteger )row;

/*  返回每个单元格的高度 */
-(CGFloat )cellHightForRow:(NSInteger )row;

/*   首次刷新数据  */
-(void)getDetailTopicDataFromComleteHandle:(void(^)(NSError *error))completeHandle;

/*   下拉获取更多数据*/
-(void)getMoreDetailTopicDataFromComleteHandle:(void(^)(NSError *error))completeHandle;

@end
