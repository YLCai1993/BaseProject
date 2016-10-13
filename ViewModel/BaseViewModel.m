//
//  BaseViewModel.m
//  BaseProject
//
//  Created by YLCai on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"


@implementation BaseViewModel

- (void)cancelTask{
    [self.dataTask cancel];
}

- (void)suspendTask{
    [self.dataTask suspend];
}

- (void)resumeTask{
    [self.dataTask resume];
}

- (NSMutableArray *)dataArr1{
    if (!_dataArr1) {
        _dataArr1 = [NSMutableArray new];
    }
    return _dataArr1;
}

@end
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
