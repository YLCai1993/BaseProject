//
//  AlbumNetManager.h
//  BaseProject
//
//  Created by YLCai on 16/9/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "AlbumModels.h"

@interface AlbumNetManager : BaseNetManager

+(id)getBeautifulWomanWithPage:(NSInteger )page cpmpletionHandle:(void(^)(AlbumModels *model,NSError *error))complete;


@end

