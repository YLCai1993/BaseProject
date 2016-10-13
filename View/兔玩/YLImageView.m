//
//  YLImageView.m
//  BaseProject
//
//  Created by YLCai on 16/10/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YLImageView.h"

@implementation YLImageView

-(instancetype)init{
    if (self = [super init]) {
        _imageView = [UIImageView new];
        [self addSubview:_imageView];
        //按比例方法充满
        _imageView.contentMode = 2;
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        //当视图超出，剪掉超出自身区域的部分
        self.clipsToBounds = YES;
    }
    return self;
}

@end
