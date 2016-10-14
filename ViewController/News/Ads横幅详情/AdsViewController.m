//
//  AdsViewController.m
//  BaseProject
//
//  Created by YLCai on 16/9/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AdsViewController.h"
#import "ScrollDisplayViewController.h"
#import "AdsdetailView.h"
#import "AdsViewModel.h"
#import "InputText.h"

@interface AdsViewController ()<scrollDisplayViewControllerDelegate>

@property(nonatomic,strong)AdsViewModel *adsVM;
@property(nonatomic,strong)ScrollDisplayViewController *sdVC;
@property(nonatomic,strong)NSString *DetailTitle;
@property(nonatomic,strong)AdsdetailView *AdsView;
@property(nonatomic,assign)NSInteger index;

@end

@implementation AdsViewController

-(void)scrollDisplayViewController:(ScrollDisplayViewController *)scrollDisplayViewController currentIdenx:(NSInteger)index{
    self.index = index + 1;
    [self getData];
}

-(AdsViewModel *)adsVM{
    if (!_adsVM) {
        _adsVM = [[AdsViewModel alloc] initWithType:_type andTag:_tag];
    }
    return _adsVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.adsVM getAdsModelCompleteHandle:^(NSError *error) {
        _sdVC = [[ScrollDisplayViewController alloc] initWithImgPaths:[self.adsVM getImages]];
        _sdVC.canCycle = NO;
        _sdVC.autoCycle = NO;
        _sdVC.delegate = self;
        _sdVC.showPageControl = NO;
        [self addChildViewController:_sdVC];
        _sdVC.view.backgroundColor = [UIColor whiteColor];
        _sdVC.view.frame = CGRectMake(0, 160, self.view.width, 250);
        
        self.AdsView.titleLabel.text = [self.adsVM getTitle];
        self.index = 1;
        [self getData];
        [self.view addSubview:_sdVC.view];
   
    }];

    self.view.backgroundColor = [UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:0.9];
    
    /*  配置返回按钮  */
    [self configbackButton];
    
    /*  配置详细信息  */
    [self confiDetailMessage];
    
    /** 配置评论输入框 */
    [self configInputTextView];
    
    /**  配置右上角评论数按钮 */
    [self configCommentView];
}

-(void)getData{

    self.AdsView.currentPage.text = [NSString stringWithFormat:@"%ld/%ld",self.index,[self.adsVM getImageCount]];
       self.AdsView.contentLabel.text = [NSString stringWithFormat:@"%@",[self.adsVM getDetail][self.index-1]];
    
      CGFloat textH = [ self.AdsView.contentLabel.text boundingRectWithSize:CGSizeMake(self.view.width-20 , MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size.height;
    CGFloat height = textH + 20 +21 +20;
    [self.AdsView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.view.width, height));
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-45);
    }];
}

-(void)configCommentView{
    UIButton *button = [UIButton buttonWithType:0];
    button.backgroundColor = [UIColor redColor];
    button.layer.cornerRadius = 10;
    button.layer.masksToBounds = YES;
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitle:[NSString stringWithFormat:@"%d跟帖",arc4random_uniform(10000)] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(40);
        make.right.mas_equalTo(-20);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    
}

-(void)configbackButton{
    UIButton *backBtn = [UIButton buttonWithType:0];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"top_navigation_back"] forState:UIControlStateNormal];
    backBtn.layer.cornerRadius = 40/2;
    [backBtn bk_addEventHandler:^(id sender) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40,40));
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(30);
    }];
}

-(void)confiDetailMessage{
    AdsdetailView *view = [[NSBundle mainBundle] loadNibNamed:@"AdsdetailView" owner:nil options:nil].firstObject;
    self.AdsView = view;
    view.alpha = 0.6;
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.view.width, 115));
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-45);
    }];
}

-(void)configInputTextView{
    InputText *inputView = [[NSBundle mainBundle] loadNibNamed:@"InputText" owner:nil options:nil].firstObject;
    inputView.alpha = 0.7;
    [self.view addSubview:inputView];
    [inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(45);
    }];
}

@end


































