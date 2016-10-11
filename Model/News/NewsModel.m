//
//  NewsModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

+(NSDictionary *)objectClassInArray{
 
    return @{
             @"tid":[TidNewsModel class],
             };
}


@end

@implementation AdsNewsModel

-(instancetype)initWithTitle:(NSString *)title andURL:(NSString *)url{
    if (self = [super init]) {
        _title = title;
        _imgsrc = url;
    }
    return self;
}

@end

@implementation TidNewsModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"tAG":@"TAG",
             @"tAGS":@"TAGS"
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"ads":[AdsNewsModel class],
             @"imgnewextra":[ImgnewextraNewsModel class]
             };
}

@end

@implementation VideoinfoNewsModel

+(NSDictionary *)objectClassInArray{
    return @{
             @"videoTopic":[VideoTopicNewsModel class]
             };
}

@end

@implementation VideoTopicNewsModel


@end

@implementation LiveInfoNewsModel


@end

@implementation ImgnewextraNewsModel


@end
