//
//  DetailNormalViewController.m
//  BaseProject
//
//  Created by YLCai on 16/9/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailNormalViewController.h"
#import "ScrollDisplayViewController.h"
#import <UIImageView+WebCache.h>
#import "AdsViewModel.h"

@interface DetailNormalViewController ()

@property(nonatomic,assign)CGFloat oriX;

@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)AdsViewModel *adsVm;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)ScrollDisplayViewController *sdVC;

@end

@implementation DetailNormalViewController

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
        _scrollView.backgroundColor = [UIColor whiteColor];
    }
    return _scrollView;
}

-(AdsViewModel *)adsVm{
    if (!_adsVm) {
        _adsVm = [[AdsViewModel alloc] initWithType:_docId andTag:@"doc"];
    }
    return _adsVm;
}


-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont systemFontOfSize:20];
    }
    return _titleLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.contentSize = CGSizeMake(self.view.width, self.view.height*2);
    [self.view addSubview:self.scrollView];
    
    [self getData];
}

-(void)getData{
    [self.adsVm getAdsModelCompleteHandle:^(NSError *error) {
        [self showTitle];
        [self showContent];
        if (error) {
            NSLog(@"error:%@",error);
        }
    }];
}

-(void)showTitle{
    CGFloat originX = 0;
    self.titleLabel.text = [self.adsVm getTitle];
    CGFloat textH = [self.titleLabel.text boundingRectWithSize:CGSizeMake(self.view.width-20 , MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:20]} context:nil].size.height;
    self.titleLabel.frame = CGRectMake(10, 20, self.view.width-20, textH);
    [self.scrollView addSubview:self.titleLabel];
    
    originX = 20 + textH + 10;
    
    UILabel *fromLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, originX, self.view.width-20, 20)];
    fromLabel.text = [self.adsVm getSourceAndTime];
    fromLabel.font = [UIFont systemFontOfSize:13];
    fromLabel.textColor = [UIColor grayColor];
    [self.scrollView addSubview:fromLabel];

    originX = originX + 10 + 20 +10;
    self.oriX =  originX;
}

-(void)showContent{
    CGFloat originX = self.oriX;
    NSArray *detailCount = [self.adsVm getDetail];
    NSArray *imgURLCount = [self.adsVm getImages];

    if (detailCount.count > imgURLCount.count) {
        for (NSInteger i = 0; i<imgURLCount.count; i++) {
            UILabel *detail = [[UILabel alloc] init];
            detail.text = detailCount[i];
            detail.numberOfLines = 0;
            CGFloat textH = [detail.text boundingRectWithSize:CGSizeMake(self.view.width-20 , MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil].size.height;
            detail.frame = CGRectMake(10, originX, self.view.width-20, textH);
            [self.scrollView addSubview:detail];
            originX = originX + 20 + textH;
            
            UIImageView *imageView = [[UIImageView alloc] init];
            [imageView sd_setImageWithURL:imgURLCount[i]];
            imageView.frame = CGRectMake(10, originX, self.view.width-20, 200);
            [self.scrollView addSubview:imageView];
            originX = originX + 20 + 200;
        }
          NSInteger index= imgURLCount.count;
        //完成剩余文字的排布
        for (NSInteger i = index; i<detailCount.count; i++) {
            UILabel *detail = [[UILabel alloc] init];
            detail.text = detailCount[i];
            detail.numberOfLines = 0;
            CGFloat textH = [detail.text boundingRectWithSize:CGSizeMake(self.view.width-20 , MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil].size.height;
            detail.frame = CGRectMake(10, originX, self.view.width-20, textH);
            [self.scrollView addSubview:detail];
            originX = originX + 20 + textH;
        }
    }else{
        for (NSInteger i = 0; i<detailCount.count; i++) {
            UILabel *detail = [[UILabel alloc] init];
            detail.text = detailCount[i];
            detail.numberOfLines = 0;
            CGFloat textH = [detail.text boundingRectWithSize:CGSizeMake(self.view.width-20 , MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil].size.height;
            detail.frame = CGRectMake(10, originX, self.view.width-20, textH);
            [self.scrollView addSubview:detail];
            originX = originX + 20 + textH;
            
            UIImageView *imageView = [[UIImageView alloc] init];
            [imageView sd_setImageWithURL:imgURLCount[i]];
            imageView.frame = CGRectMake(10, originX, self.view.width-20, 200);
            [self.scrollView addSubview:imageView];
            originX = originX + 20 + 200;
        }
        NSInteger index= detailCount.count;
        //完成剩余图片的排布
        for (NSInteger i = index; i<imgURLCount.count; i++){
            UIImageView *imageView = [[UIImageView alloc] init];
            [imageView sd_setImageWithURL:imgURLCount[i]];
            imageView.frame = CGRectMake(10, originX, self.view.width-20, 200);
            [self.scrollView addSubview:imageView];
            originX = originX + 20 + 200;
        }
    }
    self.scrollView.contentSize = CGSizeMake(self.view.width, originX);
}

@end




