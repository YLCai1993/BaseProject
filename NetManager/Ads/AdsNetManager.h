//
//  AdsNetManager.h
//  BaseProject
//
//  Created by YLCai on 16/9/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "NormalAdsModel.h"
#import "AdsModel.h"

@interface AdsNetManager : BaseNetManager

+(id)getAdsForm:(NSString *)type completeHandle:(void(^)(AdsModel *model ,NSError *error))completeHandle;

+(id)getNormalAdsForm:(NSString *)ID completeHandle:(void(^)(NormalAdsModel *model ,NSError *error))completeHandle;
@end
