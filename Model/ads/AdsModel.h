//
//  AdsModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class adsClassModel,adsClassSourceinfoModel;

@interface AdsModel : BaseModel

@property(nonatomic,strong)adsClassModel *classModel;

@end

@interface adsClassModel : BaseModel

@property (nonatomic, strong) NSString *ptime;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *tid;
@property (nonatomic, strong) NSArray *link;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *boboList;
@property (nonatomic, strong) NSString *articleTags;
@property (nonatomic, strong) NSArray *img;
@property (nonatomic, strong) NSArray *topiclistNews;
@property (nonatomic, assign) BOOL picnews;
@property (nonatomic, strong) NSString *template;
@property (nonatomic, strong) NSString *docid;
@property (nonatomic, strong) NSString *replyBoard;
@property (nonatomic, strong) adsClassSourceinfoModel *sourceinfo;
@property (nonatomic, strong) NSArray *ydbaike;
@property (nonatomic, assign) double replyCount;
@property (nonatomic, assign) BOOL hasNext;
@property (nonatomic, strong) NSArray *topiclist;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, assign) double threadAgainst;
@property (nonatomic, strong) NSArray *votes;
@property (nonatomic, strong) NSArray *huati;
@property (nonatomic, strong) NSString *voicecomment;
@property (nonatomic, strong) NSString *dkeys;
@property (nonatomic, strong) NSString *shareLink;
@property (nonatomic, strong) NSArray *users;
@property (nonatomic, assign) double threadVote;
@property (nonatomic, strong) NSArray *relativeSys;
@property (nonatomic, strong) NSString *digest;

@end

@interface adsClassSourceinfoModel : BaseModel

@property (nonatomic, strong) NSString *tname;
@property (nonatomic, strong) NSString *alias;
@property (nonatomic, strong) NSString *tid;
@property (nonatomic, strong) NSString *ename;

@end

@interface adsClassImgModel : BaseModel

@property (nonatomic, strong) NSString *pixel;
@property (nonatomic, strong) NSString *alt;
@property (nonatomic, strong) NSString *src;
@property (nonatomic, strong) NSString *ref;

@end



















