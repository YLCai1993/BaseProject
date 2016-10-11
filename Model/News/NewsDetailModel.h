//
//  NewsDetailModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class NewsDetailInfoModel,NewsDetailInfoTopicDocPixelFutureModel;

@interface NewsDetailModel : BaseModel

@property(nonatomic,strong)NewsDetailInfoModel *infoModel;

@end

@interface NewsDetailInfoModel : BaseModel

@property (nonatomic, strong) NSString *ptime;
@property (nonatomic, assign) id webviews;
@property (nonatomic, strong) NSArray *topicspatch;
@property (nonatomic, strong) NSString *ec;
@property (nonatomic, strong) NSString *sdocid;
@property (nonatomic, assign) double del;
@property (nonatomic, strong) NSString *lmodify;
@property (nonatomic, strong) NSString *imgsrc;
@property (nonatomic, strong) NSArray *topicslatest;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSArray *topicsplus;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *sid;
@property (nonatomic, strong) NSString *photoset;
@property (nonatomic, strong) NSArray *headpics;
@property (nonatomic, strong) NSString *banner;
@property (nonatomic, strong) NSString *sname;
@property (nonatomic, strong) NSString *shownav;
@property (nonatomic, strong) NSArray *topics;
@property (nonatomic, strong) NSString *digest;

@end

@interface NewsDetailInfoTopicModel : BaseModel

@property (nonatomic, strong) NSString *tname;
@property (nonatomic, strong) NSArray *docs;
@property (nonatomic, strong) NSString *shortname;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) double index;

@end

@interface NewsDetailInfoTopicDocModel : BaseModel

@property (nonatomic, strong) NSString *ptime;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSArray *imgextra;
@property (nonatomic, strong) NSString *photosetID;
@property (nonatomic, strong) NSString *postid;
@property (nonatomic, strong) NSString *lmodify;
@property (nonatomic, strong) NSString *skipType;
@property (nonatomic, strong) NSString *imgsrc;
@property (nonatomic, assign) double votecount;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSString *docid;
@property (nonatomic, assign) double replyCount;
@property (nonatomic, assign) double priority;
@property (nonatomic, strong) NSString *ipadcomment;
@property (nonatomic, strong) NSString *ltitle;
@property (nonatomic, strong) NewsDetailInfoTopicDocPixelFutureModel *pixelFuture;
@property (nonatomic, strong) NSString *skipID;
@property (nonatomic, strong) NSString *boardid;
@property (nonatomic, strong) NSString *digest;

@end

@interface NewsDetailInfoTopicDocImgextraModel : BaseModel
@property (nonatomic, strong) NSString *imgsrc;
@end

@interface NewsDetailInfoTopicDocPixelFutureModel : BaseModel

@property (nonatomic, assign) BOOL done;
@property (nonatomic, assign) BOOL cancelled;

@end




























