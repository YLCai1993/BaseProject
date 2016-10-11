//
//  QuestionChannelViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "QuestionChannelViewModel.h"
#import "TopicsNetManager.h"

@interface QuestionChannelViewModel()

@property(nonatomic,strong)NSMutableArray *itemArray;

@end

@implementation QuestionChannelViewModel

-(NSMutableArray *)itemArray{
    if (!_itemArray) {
        _itemArray = [NSMutableArray new];
    }
    return _itemArray;
}

-(NSArray *)getItemsPcitureURL{
    NSMutableArray *arr = [NSMutableArray new];
    for (QuestionsChannelDataModel *model in self.itemArray) {
        [arr addObject:model.icon];
    }
    return [arr copy];
}

-(NSArray *)getItemsNames{
    NSMutableArray *arr = [NSMutableArray new];
    for (QuestionsChannelDataModel *model in self.itemArray) {
        [arr addObject:model.name];
    }
    return [arr copy];
}

-(void)getDataCompleteHandle:(void(^)(NSError *))complete{
    [TopicsNetManager getTopicsChannelFromType:nil completeHandle:^(QuestionsChannelModel *model, NSError *error) {
        self.itemArray = [model.data copy];
        complete(error);
    }];
}

-(void)getChannelDataCompleteHandle:(void(^)(NSError *))complete{
    [self getDataCompleteHandle:complete];
}

@end






























