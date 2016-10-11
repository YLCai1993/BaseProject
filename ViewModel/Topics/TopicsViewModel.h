//
//  TopicsViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface TopicsViewModel : BaseViewModel

#pragma mark - 获取表头数据
/*  获取表头视图的图片数组  */
-(NSArray *)getPictures;
/*  获取表头视图的内容数组  */
-(NSArray *)getTopicName;
/*   获取对应的每个表头视图内容的ID  */
-(NSString *)getTopicIDForIndex:(NSInteger )index;

/*  获取表头视图的内容 */
-(void)getTopicChannelCompleteaHandle:(void(^)(NSError *error))completeHandle;


#pragma mark - 获取列表数据
/*  获取列表的行数 */
@property(nonatomic,assign)NSInteger rowNumber;

/*  获取列表标题名字  */
-(NSString *)getTitleNameForSection:(NSInteger )section;

/*  获取列表第一个评论人的头像  */
-(NSString *)getHead1ImageForSection:(NSInteger )section;

/*  获取列表第二个评论人的头像  */
-(NSString *)getHeadImage2ForSection:(NSInteger )section;

/*  获取列表第一个评论人的评论内容  */
-(NSString *)getContent1ForSection:(NSInteger )section;

/*  获取列表第二个评论人的评论内容  */
-(NSString *)getContent2ForSection:(NSInteger )section;

/*  获取列表的新闻属性  */
-(NSString *)getClassForSection:(NSInteger )section;

/*  获取列表关注人数  */
-(NSString *)getConcernForSection:(NSInteger )section;

/*  获取列表讨论人数  */
-(NSString *)getTalkForSection:(NSInteger )section;

/*  获取列表对象的subjectID  */
-(NSString *)getSubjectIDForSection:(NSInteger )section;

/*  获取列表数据  */
-(void)getTopicsDataCompleteHandle:(void(^)(NSError *error))completeHandle;

/*  获取更过的列表数据  */
-(void)getMoreTopicsDataCompleteHandle:(void(^)(NSError *error))completeHandle;

@end
