//
//  NewsModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class VideoinfoNewsModel,VideoTopicNewsModel,LiveInfoNewsModel;

@interface NewsModel : BaseModel

@property(nonatomic,strong)NSArray *tid;

@end

@interface AdsNewsModel : BaseModel

@property (nonatomic, strong) NSString *imgsrc;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSString *subtitle;

-(instancetype)initWithTitle:(NSString *)title andURL:(NSString *)url;

@end

@interface TidNewsModel : BaseModel

@property (nonatomic, strong) NSString *tidIdentifier;
@property (nonatomic, strong) NSArray *unlikeReason;//
@property (nonatomic, assign) double imgType;
@property (nonatomic, assign) double replyCount;
@property (nonatomic, strong) NSString *lmodify;
@property (nonatomic, strong) NSString *prompt;
@property (nonatomic, assign) double picCount;
@property (nonatomic, strong) NSString *ptime;
@property (nonatomic, strong) NSString *recSource;
@property (nonatomic, strong) NSString *videoID;  //
@property (nonatomic, assign) double hasHead;
@property (nonatomic, strong) NSString *specialID;//
@property (nonatomic, strong) NSString *digest;
@property (nonatomic, strong) NSString *template;
@property (nonatomic, assign) double hasAD;
@property (nonatomic, strong) NSString *skipType;
@property (nonatomic, assign) double recType;
@property (nonatomic, strong) NSString *recprog;
@property (nonatomic, strong) NSString *imgsrc;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) VideoinfoNewsModel *videoinfo;
@property (nonatomic, assign) double downTimes;
@property (nonatomic, assign) double clkNum;
@property (nonatomic, strong) NSString *boardid;//
@property (nonatomic, assign) double adtype;
@property (nonatomic, strong) NSString *interest;
@property (nonatomic, strong) NSString *docid;  //
@property (nonatomic, strong) NSString *tAG;
@property (nonatomic, strong) NSArray *imgnewextra;    //存储一个内容的三张图片
@property (nonatomic, strong) LiveInfoNewsModel *liveInfo;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, assign) double upTimes;
@property (nonatomic, strong) NSArray *ads;
@property (nonatomic, strong) NSString *recReason;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *tAGS;
@property (nonatomic, strong) NSString *program;
@property (nonatomic, strong) NSString *replyid;//
@property (nonatomic, strong) NSString *skipID; //

@end

@interface VideoinfoNewsModel : BaseModel

@property (nonatomic, strong) NSString *ptime;
@property (nonatomic, strong) NSString *videosource;
@property (nonatomic, strong) NSString *topicImg;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *sectiontitle;
@property (nonatomic, strong) NSString *m3u8Url;
@property (nonatomic, strong) NSString *vid;
@property (nonatomic, strong) NSString *topicSid;
@property (nonatomic, assign) double playersize;
@property (nonatomic, strong) NSString *topicName;
@property (nonatomic, assign) double replyCount;
@property (nonatomic, strong) NSString *replyBoard;
@property (nonatomic, strong) NSString *cover;
@property (nonatomic, assign) double playCount;
@property (nonatomic, assign) double length;
@property (nonatomic, strong) NSString *topicDesc;
@property (nonatomic, strong) NSString *replyid;
@property (nonatomic, strong) VideoTopicNewsModel *videoTopic;
@property (nonatomic, strong) NSString *mp4Url;
@property (nonatomic, strong) NSString *videoinfoDescription;

@end


@interface VideoTopicNewsModel : BaseModel

@property (nonatomic, strong) NSString *tname;
@property (nonatomic, strong) NSString *alias;
@property (nonatomic, strong) NSString *tid;
@property (nonatomic, strong) NSString *ename;

@end

@interface LiveInfoNewsModel : BaseModel

@property (nonatomic, assign) double userCount;
@property (nonatomic, assign) double roomId;
@property (nonatomic, strong) NSString *startTime;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) BOOL video;
@property (nonatomic, strong) NSString *endTime;

@end

@interface ImgnewextraNewsModel : BaseModel

@property(nonatomic,strong)NSString *imgsrc;

@end




























