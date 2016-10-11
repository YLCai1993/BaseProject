//
//  LiveRadioViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "LiveRadioNetManager.h"

@interface LiveRadioViewModel : BaseViewModel

-(instancetype)initWithType:(NSString *)type;
@property(nonatomic,strong)NSString *type;

-(NSArray *)getHeadURl;
-(NSArray *)getDetail;
-(NSInteger )getRowNumber;
-(NSInteger )getFutureNumber;
-(NSString *)getFutureTitleForRow:(NSInteger )row;
-(BOOL)isOnlineForRow:(NSInteger)row;
-(NSString *)getRoomIDForRow:(NSInteger)row;
-(NSString *)getTitleForRow:(NSInteger)row;
-(NSString *)watchingPeopleForRow:(NSInteger)row;
-(NSString *)getImagesForRow:(NSInteger )row;
-(NSArray *)getFutureData;
-(void)refreshDateCompleteHandle:(void(^)(NSError *))complete;

@end
