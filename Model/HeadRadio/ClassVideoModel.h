//
//  ClassVideoModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface ClassModel : BaseModel

@property(nonatomic,strong)NSArray *classModels;

@end

@interface ClassVideoModel : BaseModel

@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL visible;

@end