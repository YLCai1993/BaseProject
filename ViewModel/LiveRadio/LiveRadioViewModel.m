//
//  LiveRadioViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LiveRadioViewModel.h"

@interface LiveRadioViewModel()

@property(nonatomic,strong)HeadRadioModel *model;

@end

@implementation LiveRadioViewModel

-(instancetype)initWithType:(NSString *)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}

-(NSArray *)getHeadURl{
  
    NSMutableArray *topArr = [NSMutableArray new];
    for (HeadTopModel *model in self.model.top) {
        [topArr addObject:model.image];
    }
    return [topArr copy];
}
-(NSArray *)getDetail{
    NSMutableArray *topArr = [NSMutableArray new];
    for (HeadTopModel *model in self.model.top) {
        [topArr addObject:model.roomName];
    }
    return [topArr copy];
}

-(NSInteger )getRowNumber{
     NSArray *arr = self.model.review;
    return arr.count;
}

-(BOOL)isOnlineForRow:(NSInteger)row{
    NSArray *arr = self.model.review;
    HeadLiveReviewModel *model = arr[row];
    return model.video;
}

-(NSString *)getTitleForRow:(NSInteger)row{
    NSArray *arr = self.model.review;
    HeadLiveReviewModel *model = arr[row];
    return model.roomName;
}

-(NSString *)watchingPeopleForRow:(NSInteger)row{
    NSArray *arr = self.model.review;
    HeadLiveReviewModel *model = arr[row];
    NSString *string = [NSString stringWithFormat:@"%.0lf参与",model.userCount];
    return string;
}

-(NSString *)getImagesForRow:(NSInteger)row{
    NSArray *arr = self.model.review;
    HeadLiveReviewModel *model = arr[row];
    return model.image;
}

-(NSInteger )getFutureNumber{
    NSArray *arr = self.model.future;
//    NSLog(@"***%ld",self.model.future.count);
    return arr.count;
}
-(NSString *)getFutureTitleForRow:(NSInteger )row{
    NSArray *arr = self.model.future;
    HeadFutureModel *model = arr[row];
    return model.roomName;
}

-(NSString *)getRoomIDForRow:(NSInteger)row{
    NSArray *arr = self.model.review;
    HeadLiveReviewModel *model = arr[row];
    NSString *roomID = [NSString stringWithFormat:@"%.0lf",model.roomId];
    return roomID;
}

-(NSArray *)getFutureData{
    return self.model.future;
}

-(void)refreshDateCompleteHandle:(void(^)(NSError *))complete{
    [LiveRadioNetManager getRadioListFromType:nil completeHandle:^(HeadRadioModel *model, NSError *error) {
        self.model = model;
        complete(error);
    }];
}

@end
















