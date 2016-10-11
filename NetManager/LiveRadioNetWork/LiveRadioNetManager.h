//
//  LiveRadioNetManager.h
//  BaseProject
//
//  Created by YLCai on 16/9/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "HeadRadioModel.h"

@interface LiveRadioNetManager : BaseNetManager

+(id)getRadioListFromType:(NSString *)type completeHandle:(void(^)(HeadRadioModel *model,NSError *error))completeHandle;

@end
