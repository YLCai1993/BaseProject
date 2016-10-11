//
//  ViedoModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class VideoMutilVideoModel,ViedoVideoModel,VideoMessagesMsgModel,VideoMessagesVideoModel,VideoMessagesCommentatorModel;

@interface ViedoModel : BaseModel

//@property (nonatomic, strong) ChatConfig *chatConfig;
@property (nonatomic, strong) NSArray *section;
@property (nonatomic, assign) BOOL statExist;
@property (nonatomic, strong) NSArray *messages;
@property (nonatomic, strong) NSArray *commentator;
@property (nonatomic, strong) NSString *roomName;
@property (nonatomic, assign) double roomId;
@property (nonatomic, assign) double nextPage;
@property (nonatomic, strong) NSString *order;
//@property (nonatomic, strong) Banner *banner;
//@property (nonatomic, strong) FloatLayer *floatLayer;
@property (nonatomic, strong) NSArray *mutilVideo;
@property (nonatomic, strong) NSString *endDate;
@property (nonatomic, strong) NSString *startDate;
@property (nonatomic, assign) double duration;
@property (nonatomic, strong) NSString *liveRoomTrigger;
//@property (nonatomic, strong) TopMessage *topMessage;
@property (nonatomic, strong) NSString *chatRoomTrigger;
@property(nonatomic,strong)ViedoVideoModel *video;

@end

@interface VideoMessagesModel : BaseModel

@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, assign) double messagesIdentifier;
@property (nonatomic, strong) NSString *section;
@property (nonatomic, strong) VideoMessagesCommentatorModel *commentator;
@property (nonatomic, strong) VideoMessagesMsgModel *msg;
@property (nonatomic, strong) VideoMessagesVideoModel *video1;
//@property (nonatomic, strong) Quote *quote;

@end


@interface VideoMessagesCommentatorModel : BaseModel

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *imgUrl;

@end

@interface VideoMessagesVideoModel : BaseModel

@property (nonatomic, strong) NSString *videoIdentifier;
@property (nonatomic, strong) NSString *coverImg;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *des;

@end

@interface VideoMessagesMsgModel : BaseModel

@property (nonatomic, strong) NSString *fontType;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *fontColor;
@property (nonatomic, strong) NSString *align;

@end

@interface VideoMessageImagesModel : BaseModel

@property (nonatomic, strong) NSString *href;
@property (nonatomic, strong) NSString *fullSizeSrc;
@property (nonatomic, strong) NSString *src;
@property (nonatomic, strong) NSString *fullSrcSize;

@end




@interface ViedoVideoModel : BaseModel

@property (nonatomic, strong) NSString *videoUrl;
@property (nonatomic, strong) NSString *videoFull;
@property (nonatomic, strong) NSString *panoUrl;
@property (nonatomic, strong) NSString *isPano;

@end

@interface VideoMutilVideoModel : BaseModel

@property (nonatomic, strong) NSString *imgUrl;
@property (nonatomic, strong) NSString *isPano;
@property (nonatomic, strong) NSString *vid;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *panoUrl;
@property (nonatomic, strong) NSString *url1;
@property (nonatomic, strong) NSString *url;

@end






















