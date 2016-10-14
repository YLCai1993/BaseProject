//
//  HeroViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeroViewController.h"
#import "iCarousel.h"

@interface HeroViewController ()<iCarouselDataSource,iCarouselDelegate>

@property(nonatomic,strong)iCarousel *ic;
//存储图片名称
@property(nonatomic,strong)NSArray *imageNames;

@end

@implementation HeroViewController

- (id)init{
    if (self=[super init]) {
        self.navigationItem.title=@"英雄";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.ic];
    [self.ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];

}

#pragma mark ===  代理   ===
//问有多少个cell
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.imageNames.count;
}

-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"选择了%ld张",index);
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
        return NO;
    }
    return value;
}

/**
 *  问：每个cell什么样
 *
 *  @param carousel 当前调用的类型
 *  @param index    <#index description#>
 *  @param view     视图
 *
 *  @return <#return value description#>
 */
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    
    if (!view) {
        //这里的x y饰无作用的,图片宽高 300 * 500 300/1.5 500/1.5
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW/2 , kWindowH/2)];
        UIImageView *imageView = [UIImageView new];
        imageView.tag = 100;
        [view addSubview:imageView];
        //        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    //
    NSString *path = [[NSBundle mainBundle]pathForResource:@"HeroSkins" ofType:@"bundle"];
    path = [path stringByAppendingPathComponent:self.imageNames[index]];
    imageView.image = [UIImage imageWithContentsOfFile:path];
    return view;
}


#pragma mark ===  懒加载  ===

-(iCarousel *)ic{
    if (!_ic) {
        _ic = [iCarousel new];
        //就是仿写的collectionView
        _ic.delegate = self;
        _ic.dataSource = self;
        
        //设置3D效果，0～11之间都可以
        _ic.type = 4;
        
        //自动展示效果 0表示不滚动  越大滚动越快
        _ic.autoscroll = 0;
        
        //竖直方向
        //        _ic.vertical = YES;
        
        //改为翻页模式
        _ic.pagingEnabled = NO;
        
        //滚动速度
        _ic.scrollSpeed = 3;
    }
    return _ic;
}

-(NSArray *)imageNames{
    if (!_imageNames) {
        //读取HeroSkins.bundle文件夹内的所有文件名
        NSString *path = [[NSBundle mainBundle]pathForResource:@"HeroSkins" ofType:@"bundle"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        //读取这个文件夹下的所有子路径
        _imageNames = [fileManager subpathsAtPath:path];
    }
    return _imageNames;
}

//两个cell之间的距离
-(CGFloat)carouselItemWidth:(iCarousel *)carousel{
    return kWindowW/2 - 10;
}


@end
