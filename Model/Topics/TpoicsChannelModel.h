//
//  TpoicsChannelModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface TpoicsChannelModel : BaseModel

@property (nonatomic, strong) NSArray *myProperty1;

@end

@interface TpoicsChanneMyPropertylModel : BaseModel

@property (nonatomic, strong) NSString *topicName;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *topicId;
@property (nonatomic, assign) double focusNum;

@end
