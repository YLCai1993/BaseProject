//
//  NormalAdsModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface NormalAdsModel : BaseModel

@property (nonatomic, strong) NSString *setname;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *scover;
@property (nonatomic, strong) NSString *creator;
@property (nonatomic, strong) NSString *neteasecode;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *clientadurl;
@property (nonatomic, strong) NSString *reporter;
@property (nonatomic, strong) NSString *postid;
@property (nonatomic, strong) NSArray *relatedids;
@property (nonatomic, strong) NSString *cover;
@property (nonatomic, strong) NSString *settag;
@property (nonatomic, strong) NSString *imgsum;
@property (nonatomic, strong) NSString *commenturl;
@property (nonatomic, strong) NSArray *photos;
@property (nonatomic, strong) NSString *tcover;
@property (nonatomic, strong) NSString *createdate;
@property (nonatomic, strong) NSString *series;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *datatime;
@property (nonatomic, strong) NSString *autoid;
@property (nonatomic, strong) NSString *boardid;

@end

@interface NorMalAdsPhotoModel : BaseModel

@property (nonatomic, strong) NSString *imgurl;
@property (nonatomic, strong) NSString *photoid;
@property (nonatomic, strong) NSString *note;
@property (nonatomic, strong) NSString *timgurl;
@property (nonatomic, strong) NSString *simgurl;
@property (nonatomic, strong) NSString *imgtitle;
@property (nonatomic, strong) NSString *newsurl;
@property (nonatomic, strong) NSString *photohtml;
@property (nonatomic, strong) NSString *squareimgurl;
@property (nonatomic, strong) NSString *cimgurl;

@end







