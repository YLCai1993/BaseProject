//
//  VideoViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "VideoNetManager.h"

@interface VideoViewModel : BaseViewModel

-(instancetype)initWithRoomID:(NSString *)roomID iszhiBo:(BOOL)zhiBo;
@property(nonatomic,strong)NSString *roomID;
@property(nonatomic,assign)BOOL isZhiBo;

-(NSString *)getURL;
-(NSInteger )rowNumber;
-(NSString *)getSectionViewForSection:(NSInteger )section;
-(NSString *)getHeadImagURLForRow:(NSInteger )section;
-(NSString *)getTitleForRow:(NSInteger)section;
-(NSString *)getContentForRow:(NSInteger)section;
-(NSInteger )cellHeightForSection:(NSInteger)section;
-(NSArray *)contentPictureForSection:(NSInteger )section;

-(void)getdataCompleteHandle:(void(^)(NSError *error))complete;
-(void)getMoreDataCompleteHandle:(void(^)(NSError *error))complete;



@end
