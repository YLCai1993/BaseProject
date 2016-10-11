//
//  AdsViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "AdsNetManager.h"

@interface AdsViewModel : BaseViewModel

@property(nonatomic,strong)adsClassModel *model;
@property(nonatomic,strong)NormalAdsModel *normalModel;

-(instancetype)initWithType:(NSString *)type andTag:(NSString *)tag;
@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSString *tag;

-(void)getAdsModelCompleteHandle:(void(^)(NSError *))complete;
/** 获取图片信息 */
-(NSArray *)getImages;

/** 获取标题 */
-(NSString *)getTitle;

/** 获取详细信息 */
-(NSArray *)getDetail;

/** 获取图片数量*/
-(NSInteger )getImageCount;

/*  获取时间 */
-(NSString *)getSourceAndTime;

@end
