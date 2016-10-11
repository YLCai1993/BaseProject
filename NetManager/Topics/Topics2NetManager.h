//
//  Topics2NetManager.h
//  BaseProject
//
//  Created by YLCai on 16/9/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TpoicsChannelModel.h"
#import "TopicsModel.h"

@interface Topics2NetManager : BaseNetManager

+(id)getTopicsChannelFromType:(NSString *)type completeHandle:(void(^)(TpoicsChannelModel *model ,NSError *error))completeHandle;

+(id)getTopicsFromStart:(NSInteger )start andPage:(NSInteger )page completeHandle:(void(^)(TopicsModel *model ,NSError *error))completeHandle;

@end
