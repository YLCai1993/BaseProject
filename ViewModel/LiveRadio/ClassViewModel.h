//
//  ClassViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "ClassVideNetManager.h"

@interface ClassViewModel : BaseViewModel

-(instancetype)initWithType:(NSString *)type;
@property(nonatomic,strong)NSString *type;
@property(nonatomic,assign)NSInteger ID;  //传入的类型的ID

-(NSArray *)getnames;
-(NSArray *)getIds;
-(NSInteger)rowNumber;
-(NSInteger)getRoomIDForRow:(NSInteger)row;
-(NSString *)getRoomNameForRow:(NSInteger )row;
-(BOOL )isZhiBoForRow:(NSInteger )row;
-(NSString *)apartiNumberForRow:(NSInteger )row;
-(NSString *)getBgImageForRow:(NSInteger)row;
//-(bool)

//获取tableHeaderView数据
-(void)getChannelDataCompleteHandle:(void(^)(NSError *error))complete;

//表头刷新
-(void)getTableViewDataCompleteHandle:(void(^)(NSError *error))complete;

//下拉刷新
-(void)getMoreDataCompleteHandle:(void(^)(NSError *error))complete;

@end
