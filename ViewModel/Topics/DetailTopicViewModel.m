//
//  DetailTopicViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/30.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailTopicViewModel.h"
#import "DetailTopicNetmanager.h"

@interface DetailTopicViewModel()

@property(nonatomic,strong)DetailTopicDataSubjectModel *subjectModel;
@property(nonatomic,strong)NSMutableArray *hotList;

@end

@implementation DetailTopicViewModel

-(NSMutableArray *)hotList{
    if (!_hotList) {
        _hotList = [NSMutableArray new];
    }
    return _hotList;
}

-(DetailTopicDataSubjectModel *)subjectModel{
    if (!_subjectModel) {
        _subjectModel = [[DetailTopicDataSubjectModel alloc] init];
    }
    return _subjectModel;
}

-(instancetype)initWithSubjectID:(NSString *)subjectID{
    if (self = [super init]) {
        _subjectID = subjectID;
    }
    return self;
}

/*    获取单元格的高度 */
-(CGFloat )cellHeightForRow:(NSInteger )row{
    CGFloat textH = [[self getUserContentForRow:row] boundingRectWithSize:CGSizeMake(kWindowW-70, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:17]} context:nil].size.height;
    return textH + 95;
}

/*   获取表头视图的背景图片 */
-(NSString *)getTableViewBgImageURL{
    return self.subjectModel.picurl;
}

/*   获取表头视图的标题 */
-(NSString *)getHeadTitleName{
    NSString *name = [NSString stringWithFormat:@"# %@ #",self.subjectModel.name];
    return name;
}

/*   获取表头视图的内容  */
-(NSString *)getHeadContent{
    return self.subjectModel.alias;
}

/* 获取列表的相关新闻  */
-(NSArray *)getReleatedNews{
    NSArray *arr = self.subjectModel.related;
    NSMutableArray *news = [NSMutableArray new];
    for (DetailTopicDataSubjectRelatedNewsModel *releate in arr) {
        [news addObject:releate.title];
    }
    return [news copy];
}
/* 返回列表的行数 */
-(NSInteger )getRowNumber{
    NSLog(@"bashjcbadsjh::::%ld",self.hotList.count);
    return self.hotList.count;
}

/* 获取讨论用户的头像URL */
-(NSURL *)getUserHeadImageNameForRow:(NSInteger )row{
    DetailTopicDataHotListModel *model = self.hotList[row];
    return [NSURL URLWithString:model.userHeadPicUrl];
}

/* 获取评论用户的名称 */
-(NSString *)getUserNameForRow:(NSInteger )row{
    DetailTopicDataHotListModel *model = self.hotList[row];
    return model.userName;
}

/* 获取评论用户的评论内容 */
-(NSString *)getUserContentForRow:(NSInteger )row{
    DetailTopicDataHotListModel *model = self.hotList[row];
    return model.content;
}

/* 获取评论用户的评论时间 */
-(NSString *)getUserIDForRow:(NSInteger )row{
    DetailTopicDataHotListModel *model = self.hotList[row];
    return model.subjectId;
}

#pragma 列表视图的内容
/*   首次刷新数据  */
-(void)getDetailTopicDataFromComleteHandle:(void(^)(NSError *error))completeHandle{
    [DetailTopicNetmanager getDetailTopicsFromSubjectId:_subjectID NextPage:nil completeHandle:^(DetailTopicMOdel *model, NSError *error) {
        self.subjectModel = model.data.subject;
        [self.hotList addObjectsFromArray:model.data.hotList];
        completeHandle(error);
    }];
}

/*   下拉获取更多数据*/
-(void)getMoreDetailTopicDataFromComleteHandle:(void(^)(NSError *error))completeHandle{
    
}

@end
















