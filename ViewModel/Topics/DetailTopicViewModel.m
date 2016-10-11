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

@end

@implementation DetailTopicViewModel

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

#pragma 列表视图的内容
/*   首次刷新数据  */
-(void)getDetailTopicDataFromComleteHandle:(void(^)(NSError *error))completeHandle{
    [DetailTopicNetmanager getDetailTopicsFromSubjectId:_subjectID NextPage:nil completeHandle:^(DetailTopicMOdel *model, NSError *error) {
        self.subjectModel = model.data.subject;
        completeHandle(error);
    }];
}

/*   下拉获取更多数据*/
-(void)getMoreDetailTopicDataFromComleteHandle:(void(^)(NSError *error))completeHandle{
    
}

@end
















