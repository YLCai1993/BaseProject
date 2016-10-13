//
//  QuestionViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "QuestionViewModel.h"
#import "TopicsNetManager.h"

@interface QuestionViewModel()

//存放的是第三页问吧下面的实体类
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,assign)NSInteger index;
@property(nonatomic,assign)NSInteger pageNumber;

@end

@implementation QuestionViewModel

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

-(NSInteger )getRowNumber{
    return self.dataArr.count;
}

-(NSString *)getHeadImageForSection:(NSInteger )section{
    QuestionDataExpertListModel *model = self.dataArr[section];
    return model.headpicurl;

}
-(NSString *)getNameForSection:(NSInteger )section{
    QuestionDataExpertListModel *model = self.dataArr[section];
    return model.name;
}
-(NSString *)getNiNameForSection:(NSInteger )section{
    QuestionDataExpertListModel *model = self.dataArr[section];
    return model.title;
}
-(NSString *)getContentImageForSection:(NSInteger )section{
    QuestionDataExpertListModel *model = self.dataArr[section];
    return model.picurl;
}

-(NSString *)getContentForSection:(NSInteger )section{
    QuestionDataExpertListModel *model = self.dataArr[section];
    return model.alias;
}

-(CGFloat )cellHeightForRow:(NSInteger )section{
    
    NSString *str = [self getContentForSection:section];
    CGFloat textH = [str boundingRectWithSize:CGSizeMake(kWindowW-20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16]} context:nil].size.height;
    return 222 + textH + 10 + 17 +18;
}

-(NSString *)getClassNameForSection:(NSInteger )section{
    QuestionDataExpertListModel *model = self.dataArr[section];
    return model.classification;
}
-(NSString *)getConcernFoSection:(NSInteger )section{
    QuestionDataExpertListModel *model = self.dataArr[section];
    NSString *concern = [NSString stringWithFormat:@"%ld 关注",(NSInteger)model.concernCount];
    return concern;
}
-(NSString *)getQuestionForSection:(NSInteger )section{
    QuestionDataExpertListModel *model = self.dataArr[section];
    NSString *cquestion = [NSString stringWithFormat:@"%ld 提问",(NSInteger)model.questionCount];
    return cquestion;
}

-(NSString *)getexperIDForRow:(NSInteger )row{
    QuestionDataExpertListModel *model = self.dataArr[row];
    return model.expertId;
}

-(void)getDataCompleteHandle:(void(^)(NSError *error))complete{
    
    [TopicsNetManager getTopicsFromBeginIndex:_index andPage:_pageNumber completeHandle:^(QuestionModel *model, NSError *error) {
        if (_index == 0) {
            [self.dataArr removeAllObjects];
        }
        QuestionDataModel *qModel = model.datas;
        [self.dataArr addObjectsFromArray:qModel.expertList];
        complete(error);
    }];
}

-(void)getTopicsDataCompleteHandle:(void(^)(NSError *error))complete{
    _index = 0;
    _pageNumber = 10;
    [self getDataCompleteHandle:complete];
    
}

-(void)getMoreTopcisDataCompleteHandle:(void (^)(NSError *))complete{
    _index += 10;
    [self getDataCompleteHandle:complete];
}


@end








































