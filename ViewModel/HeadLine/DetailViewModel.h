//
//  DetailViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "NewsNetManager.h"

@interface DetailViewModel : BaseViewModel

-(instancetype)initWithType:(NSString *)type;
@property(nonatomic,strong)NSString *type;

-(NSString *)getNaviGationname;

-(NSArray *)getClassMessage;

-(NSURL *)getHeaderImageURL;

-(NSInteger)sectionNumber;

-(NSInteger)rowNumberForSection:(NSInteger)section;

-(NSString *)titleForSection:(NSInteger )section;

-(NSString *)titleForIndexPath:(NSIndexPath *)indexPath;

-(NSString *)commentForIndexPath:(NSIndexPath *)indexPath;

-(NSURL *)iconForIndexPath:(NSIndexPath *)indexPath;

-(void)refreshDataCompleteHandle:(void(^)(NSError *error))complete;

@end
