//
//  TuWanImageCell.m
//  BaseProject
//
//  Created by YLCai on 16/10/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanImageCell.h"

@implementation TuWanImageCell

-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:17];
    }
    return _titleLb;
}

-(UILabel *)clicksNumLb{
    if (!_clicksNumLb) {
        _clicksNumLb = [[UILabel alloc] init];
        _clicksNumLb.textAlignment = NSTextAlignmentRight;
        _clicksNumLb.font = [UIFont systemFontOfSize:12];
        _clicksNumLb.textColor = [UIColor lightGrayColor];
    }
    return _clicksNumLb;
}

-(YLImageView *)iconIV0{
    if (!_iconIV0) {
        _iconIV0 = [[YLImageView alloc] init];
//        _iconIV0.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconIV0;
}

-(YLImageView *)iconIV1{
    if (!_iconIV1) {
        _iconIV1 = [[YLImageView alloc] init];
//        _iconIV1.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconIV1;
}

-(YLImageView *)iconIV2{
    if (!_iconIV2) {
        _iconIV2 = [[YLImageView alloc] init];
//        _iconIV2.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconIV2;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.clicksNumLb];
        [self.contentView addSubview:self.iconIV0];
        [self.contentView addSubview:self.iconIV1];
        [self.contentView addSubview:self.iconIV2];
        
        /**   题目  左上10 右10 */
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.right.mas_equalTo(_clicksNumLb.mas_left).mas_equalTo(-10);
        }];
        
        /**  点击数 上右10像素 宽度最大70像素 最小40像素  */
        [self.clicksNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.width.mas_greaterThanOrEqualTo(40);
            make.width.mas_lessThanOrEqualTo(70);
        }];
        
        /*   图片:宽高相等 间距5，   边缘:10  高度:88 */
        [self.iconIV0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(88);
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(_titleLb.mas_bottom).mas_equalTo(5);
        }];
        
        [self.iconIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_iconIV0);
            make.left.mas_equalTo(_iconIV0.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(_iconIV0);
        }];
        
        [self.iconIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_iconIV0);
            make.topMargin.mas_equalTo(_iconIV0);
            make.left.mas_equalTo(_iconIV1.mas_right).mas_equalTo(5);
            make.right.mas_equalTo(-10);
        }];
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
