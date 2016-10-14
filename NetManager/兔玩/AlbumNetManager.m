//
//  AlbumNetManager.m
//  BaseProject
//
//  Created by YLCai on 16/9/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumNetManager.h"


//http://box.dwstatic.com/apiAlbum.php?action=l&albumsTag=beautifulWoman&p=1&v=77&OSType=iOS8.2&versionName=2.1.7
@implementation AlbumNetManager

+(id)getBeautifulWomanWithPage:(NSInteger)page cpmpletionHandle:(void (^)(AlbumModels *, NSError *))complete{
    NSString *path = @"http://box.dwstatic.com/apiAlbum.php";
    
    NSDictionary *params = @{
                             @"action":@"l",
                             @"albumsTag":@"beautifulWoman",
                             @"p":@(page),
                             @"v":@"77",
                             @"OSType":@"iOS8.2",
                             @"versionName":@"2.1.7"
                             };
    return [self Get:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        //objectWithKeyValues 解析字典
        complete([AlbumModels objectWithKeyValues:responseObj],error);
    }];
}

@end
