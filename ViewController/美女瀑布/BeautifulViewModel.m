//
//  BeautifulViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BeautifulViewModel.h"

@implementation BeautifulViewModel

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(NSURL *)iconForRow:(NSInteger)row{
    AlbumDataModel *dataModel = self.dataArr[row];
    return [NSURL URLWithString:dataModel.coverUrl];
    
}

-(void)refreshDataCompletehandle:(void (^)(NSError *))complete{
    self.page = 1;
    [self getDataCompleteHandle:complete];
}

-(void)getMoreBeautifulDataCompletehandle:(void (^)(NSError *))complete{
    self.page ++;
    [self getDataCompleteHandle:complete];
}

-(void)getDataCompleteHandle:(void(^)(NSError *error))complete{
    [AlbumNetManager getBeautifulWomanWithPage:self.page cpmpletionHandle:^(AlbumModels *model, NSError *error) {
        //刷新操作，数组清空掉
        if (self.page == 1) {
            [self.dataArr removeAllObjects];
        }
        
        [self.dataArr addObjectsFromArray:model.data];
        complete(error);
    }];
}
@end


























