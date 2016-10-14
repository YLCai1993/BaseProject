//
//  ZBCategoryViewModel.m
//  BaseProject
//
//  Created by YLCai on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBCategoryViewModel.h"

@implementation ZBCategoryViewModel
- (NSInteger)rowNumber{
    return self.dataArr1.count;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask=[DuoWanNetManager getZBCategoryCompletionHandle:^(id model, NSError *error) {
        if (!error) {
            self.dataArr1 = model;
        }
        completionHandle(error);
    }];
}

- (ZBCategoryModel *)modelForRow:(NSInteger)row{
    return self.dataArr1[row];
}

- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].text;
}

- (NSString *)tagForRow:(NSInteger)row{
    return [self modelForRow:row].tag;
}
@end
