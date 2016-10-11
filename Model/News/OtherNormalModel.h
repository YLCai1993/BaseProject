//
//  OtherNormalModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"
#import "NewsModel.h"

@interface OtherNormalModel : BaseModel

@property (nonatomic, strong) NSArray *classModel;

@end

@interface imgsrcNormalModel : BaseModel

@property (nonatomic, strong) NSString *imgsrc;

@end

@interface classNormalModel : BaseModel

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
@property (nonatomic, strong) NSString *tname;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSArray *imgextra;
@property (nonatomic, strong) NSString *url3w;
@property (nonatomic, strong) NSString *photosetID;
@property (nonatomic, strong) NSString *postid;
@property (nonatomic, assign) double hasImg;
@property (nonatomic, strong) NSString *template1;
@property (nonatomic, assign) double votecount;
@property (nonatomic, strong) NSString *alias;
@property (nonatomic, assign) double priority;
@property (nonatomic, strong) NSString *cid;
@property (nonatomic, assign) BOOL hasCover;
@property (nonatomic, strong) NSString *ltitle;
@property (nonatomic, assign) BOOL hasIcon;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *ename;
@property (nonatomic, assign) double order;

@end



























