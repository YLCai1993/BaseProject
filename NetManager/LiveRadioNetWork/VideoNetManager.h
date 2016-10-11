//
//  VideoNetManager.h
//  BaseProject
//
//  Created by YLCai on 16/9/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "ViedoModel.h"

@interface VideoNetManager : BaseNetManager

+(id)getRadioFromRoomID:(NSString *)roomID andPage:(NSInteger )page completeHandle:(void(^)(ViedoModel *model,NSError *error))completeHandle;

@end
