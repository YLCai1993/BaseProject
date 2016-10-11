//
//  ClassVideNetManager.h
//  BaseProject
//
//  Created by YLCai on 16/9/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "ClassVideoModel.h"
#import "HeadRadioModel.h"

@interface ClassVideNetManager : BaseNetManager

//获取channel信息
+(id)getClassfiyFormType:(NSString *)type completeHandle:(void(^)(ClassModel *model,NSError *err))completeHandle;

+(id)getClassItemFromID:(NSInteger )ID andPage:(NSInteger )page completeHandle:(void(^)(HeadRadioModel *model,NSError *err))completeHandle;
@end
