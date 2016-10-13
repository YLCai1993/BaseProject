//
//  AlbumModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumModels.h"

@implementation AlbumModels : BaseModel

//特殊规定， data对应的值由特殊类解析
+(NSDictionary *)objectClassInArray{
    return @{
             @"data":[AlbumDataModel class]
             };
}
@end

@implementation AlbumDataModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"desc":@"description"
             };
}


@end
