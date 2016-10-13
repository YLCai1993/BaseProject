//
//  AlbumModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface AlbumModels : BaseModel

@property(nonatomic,strong)NSArray *data;
@property(nonatomic,strong)NSNumber *pageNum;
@property(nonatomic,strong)NSNumber *pageSize;
@property(nonatomic,strong)NSNumber *totalPage;
@property(nonatomic,strong)NSNumber *totalRecord;

@end

@interface AlbumDataModel : BaseModel

@property(nonatomic,strong)NSString *clicks;
@property(nonatomic,strong)NSString *commentCount;
@property(nonatomic,strong)NSString *coverHeight;
@property(nonatomic,strong)NSString *coverUrl;
@property(nonatomic,strong)NSString *coverWidth;
@property(nonatomic,strong)NSString *created;
@property(nonatomic,strong)NSString *desc;
@property(nonatomic,strong)NSString *destUrl;
@property(nonatomic,strong)NSString *galleryId;
@property(nonatomic,strong)NSString *modify_time;
@property(nonatomic,strong)NSString *picsum;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *updated;


@end
