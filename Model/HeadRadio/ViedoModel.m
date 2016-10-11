//
//  ViedoModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ViedoModel.h"

@implementation ViedoModel

+(NSDictionary *)objectClassInArray{
    return @{
             @"mutilVideo":[VideoMutilVideoModel class],
             @"video":[ViedoVideoModel class],
             @"messages":[VideoMessagesModel class]
             
             };
}

@end

@implementation VideoMessagesModel

+(NSDictionary *)objectClassInArray{
    return @{
             @"images":[VideoMessageImagesModel class],
             };
}

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"video1":@"video"
             };
}

@end

@implementation VideoMessagesCommentatorModel


@end

@implementation VideoMessagesVideoModel


@end

@implementation VideoMessagesMsgModel

@end


@implementation VideoMessageImagesModel


@end

@implementation ViedoVideoModel

@end

@implementation VideoMutilVideoModel


@end