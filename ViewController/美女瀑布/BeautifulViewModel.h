//
//  BeautifulViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "AlbumNetManager.h"

@interface BeautifulViewModel : BaseViewModel

//返回多少个
@property(nonatomic,assign)NSInteger rowNumber;

//
-(NSURL *)iconForRow:(NSInteger )row;

/*  获取所有的图片链接  */
-(NSArray *)getAllPictures;

-(void)refreshDataCompletehandle:(void(^)(NSError *error))complete;

-(void)getMoreBeautifulDataCompletehandle:(void(^)(NSError *error))complete;

@property(nonatomic,assign)NSInteger page;

@property(nonatomic,strong)NSMutableArray *dataArr;



@end





































