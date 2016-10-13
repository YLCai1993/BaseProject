//
//  DetailTopicViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/30.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface DetailTopicViewModel : BaseViewModel

-(instancetype)initWithSubjectID:(NSString *)subjectID;
@property(nonatomic,strong)NSString *subjectID;

#pragma 表头视图的内容

/*    获取单元格的高度 */
-(CGFloat )cellHeightForRow:(NSInteger )row;

/*   获取表头视图的背景图片 */
-(NSString *)getTableViewBgImageURL;

/*   获取表头视图的内容 */
-(NSString *)getHeadTitleName;

/*   获取表头视图的内容  */
-(NSString *)getHeadContent;

/* 获取列表的相关新闻  */
-(NSArray *)getReleatedNews;

/* 返回列表的行数 */
-(NSInteger )getRowNumber;

/* 获取讨论用户的头像URL */
-(NSURL *)getUserHeadImageNameForRow:(NSInteger )row;

/* 获取评论用户的名称 */
-(NSString *)getUserNameForRow:(NSInteger )row;

/* 获取评论用户的评论内容 */
-(NSString *)getUserContentForRow:(NSInteger )row;

/* 获取评论用户的评论时间 */
-(NSString *)getUserIDForRow:(NSInteger )row;

#pragma 列表视图的内容
/*   首次刷新数据  */
-(void)getDetailTopicDataFromComleteHandle:(void(^)(NSError *error))completeHandle;

/*   下拉获取更多数据*/
-(void)getMoreDetailTopicDataFromComleteHandle:(void(^)(NSError *error))completeHandle;

@end
