//
//  TuWanPicViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanNetManager.h"

@interface TuWanPicViewModel : BaseViewModel

/** 必须使用以下方法初始化*/
-(id)initWithAid:(NSString *)aid;

/** aid的赋值应该是非空，使用xcode7新加入的非空标示 */
@property(nonatomic,strong)NSString *aid;

@property(nonatomic,assign)NSInteger rowNumber;

-(NSURL *)picURLForRow:(NSInteger )row;
@property(nonatomic,strong)TuWanPicModel *picModel;

@end
