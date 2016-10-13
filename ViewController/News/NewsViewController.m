//
//  NewsViewController.m
//  BaseProject
//
//  Created by YLCai on 16/9/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "NewsViewController.h"
#import "ScrollDisplayViewController.h"
#import "HeadLineViewModel.h"
#import "HeadLineViewController.h"
#import "AddViewController.h"
#import "LeftViewController.h"
#import "UIViewController+YQSlideMenu.h"
#import "Global.h"

//extern 
@interface NewsViewController ()<scrollDisplayViewControllerDelegate>

@property(nonatomic,strong)ScrollDisplayViewController *sdVC;
@property(nonatomic,strong)UIScrollView *scrollView;

@property(nonatomic,strong)NSMutableArray *btns;
@property(nonatomic,strong)UIView *lineView;

@property(nonatomic,strong)UIButton *selectedButton;
@property(nonatomic,strong)UIButton *addButton;
@property(nonatomic,strong)AddViewController *addVC;
@property(nonatomic,strong)UIView *adsView;

@property(nonatomic,strong)NSMutableArray *btnArray;
@property(nonatomic,strong)NSMutableArray *classModels;

@property (nonatomic,strong) RESideMenu *sideMenu;
@property(nonatomic,strong)LeftViewController *leftViewController;

@end

@implementation NewsViewController

-(LeftViewController *)leftViewController{
    if (!_leftViewController) {
        _leftViewController = [LeftViewController new];
    }
    return _leftViewController;
}

/*  显示侧边栏  */
- (IBAction)changeToOnLineRadio:(UIBarButtonItem *)sender {
    [[self slideMenuController] showMenu];//打开菜单
}

-(NSMutableArray *)classModels{
    if (!_classModels) {
        _classModels = [NSMutableArray new];
        _classModels = [@[@"T1467284926140",@"T1348648517839",@"T1348649079062",@"T1348648756099",@"T1348649580692",@"T1348650593803"] mutableCopy];
    }
    return  _classModels;
}

-(void)scrollDisplayViewController:(ScrollDisplayViewController *)scrollDisplayViewController currentIdenx:(NSInteger)index{
    classIndex = index - 1;
    _selectedButton.selected = NO;
    _selectedButton = _btns[index];
    _selectedButton.selected = YES;
    [self changeButtonTitltFont];
    [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(2);
        make.centerX.mas_equalTo(_selectedButton);
        make.top.mas_equalTo(_selectedButton.mas_bottom).mas_equalTo(8);
    }];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navbar_netease.png"]];
        self.navigationItem.titleView = imageView;
        
    }
    return self;
}

#pragma mark - lazy getter
-(NSMutableArray *)btns{
    if (!_btns) {
        _btns = [NSMutableArray new];
    }
    return _btns;
}

-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = kRGBColor(218, 49, 43);
    }
    return _lineView;
}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
        _scrollView.backgroundColor = [UIColor whiteColor];
        NSArray *array = @[@"头条",@"精选",@"娱乐",@"体育",@"网易号",@"马鞍山",@"视频",@"财经",
                           @"科技",@"汽车",@"时尚",@"图片",@"直播",@"热点",];
        self.btnArray = [array copy];
        UIView *lasteView = nil;  //指向最新添加的按钮
        for (NSInteger i = 0; i<array.count; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.titleLabel.font = [UIFont systemFontOfSize:15];
            [button setTitle:array[i] forState:UIControlStateNormal];
            [button setTitleColor:kRGBColor(95, 95, 95) forState:UIControlStateNormal];
            [button setTitleColor:self.lineView.backgroundColor forState:UIControlStateSelected];
            if (i == 0) {
                _selectedButton = button;
                button.selected = YES;
                [self changeButtonTitltFont];
            }
            [button bk_addEventHandler:^(UIButton *sender) {
                if (_selectedButton != sender) {
                    _selectedButton.selected = NO;
                    sender.selected = YES;
                    _selectedButton = sender;
                     _selectedButton.titleLabel.font = [UIFont systemFontOfSize:17];
                    
                    [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.width.mas_equalTo(40);
                        make.height.mas_equalTo(2);
                        make.centerX.mas_equalTo(sender);
                        make.top.mas_equalTo(sender.mas_bottom).mas_equalTo(8);
                    }];
                    _sdVC.currentPage = [self.btns indexOfObject:sender];
                    [self changeButtonTitltFont];
                }
            } forControlEvents:UIControlEventTouchUpInside];
            [_scrollView addSubview:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(55, 24));
                make.centerY.mas_equalTo(_scrollView);
                if (lasteView) {
                    make.left.mas_equalTo(lasteView.mas_right).mas_equalTo(10);
                }else{
                    make.left.mas_equalTo(10);
                }
            }];
            lasteView = button;
            [self.btns addObject:button];
        }
        [lasteView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_scrollView.mas_right).mas_equalTo(-10);
        }];
        _scrollView.showsHorizontalScrollIndicator = NO;
        [_scrollView addSubview:self.lineView];
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(2);
            UIButton *button = _btns[0];
            make.centerX.mas_equalTo(button);
            make.top.mas_equalTo(button.mas_bottom).mas_equalTo(8);
        }];
    }
    return _scrollView;
}

//改变字体大小
-(void)changeButtonTitltFont{
    for (NSInteger i = 0; i<self.btns.count; i++) {
        UIButton *button = self.btns[i];
        if (button.selected == YES) {
            button.titleLabel.font = [UIFont systemFontOfSize:17];
        }else{
            button.titleLabel.font = [UIFont systemFontOfSize:15];
        }
    }
}

-(HeadLineViewController *)headLineVcWithType:(NewsListType )type{
    HeadLineViewController *vc = [kStoryboard(@"Main") instantiateViewControllerWithIdentifier:@"HeadLineViewController"];
    vc.type = type;
    return vc;
}

-(HeadLineViewController *)normalVCWithType:(NSString *)className{
    HeadLineViewController *vc = [kStoryboard(@"Main") instantiateViewControllerWithIdentifier:@"HeadLineViewController"];
    vc.className = className;
    return vc;
}

-(ScrollDisplayViewController *)sdVC{
    if (!_sdVC) {
        NSArray *vcs = @[
                           [self headLineVcWithType:NewsListTypeTouTiao],
                           [self normalVCWithType:@"T1467284926140"], //精选
                           [self normalVCWithType:@"T1348648517839"],  //娱乐
                           [self normalVCWithType:@"T1348649079062"], //体育
                           [self headLineVcWithType:NewsListTypeTouTiao],
                           [self headLineVcWithType:NewsListTypeTouTiao],
                           [self headLineVcWithType:NewsListTypeTouTiao],   //视频
                           [self normalVCWithType:@"T1348648756099"],  //财经
                           [self normalVCWithType:@"T1348649580692"],  //科技
                           [self headLineVcWithType:NewsListTypeTouTiao],
                           [self normalVCWithType:@"T1348649580692"],  //时尚
                           [self headLineVcWithType:NewsListTypeTouTiao],
                           [self headLineVcWithType:NewsListTypeTouTiao],
                           [self headLineVcWithType:NewsListTypeTouTiao]
                           ];
        _sdVC = [[ScrollDisplayViewController alloc] initWithViewControllers:vcs];
        _sdVC.autoCycle = NO;
        _sdVC.canCycle = NO;
        _sdVC.showPageControl = NO;
        _sdVC.delegate = self;
    }
    return _sdVC;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.scrollView.hidden = NO;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.scrollView.hidden = YES;
}

-(UIButton *)addButton{
    if (!_addButton) {
        _addButton = [[UIButton alloc] init];
        _addButton.backgroundColor = [UIColor whiteColor];
    }
    return _addButton;
}

-(AddViewController *)addVC{
    if (!_addVC) {
        _addVC = [[AddViewController alloc] init];
    }
    return _addVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lineView.hidden = YES;    
    
    self.adsView = [UIView new];
    self.adsView.backgroundColor = [UIColor whiteColor];
    self.adsView.frame = CGRectMake(0, 64, self.view.width, 44);
    [self.view addSubview:self.adsView];
    
    [self.view addSubview:self.scrollView ];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(-28);
        make.top.mas_equalTo(64);
        make.height.mas_equalTo(44);
    }];

    [self addChildViewController:self.sdVC];
    [self.view insertSubview:self.sdVC.view belowSubview:self.scrollView];
    [self.sdVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(108);
    }];
    
    //添加增加按钮
    [self.addButton setBackgroundImage:[UIImage imageNamed:@"home_header_add_slim"] forState:UIControlStateNormal];
        [self.addButton bk_addEventHandler:^(id sender) {
        self.addButton.selected = !self.addButton.selected;
        if (self.addButton.selected) {
            [UIView animateWithDuration:0.5 animations:^{
                self.addButton.layer.transform = CATransform3DRotate(self.addButton.layer.transform,M_PI_2/2, 0, 0, 1);
                [self showAddButton];
            }];
        }else{
            [UIView animateWithDuration:0.5 animations:^{
                self.addButton.layer.transform = CATransform3DRotate(self.addButton.layer.transform,-M_PI_2/2, 0, 0, 1);
                [self hiddenAddButton];
            }];
        }
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:self.addButton aboveSubview:self.scrollView];
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-13);
        make.top.mas_equalTo(80);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];

    //添加增加按钮视图
    self.addVC.addedBtns = [self.btnArray mutableCopy];
    self.addVC.view.frame = CGRectMake(0, -self.view.height+262, self.view.width, self.view.height-112-44);
    [self.view insertSubview:self.addVC.view belowSubview:self.scrollView];
}

-(void)showAddButton{
    [UIView animateWithDuration:0.5 animations:^{
      self.addVC.view.frame = CGRectMake(0, 108, self.view.width, self.view.height-112-44);
    } completion:^(BOOL finished) {
        self.scrollView.hidden = YES;
       [self changeView];
    }];
}

/*  隐藏加号按钮 */
-(void)hiddenAddButton{
    self.scrollView.hidden = NO;
    [UIView animateWithDuration:0.5 animations:^{
        self.addVC.view.frame = CGRectMake(0, -self.view.height+262, self.view.width, self.view.height-112-44);
    }];
}

-(void)changeView{
    UILabel *changeLabel = [[UILabel alloc] init];
    changeLabel.text = @"切换栏目";
    changeLabel.textColor = [UIColor darkGrayColor];
    changeLabel.font = [UIFont systemFontOfSize:15];
    [self.adsView addSubview:changeLabel];
    [changeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    
    UIButton *deleteButton = [[UIButton alloc] init];
    [deleteButton setBackgroundImage:[UIImage imageNamed:@"channel_edit_button_bg"] forState:UIControlStateNormal];
    [deleteButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [deleteButton setTitle:@"批量删除" forState:UIControlStateNormal];
    deleteButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.adsView addSubview:deleteButton];
    [deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-50);
        make.top.mas_equalTo(7);
        make.size.mas_equalTo(CGSizeMake(75, 30));
    }];
}
@end




































