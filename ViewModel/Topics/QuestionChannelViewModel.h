//
//  QuestionChannelViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface QuestionChannelViewModel : BaseViewModel

-(NSArray *)getItemsPcitureURL;
-(NSArray *)getItemsNames;

-(void)getChannelDataCompleteHandle:(void(^)(NSError *))complete;

@end
