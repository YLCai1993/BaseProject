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
/*   获取表头视图的背景图片 */
-(NSString *)getTableViewBgImageURL;

/*   获取表头视图的内容 */
-(NSString *)getHeadTitleName;

/*   获取表头视图的内容  */
-(NSString *)getHeadContent;

#pragma 列表视图的内容

/*   首次刷新数据  */
-(void)getDetailTopicDataFromComleteHandle:(void(^)(NSError *error))completeHandle;

/*   下拉获取更多数据*/
-(void)getMoreDetailTopicDataFromComleteHandle:(void(^)(NSError *error))completeHandle;

@end
