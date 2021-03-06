//
//  TuWanViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanViewModel.h"

@implementation TuWanViewModel


-(instancetype)initWithType:(InfoType)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}

/*   预防性变成 防止不使用initWithType初始化  */
-(instancetype)init{
    if (self = [super init]) {
        //如果使用此方法,就崩溃提示
        NSAssert1(NO, @"%s 必须使用initWithType初始化", __func__);
    }
    return self;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [TuWanNetManager getTuWanInfoWithType:_type start:_start completionHandle:^(TuWanModel *model, NSError *error) {
        if (_start == 0) {
            [self.dataArr1 removeAllObjects];
            self.indexPicArr = nil;
        }
        [self.dataArr1 addObjectsFromArray:model.data.list];
        self.indexPicArr = model.data.indexpic;
        completionHandle(error);
    }];
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _start+=10;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(BOOL)isExistIndexPic{
    return self.indexPicArr != nil && self.indexPicArr.count != 0;
}

-(NSInteger)rowNumber{
    return self.dataArr1.count;
}

-(TuWanDataIndexpicModel *)modelForArr:(NSArray *)arr row:(NSInteger)row{
    return arr[row];
}

/*  返回列表中某行数据的题目  */
-(NSString *)titleForRowInList:(NSInteger )row{
    return [self modelForArr:self.dataArr1 row:row].title;
}

/*  返回列表中某行数据的图片  */
-(NSURL *)iconURLForRowInList:(NSInteger )row{
    return [NSURL URLWithString:[self modelForArr:self.dataArr1 row:row].litpic];
}

/*  返回列表中某行数据的描述  */
-(NSString *)descForRowInList:(NSInteger )row{
    return [self modelForArr:self.dataArr1 row:row].longtitle;
}

/*  返回列表中某行数据的浏览人数  */
-(NSString *)clicksForRowInList:(NSInteger )row{
    return [[self modelForArr:self.dataArr1 row:row].click stringByAppendingString:@"人浏览"];
}

/*  滚动展示栏的图片  */
-(NSURL *)iconURLForRowInIndexPic:(NSInteger )row{
    return [NSURL URLWithString:[self modelForArr:self.indexPicArr row:row].litpic];
}

/*  滚动展示栏的文字  */
-(NSString *)titleURLForRowInIndexPic:(NSInteger )row{
    return [self modelForArr:self.indexPicArr row:row].title;
}

/** 滚动展示栏的文字 */
- (NSString *)titleForRowInIndexPic:(NSInteger)row{
    return [self modelForArr:self.indexPicArr row:row].title;
}

/** 获取列表中某行数据对应的html5链接 */
- (NSURL *)detailURLForRowInList:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.dataArr1 row:row].html5];
}
/** 获取展示栏中某行数据对应的html5链接 */
- (NSURL *)detailURLForRowInIndexPic:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.indexPicArr row:row].html5];
}

/** 通过行数 返回此行中对应的链接数组  */
-(NSArray *)iconURLSForRow:(NSInteger )row{
    NSArray *arr = [self modelForArr:self.dataArr1 row:row].showitem;
    NSMutableArray *array = [NSMutableArray new];
    for (NSInteger i = 0; i<arr.count; i++) {
        TuWanDataIndexpicShowitemModel *model = arr[i];
        [array addObject:[NSURL URLWithString:model.pic]];
    }
    return [array copy];
}

-(NSInteger)indexPicNumber{
    return self.indexPicArr.count;
}

-(BOOL)containImages:(NSInteger)row{
    return [[self modelForArr:self.dataArr1 row:row].showtype isEqualToString:@"1"];
}

/** 判断当前数据类型时视频 video*/
-(BOOL )isVideoInListForRow:(NSInteger )row{
    return [[self modelForArr:self.dataArr1 row:row].type isEqualToString:@"video"];
}

-(BOOL )isVideoInIndexPicForRow:(NSInteger )row{
    return [[self modelForArr:self.indexPicArr row:row].type isEqualToString:@"video"];
}

/** 判断当前数据类型时图片 pic*/
-(BOOL )isPicInListForRow:(NSInteger )row{
    return [[self modelForArr:self.dataArr1 row:row].type isEqualToString:@"pic"];
}
-(BOOL )isPicInIndexPicForRow:(NSInteger )row{
    return [[self modelForArr:self.indexPicArr row:row].type isEqualToString:@"pic"];
}

/** 判断当前数据类型时Html all*/
-(BOOL )isHtmlInListForRow:(NSInteger )row{
    return [[self modelForArr:self.dataArr1 row:row].type isEqualToString:@"all"];
}
-(BOOL )isHtmlInIndexPicForRow:(NSInteger )row{
    return [[self modelForArr:self.indexPicArr row:row].type isEqualToString:@"all"];
}

/** 返回某行数据的Aid  */
-(NSString *)aidInListForRow:(NSInteger )row{
    return [self modelForArr:self.dataArr1 row:row].aid;
}
-(NSString *)aidInIndexPicForRow:(NSInteger )row{
    return [self modelForArr:self.indexPicArr row:row].aid;
}

@end
