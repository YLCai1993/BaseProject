//
//  ClassViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ClassViewModel.h"

@interface ClassViewModel()

@property(nonatomic,strong)ClassModel *classModel;
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,strong)HeadRadioModel *tableViewModel;
@property(nonatomic,strong)NSMutableArray *modelArr;

@end

@implementation ClassViewModel

-(NSMutableArray *)modelArr{
    if (!_modelArr) {
        _modelArr = [NSMutableArray new];
    }
    return _modelArr;
}

-(instancetype)initWithType:(NSString *)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}

-(NSArray *)getnames{
    NSMutableArray *arr = [NSMutableArray new];
    for (ClassVideoModel *model in self.classModel.classModels) {
        [arr addObject:model.name];
    }
    return arr;
}

-(NSArray *)getIds{
    NSMutableArray *arr = [NSMutableArray new];
    for (ClassVideoModel *model in self.classModel.classModels) {
        [arr addObject:[NSString stringWithFormat:@"%ld",model.ID]];
    }
    return arr;
}

-(void)getChannelDataCompleteHandle:(void (^)(NSError *))complete{
    [ClassVideNetManager getClassfiyFormType:nil completeHandle:^(ClassModel *model, NSError *error) {
        self.classModel = model;
        complete(error);
    }];
}

//获取行数
-(NSInteger)rowNumber{
//    NSLog(@"count:%ld",self.modelArr.count);
    return self.modelArr.count;
}

-(NSString *)getRoomNameForRow:(NSInteger )row{
    HeadLiveReviewModel *model = self.modelArr[row];
    return model.roomName;
}
-(NSInteger)getRoomIDForRow:(NSInteger)row{
     HeadLiveReviewModel *model = self.modelArr[row];
    return (NSInteger)model.roomId;
}

-(BOOL )isZhiBoForRow:(NSInteger )row{
    HeadLiveReviewModel *model = self.modelArr[row];
    return model.video;
}
-(NSString *)apartiNumberForRow:(NSInteger )row{
    HeadLiveReviewModel *model = self.modelArr[row];
    NSInteger count = (NSInteger)model.userCount;
    return count>10000 ? [NSString stringWithFormat:@"%lf万参与",count/10000.0] : [NSString stringWithFormat:@"%ld参与",count];
}

-(NSString *)getBgImageForRow:(NSInteger)row{
    HeadLiveReviewModel *model = self.modelArr[row];
    return model.image;
}

-(void)getDataFormCompleteHandle:(void(^)(NSError *error))complete{
    if (_page != 0) {
//        NSLog(@"ID:%ld page:%ld",_ID,_page);
        [ClassVideNetManager getClassItemFromID:_ID andPage:_page completeHandle:^(HeadRadioModel *model, NSError *err) {
            self.tableViewModel = model;
            if (_page == 1) {
                [self.modelArr removeAllObjects];
            }
            [self.modelArr addObjectsFromArray:model.review];
            _page = (NSInteger)model.nextPage;
            complete(err);
        }];
    }else{
        NSLog(@"无更多数据");
    }
}

//首次刷新
-(void)getTableViewDataCompleteHandle:(void(^)(NSError *error))complete{
    _page = 1;
    [self getDataFormCompleteHandle:complete];
}

-(void)getMoreDataCompleteHandle:(void(^)(NSError *error))complete{
    [self getDataFormCompleteHandle:complete];
}

@end
















