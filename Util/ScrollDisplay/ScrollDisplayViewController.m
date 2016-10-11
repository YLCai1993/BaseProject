//
//  ScrollDisplayViewController.m
//  BaseProject
//
//  Created by YLCai on 16/9/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ScrollDisplayViewController.h"
#import <UIButton+WebCache.h>

@interface ScrollDisplayViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@property(nonatomic,strong)UIView *view1;
@property(nonatomic,strong)UILabel *detailLabel;

@end

@implementation ScrollDisplayViewController

-(instancetype)initWithImgPaths:(NSArray *)paths{
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i = 0; i<paths.count; i++) {
        id path = paths[i];
        UIButton *button = [UIButton buttonWithType:0];
        if ([self isURL:path]) {
            [button sd_setBackgroundImageWithURL:path forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"contentview_hd_loading_logo"]];
        }else if ([self isNetPath:path]){
            NSURL *url = [NSURL URLWithString:path];
            [button sd_setBackgroundImageWithURL:url forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"contentview_hd_loading_logo"]];
        }else if ([path isKindOfClass:[NSString class]]){
            NSURL *url = [NSURL URLWithString:path];
            [button sd_setBackgroundImageWithURL:url forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"contentview_hd_loading_logo"]];
        }else{
            [button setBackgroundImage:[UIImage imageNamed:@"error"] forState:UIControlStateNormal];
        }
        UIViewController *vc = [UIViewController new];
        vc.view = button;
        button.tag = 1000 + i;
        [button bk_addEventHandler:^(UIButton *sender) {
            if ([self.delegate respondsToSelector:@selector(scrollDisplayViewController:didSelectedIndex:)]) {
                [self.delegate scrollDisplayViewController:self didSelectedIndex:sender.tag - 1000];
            }
            
        } forControlEvents:UIControlEventTouchUpInside];
        [arr addObject:vc];
    }
    self = [self initWithViewControllers:arr];
    return self;
}

//判断是否是网络路径
-(BOOL)isURL:(id)path{
    return [path isKindOfClass:[NSURL class]];
}

//判断是否是网络路径
-(BOOL)isNetPath:(id)path{
    
    BOOL isStr = [path isKindOfClass:[NSString class]];
    if (!isStr) {
        return NO;
    }
    BOOL containHttp = [path rangeOfString:@"http"].location != NSNotFound;
    BOOL containTile =  [path rangeOfString:@"://"].location != NSNotFound;
    
    return isStr && containHttp && containTile;
}

-(instancetype)initWithImgNames:(NSArray *)names{
    NSMutableArray *arr = [NSMutableArray new];
    for (NSInteger i = 0; i<names.count; i++) {
        UIImage *image = [UIImage imageNamed:names[i]];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:image forState:UIControlStateNormal];
        UIViewController *vc = [UIViewController new];
        vc.view = button;
        button.tag = 1000+i;
        [button bk_addEventHandler:^(UIButton *sender) {
            [self.delegate scrollDisplayViewController:self didSelectedIndex:sender.tag-1000];
        } forControlEvents:UIControlEventTouchUpInside];
        [arr addObject:vc];
        self = [self initWithViewControllers:arr];
        
    }
    return self;
}

-(instancetype)initWithViewControllers:(NSArray *)controllers{
    if (self = [super init]) {
        _controllers = [controllers copy];
        _autoCycle = NO;
        _canCycle = YES;
        _showPageControl = YES;
        _duration =3;
        _pageControlOffset = 0;
    }
    return self;
}

-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        self.detailLabel.textColor = [UIColor whiteColor];
        self.detailLabel.font = [UIFont systemFontOfSize:15];
    }
    return _detailLabel;
}

-(UIView *)view1{
    if (!_view1) {
        _view1 = [[UIView alloc] init];
        self.view1 = [[UIView alloc] init];
        self.view1.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    }
    return _view1;
}
-(void)setDetailMessage:(NSArray *)detailMessage{
    _detailMessage = detailMessage;
    [self.view insertSubview:self.view1 belowSubview:_pageControl];
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.view.width, 30));
        make.bottom.right.mas_equalTo(0);
    }];
    [self.view1 addSubview:self.detailLabel];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-60);
    }];
}

-(void)setCurrentPage:(NSInteger)currentPage{
    NSInteger diration = 0;
    if (_currentPage == currentPage) {
        return;
    }else if (_currentPage>currentPage){
        diration = UIPageViewControllerNavigationDirectionReverse;
    }else{
        diration = UIPageViewControllerNavigationDirectionForward;
    }
    _currentPage = currentPage;
    UIViewController *vc = _controllers[currentPage];
    [self.pageVC setViewControllers:@[vc] direction:diration animated:YES completion:nil];
}

#pragma mark
-(void)setAutoCycle:(BOOL)autoCycle{
    _autoCycle = autoCycle;
    [_timer invalidate];
    if (autoCycle == NO) {
        return;
    }
    _timer = [NSTimer bk_scheduledTimerWithTimeInterval:_duration block:^(NSTimer *timer) {
        UIViewController *vc = _pageVC.viewControllers.firstObject;
        NSInteger index = [_controllers indexOfObject:vc];
        UIViewController *nextVC = nil;
        if (index == _controllers.count - 1) {
            if (!_canCycle) {
                return ;
            }
            nextVC = _controllers.firstObject;
        }else{
            nextVC = _controllers[index+1];
        }
        
        __block ScrollDisplayViewController *vc1 = self;
        [_pageVC setViewControllers:@[nextVC] direction:0 animated:YES completion:^(BOOL finished) {
            [vc1 configPageControl];
        }];
       
        
    } repeats:YES];
}

-(void)setShowPageControl:(BOOL)showPageControl{
    _showPageControl = showPageControl;
    _pageControl.hidden = !showPageControl;
}

-(void)setDuration:(NSTimeInterval)duration{
    _duration = duration;
    self.autoCycle = _autoCycle;
}

-(void)setPageControlOffset:(CGFloat)pageControlOffset{
    _pageControlOffset = pageControlOffset;
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_pageControlOffset);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailLabel.text = _detailMessage[0];
    if (!_controllers || _controllers.count == 0) {
        return;
    }
    _pageVC = [[UIPageViewController alloc] initWithTransitionStyle:1 navigationOrientation:_diration options:nil];
    _pageVC.delegate = self;
    _pageVC.dataSource = self;
    [self addChildViewController:_pageVC];
    [self.view addSubview:_pageVC.view];
    [_pageVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    [_pageVC setViewControllers:@[_controllers.firstObject] direction:0 animated:YES completion:nil];
    
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = _controllers.count;
    _pageControl.size = CGSizeMake(40, 20);
    [self.view addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(0);
    }];
    _pageControl.userInteractionEnabled = NO;
    self.showPageControl = _showPageControl;
    self.canCycle = _canCycle;
    self.autoCycle = _autoCycle;
}

#pragma mark UIPageControllerdelegate
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSInteger index = [_controllers indexOfObject:viewController];
    if (index == 0) {
        return _canCycle ? _controllers.lastObject : nil;
    }
    return _controllers[index-1];
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSInteger index = [_controllers indexOfObject:viewController];
    if (index == _controllers.count-1) {
        return _canCycle ? _controllers.firstObject : nil;
    }
    return _controllers[index+1];
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    if (completed && finished) {
        [self configPageControl];
        NSInteger index = [_controllers indexOfObject:pageViewController.viewControllers.firstObject];
        //可以判断，某个对象是否有某个方法,并且将当前的滚动的那一页tag传出去
        if ([self.delegate respondsToSelector:@selector(scrollDisplayViewController:currentIdenx:)]) {
            [self.delegate scrollDisplayViewController:self currentIdenx:index];
        }
    }
}

-(void)configPageControl{
    NSInteger index = [_controllers indexOfObject:_pageVC.viewControllers.firstObject];
    self.detailLabel.text = _detailMessage[index];
    _pageControl.currentPage = index;
}

@end
























