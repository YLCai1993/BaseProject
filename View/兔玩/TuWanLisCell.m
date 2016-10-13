//
//  TuWanLisCell.m
//  BaseProject
//
//  Created by YLCai on 16/10/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanLisCell.h"

@implementation TuWanLisCell

-(YLImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [[YLImageView alloc] init];
        //内容模式：保持比例,填充满
//        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconIV;
}

-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:17];
    }
    return _titleLb;
}

-(UILabel *)longTitleLb{
    if (!_longTitleLb) {
        _longTitleLb = [[UILabel alloc] init];
        _longTitleLb.font = [UIFont systemFontOfSize:14];
        _longTitleLb.numberOfLines = 0;
        _longTitleLb.textColor = [UIColor lightGrayColor];
    }
    return _longTitleLb;
}

-(UILabel *)clicksNumLb{
    if (!_clicksNumLb) {
        _clicksNumLb = [[UILabel alloc] init];
        _clicksNumLb.font = [UIFont systemFontOfSize:12];
        _clicksNumLb.textColor = [UIColor lightGrayColor];
    }
    return _clicksNumLb;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.longTitleLb];
        [self.contentView addSubview:self.clicksNumLb];
        
        //图片 左10 宽高 92 ＊ 70
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(92, 70));
            make.centerY.mas_equalTo(0);
        }];
        
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_iconIV.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(_iconIV.mas_topMargin).mas_equalTo(3);
        }];
        
        //长题目，左右边缘与题目一样，上边具体题目下边8像素
        [self.longTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_titleLb.mas_leftMargin);
            make.rightMargin.mas_equalTo(_titleLb.mas_rightMargin);
            make.top.mas_equalTo(_titleLb.mas_bottom).mas_equalTo(8);
        }];
        
        //点击数，下边元于图片对其，右边缘与任意title对其
        [self.clicksNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(_iconIV.mas_bottomMargin);
            make.rightMargin.mas_equalTo(_titleLb.mas_rightMargin);
            
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
    // Configure the view for the selected state
}

@end





















