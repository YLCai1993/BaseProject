//
//  VideoViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "VideoViewModel.h"

@interface VideoViewModel()

@property(nonatomic,strong)ViedoModel *model;
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,strong)NSMutableArray *messages;
@property(nonatomic,assign)BOOL isOne;

@end

@implementation VideoViewModel

-(instancetype)initWithRoomID:(NSString *)roomID iszhiBo:(BOOL)zhiBo{
    if (self = [super init]) {
        _isOne = YES;
        _roomID = roomID;
        _isZhiBo = zhiBo;
    }
    return self;
}

-(NSString *)getURL{
    if (_isZhiBo) {
        ViedoVideoModel *nowModel = self.model.video;
        return nowModel.videoUrl;
    }else{
        VideoMutilVideoModel *videoURLModel = self.model.mutilVideo[0];
        return videoURLModel.url;
    }
}

-(NSInteger )rowNumber{
    NSArray *arr =_messages;
    return arr.count;
}

-(NSString *)getSectionViewForSection:(NSInteger )section{
    NSArray *arr = _messages;
    VideoMessagesModel *model = arr[section];
    return model.time;
}

-(NSString *)getHeadImagURLForRow:(NSInteger )section{
    NSArray *arr = _messages;
    VideoMessagesModel *model = arr[section];
    VideoMessagesCommentatorModel *comMdeol = model.commentator;
    return comMdeol.imgUrl;;
}
-(NSString *)getTitleForRow:(NSInteger)section{
    NSArray *arr = _messages;
    VideoMessagesModel *model = arr[section];
    VideoMessagesCommentatorModel *comMdeol = model.commentator;
    return comMdeol.name;
}
-(NSString *)getContentForRow:(NSInteger)section{
    NSArray *arr = _messages;
    VideoMessagesModel *model = arr[section];
    VideoMessagesMsgModel *msgModel = model.msg;
    return msgModel.content;;
}

-(NSArray *)contentPictureForSection:(NSInteger )section{
    NSArray *arr = _messages;
    VideoMessagesModel *model = arr[section];
    return model.images;
}

-(NSInteger )cellHeightForSection:(NSInteger)section{
    CGFloat textW = kWindowW - 20;
    NSString *str = [self getContentForRow:section];
    CGFloat textH = [str boundingRectWithSize:CGSizeMake(textW , MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18]} context:nil].size.height;
    NSArray *arr = _messages;
    VideoMessagesModel *model = arr[section];
    CGFloat height = 12 + 20 + 10 + textH + 10;
    switch (model.images.count) {
        case 0:
            
            break;
        case 1:
            height = height + 245 + 15;
            break;
        case 2:
            height = height + 123 + 15;
            break;
        case 3:
            height = height + 82 + 15;
            break;
        case 4:
            height = height + 245 + 15;
            break;
        default:
            break;
    }
    
//    NSLog(@"section:%ld textH:%lf,height:%lf",section,textH,height);
    return height;
}

-(void)getVideoDataCompleteHandle:(void(^)(NSError *error))complete{
    
    [VideoNetManager getRadioFromRoomID:_roomID andPage:_page completeHandle:^(ViedoModel *model, NSError *error) {
        self.model = model;
//        NSLog(@"count:**%ld",model.messages.count);
        if (_page == 0 && _isOne) {
            [_messages removeAllObjects];
            _messages = [NSMutableArray new];
            [_messages addObjectsFromArray:model.messages];
            _isOne = NO;
        }
        _page = (NSInteger)model.nextPage;
//        NSLog(@"page:%f",model.nextPage);
        if(_page != 0 && !_isOne){
            
//            NSLog(@"嗲用");
        [_messages addObjectsFromArray:model.messages];
        }
//        NSLog(@"**%ld",_messages.count);
        complete(error);
    }];
}

-(void)getdataCompleteHandle:(void(^)(NSError *error))complete{
    _page = 0;
    [self getVideoDataCompleteHandle:complete];
}
-(void)getMoreDataCompleteHandle:(void(^)(NSError *error))complete{
    [self getVideoDataCompleteHandle:complete];
}

@end

















