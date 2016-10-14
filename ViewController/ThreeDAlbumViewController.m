//
//  ThreeDAlbumViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ThreeDAlbumViewController.h"
#import <UIImageView+WebCache.h>
#import "iCarousel.h"

@interface ThreeDAlbumViewController ()<iCarouselDataSource,iCarouselDelegate>

@property(nonatomic,strong)iCarousel *ic;

@end

@implementation ThreeDAlbumViewController

-(iCarousel *)ic{
    if (!_ic) {
        _ic = [iCarousel new];
        _ic.delegate = self;
        _ic.dataSource = self;
        
        /* 设置3D效果 */
        _ic.type = 3;
        
        //自动展示效果，0表示不滚动，越大滚动越快
        _ic.autoscroll = 2;
        
        //竖直方向
        //        _ic.vertical = YES;
        
        //改为翻页模式
        _ic.pagingEnabled = NO;
        
        //滚动速度
        _ic.scrollSpeed = 2;
        
    }
    return _ic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.ic];
    [self.ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    /* 配置自动滚动按钮 */
    [self autoButton];
    
    /*  配置改变显示事模式按钮 */
    [self changeModel];
    
    /*  增加图片 */
    [self addPic];
}

-(void)addPic{
    UIButton *button = [UIButton buttonWithType:0];
    [button setBackgroundImage:[UIImage imageNamed:@"home_channel_bar_add"] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    button.layer.cornerRadius = 22;
    button.layer.masksToBounds = YES;
    [button bk_addEventHandler:^(UIButton *sender) {
        [self.delegate threeDAlbumViewController:self];
        [self.ic reloadData];
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(85);
        make.right.mas_equalTo(-85);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];

}

-(void)changeModel{
    UIButton *changeBtn = [UIButton buttonWithType:0];
    [changeBtn setTitle:@"改变显示方式" forState:UIControlStateNormal];
    [changeBtn setTitle:@"返回原来显示" forState:UIControlStateSelected];
    changeBtn.backgroundColor = [UIColor lightGrayColor];
    changeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    changeBtn.titleLabel.textColor = [UIColor blackColor];
    [self.view addSubview:changeBtn];
    [changeBtn bk_addEventHandler:^(UIButton *sender) {
//        NSLog(@"数量时所杀:%ld",self.pictures.count);
        if (sender.selected) {
            _ic.type = 6;
        }else{
            _ic.type = 3;;
        }
        sender.selected = !sender.selected;
    } forControlEvents:UIControlEventTouchUpInside];
    changeBtn.selected = YES;

    [changeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
         make.top.mas_equalTo(87);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
}

-(void)autoButton{//toolbar_play_n_p
    UIButton *autoBtn = [UIButton buttonWithType:0];
    [autoBtn setBackgroundImage:[UIImage imageNamed:@"toolbar_play_n_p"] forState:UIControlStateNormal];
    [autoBtn setBackgroundImage:[UIImage imageNamed:@"toolbar_pause_n_p"] forState:UIControlStateSelected];
    autoBtn.backgroundColor = [UIColor lightGrayColor];
    autoBtn.layer.cornerRadius = 27;
    autoBtn.layer.masksToBounds = YES;
    [autoBtn bk_addEventHandler:^(UIButton *sender) {
        if (sender.selected) {
             _ic.autoscroll = 1;
        }else{
             _ic.autoscroll = 0;
        }
        sender.selected = !sender.selected;
    } forControlEvents:UIControlEventTouchUpInside];
    autoBtn.selected = YES;
    [self.view addSubview:autoBtn];
    [autoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(80);
        make.right.mas_equalTo(-15);
        make.size.mas_equalTo(CGSizeMake(55, 55));
    }];
    
}

#pragma mark - 代理
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.pictures.count;
}

-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"点击了%ld张",index);
}

//循环滚动
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        YES;      //type0的默认循环滚动模式为否
    }
    //修改缝隙
    if (option == iCarouselOptionSpacing) {
        return value * 1.5;
    }
    
    //取消后背的显示
    if (option == iCarouselOptionShowBackfaces) {
        return YES;
    }
    return value;

}

/* 每个cell是什么样子的 */
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW/2, kWindowH/2)];
        UIImageView *imageView = [UIImageView new];
        imageView.tag = 100;
        [view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.pictures[index]] placeholderImage:[UIImage imageNamed:@"a4813741"]];
    return view;
}

//两个cell之间的距离
-(CGFloat)carouselItemWidth:(iCarousel *)carousel{
    return kWindowW/2;
}
#warning 修改tabbar的样式，做个模拟登陆，在侧边栏显示个人欣信息,使用财新网最后一夜
@end







































