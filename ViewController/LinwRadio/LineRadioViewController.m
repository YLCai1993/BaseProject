//
//  LineRadioViewController.m
//  BaseProject
//
//  Created by YLCai on 16/9/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LineRadioViewController.h"
#import "LiveRadioViewModel.h"
#import "ScrollDisplayViewController.h"
#import "ShowViewController.h"
#import <UIImageView+WebCache.h>
#import "PlayerViewController.h"
#import "FutureViewController.h"
#import "ClassViewController.h"
#import "LineCell.h"

@interface LineRadioViewController ()<UITableViewDelegate,UITableViewDataSource,scrollDisplayViewControllerDelegate,classViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)LiveRadioViewModel *lrVM;
@property(nonatomic,strong)ScrollDisplayViewController *sdVC;
@property(nonatomic,assign)NSInteger tag;
@property(nonatomic,assign)NSInteger gestureTag;
@property(nonatomic,strong)ClassViewController *classVC;
@property(nonatomic,assign)BOOL isShowFutureLbael;

@end

@implementation LineRadioViewController

-(ClassViewController *)classVC{
    if (!_classVC) {
        _classVC = [[ClassViewController alloc] init];
        _classVC.delegate = self;
    }
    return _classVC;
}

-(LiveRadioViewModel *)lrVM{
    if (!_lrVM) {
        _lrVM= [[LiveRadioViewModel alloc] initWithType:nil];
    }
    return _lrVM;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
      self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_icon_media_highlight"];
    }
    return self;
}


- (IBAction)didSelected:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:{
            //获取数据
            [self getData];
            for(UIView *view in [self.view subviews])
            {
                view.hidden = NO;
            }
            self.classVC.view.hidden = YES;
        }
          break;
        case 1:{
            for(UIView *view in [self.view subviews])
            {
                view.hidden = YES;
            }
            if (self.gestureTag == 0) {
              [self.view addSubview:self.classVC.view];
                self.gestureTag++;
            }else{
               self.classVC.view.hidden = NO;
            }
            self.classVC.view.backgroundColor = [UIColor greenColor];
        }
            break;
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    [self getData];
    self.segment.selectedSegmentIndex = 0;
    self.segment.layer.cornerRadius = 15;
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(changeToClass)];
    swipe.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.tableView addGestureRecognizer:swipe];
    self.isShowFutureLbael = NO;
}
-(void)changeToClass{
    self.segment.selectedSegmentIndex = 1;
    [self didSelected:self.segment];
}

-(void)getData{
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.lrVM refreshDateCompleteHandle:^(NSError *error) {
            [_tableView.header endRefreshing];
            self.isShowFutureLbael = YES;
            [_tableView reloadData];
            if (error) {
                NSLog(@"error:%@",error);
            }
            //配置表头视图
            [self configTableHeaderView];
        }];
    }];
    [self.tableView.header beginRefreshing];
}

-(void)configTableHeaderView{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 185)];
    _sdVC = [[ScrollDisplayViewController alloc] initWithImgPaths:[self.lrVM getHeadURl]];
    _sdVC.autoCycle = YES;
    _sdVC.canCycle = YES;
    _sdVC.delegate = self;
    /* 容错处理  */
    if ([self.lrVM getDetail] == nil || [self.lrVM getDetail].count == 0) return;
    _sdVC.detailMessage = [self.lrVM getDetail];
    [self addChildViewController:_sdVC];
    [headView addSubview:_sdVC.view];
    [_sdVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(headView);
    }];
    self.tableView.tableHeaderView = headView;
}

#pragma mark - UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    NSLog(@"number:%ld",self.lrVM.getRowNumber);
    if (section == 0) {
        return 1;
    }
    return self.lrVM.getRowNumber;
}

-(NSArray *)getViewControllersForNumber:(NSInteger )number{
    NSMutableArray *allVC = [NSMutableArray new];
    [allVC removeAllObjects];
    for (NSInteger i = 0; i<number; i++) {
        ShowViewController *sVC = [[ShowViewController alloc] init];
        sVC.message = [NSString stringWithFormat:@"%@",[self.lrVM getFutureTitleForRow:i]];
        [allVC addObject:sVC];
    }
    return [allVC copy];
}

-(UIView *)getShowView{
    if (self.tag > 0) {
        NSInteger number = [self.lrVM getFutureNumber];
        ScrollDisplayViewController *sdVC = [[ScrollDisplayViewController alloc] initWithViewControllers:[self getViewControllersForNumber:number]];
        sdVC.canCycle = YES;
        sdVC.autoCycle = YES;
        sdVC.showPageControl = NO;
        sdVC.delegate = self;
        sdVC.diration = 1;
        sdVC.duration = 3;
        sdVC.view.frame = CGRectMake(58, 10, self.view.width-120, 35);
        return sdVC.view;
       
    }else{
        self.tag ++;
        return nil;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        UIView *view = [cell viewWithTag:100];
        if (view == nil) {
            view = [self getShowView];
            view.tag =100;
          [cell.contentView addSubview:view];
        }
        
        UILabel *label = [cell viewWithTag:101];
        if (label == nil) {
           label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 45, 35)];
            label.text = @"预告 / ";
            label.hidden = self.isShowFutureLbael;
            label.textColor = [UIColor colorWithRed:43/255.0 green:101/255.0 blue:187/255.0 alpha:1];
            label.tag = 101;
            [cell.contentView addSubview:label];
        }
        
        UILabel *label1 = [cell viewWithTag:102];
        if (label1 == nil) {
            label1 = [[UILabel alloc] initWithFrame:CGRectMake(self.view.width-60, 18, 20, 20)];
//            NSLog(@"%ld",[self.lrVM getFutureNumber]);
            label1.font = [UIFont systemFontOfSize:13];
            label1.textColor = [UIColor redColor];
            label1.tag = 102;
            [cell.contentView addSubview:label1];
        }
        label1.text = [NSString stringWithFormat:@"%ld",[self.lrVM getFutureNumber]];
        UILabel *label3 = [cell viewWithTag:103];
        if (label3 == nil) {
            label3 = [[UILabel alloc] initWithFrame:CGRectMake(self.view.width-40, 18, 15, 20)];
            label3.text = @"场";
            label3.font = [UIFont systemFontOfSize:13];
            label3.textColor = [UIColor grayColor];
            label3.tag = 103;
            [cell.contentView addSubview:label3];
        }
         return cell;
    }else{
        LineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell5"];
        [cell.backGroundButton sd_setImageWithURL:[NSURL URLWithString:[self.lrVM getImagesForRow:indexPath.row]]];
        cell.titleLabel.text = [self.lrVM getTitleForRow:indexPath.row];
        cell.apartiment.text = [self.lrVM watchingPeopleForRow:indexPath.row];
        BOOL zhibo = [self.lrVM isOnlineForRow:indexPath.row];
        if (zhibo) {
            cell.zhiBoButton.text = @"直播";
            cell.zhiBoButton.backgroundColor = [UIColor redColor];
        }else{
            cell.zhiBoButton.backgroundColor = [UIColor grayColor];
            cell.zhiBoButton.text = @"回顾";
        }
        return cell;
    }
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 55;
    }
    return 150;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        FutureViewController *vc = [[FutureViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        vc.futureLineRadios = [self.lrVM getFutureData];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        PlayerViewController *vc = [[PlayerViewController alloc] init];
        vc.roomID = [self.lrVM getRoomIDForRow:indexPath.row];
        vc.isZhiBo = [self.lrVM isOnlineForRow:indexPath.row];
        [self presentViewController:vc animated:YES completion:nil];
    }
   
}
#pragma mark - scrollDisplayViewControllerDelegate
-(void)scrollDisplayViewController:(ScrollDisplayViewController *)scrollDisplayViewController didSelectedIndex:(NSInteger)index{
    NSLog(@"点击了第%ld张图片",index);
}

#pragma mark - classViewControllerDelegate
-(void)classViewController:(ClassViewController *)ClassViewController sendIndex:(NSInteger)index{
    self.segment.selectedSegmentIndex = index;
    [self didSelected:self.segment];
}
@end































