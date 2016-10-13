//
//  TuWanListTableViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanListTableViewController.h"
#import "TuWanHtmlViewController.h"
#import "TuWanPicViewController.h"
#import "TuWanLisCell.h"
#import "TuWanViewModel.h"
#import "TuWanImageCell.h"
#import "iCarousel.h"

@interface TuWanListTableViewController ()<iCarouselDelegate,iCarouselDataSource>

@property(nonatomic,strong)TuWanViewModel *tuWanVM;

@end

@implementation TuWanListTableViewController{
    //添加成员变量，因为不需要懒加载，所以不需要属性
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLb;
    NSTimer *_timer;
}

/**  头部滚动视图 */
-(UIView *)headerView{
    [_timer invalidate];
    //如果当前没有头部视图 返回nil
    if (!self.tuWanVM.isExistIndexPic) return nil;
    
    //头部视图  origin无效，宽度无效,肯定是与table同宽
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, kWindowW/750 * 500)];
    
    //添加底部视图
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = kRGBColor(240, 240, 240);
    [headerView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
    
    _titleLb = [UILabel new];
    [bottomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = self.tuWanVM.indexPicNumber;
    [bottomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_greaterThanOrEqualTo(60);
        make.width.mas_lessThanOrEqualTo(20);
        make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(-10);
    }];
    _titleLb.text = [self.tuWanVM titleURLForRowInIndexPic:0];
    
    //添加滚动栏
    _ic = [iCarousel new];
    [headerView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_top).mas_equalTo(0);
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled = YES;
    _ic.scrollSpeed = 1;
    return headerView;
}
#pragma mark - IcarouselDelegate
/* 有多少个滚动视图 */
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.tuWanVM.indexPicNumber;
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750 * 500-35)];
        UIImageView *imageView = [UIImageView new];
        imageView.tag = 100;
        [view addSubview:imageView];
        imageView.contentMode = 2;
        view.clipsToBounds = YES;
        //如果只有一张图
        _pageControl.hidesForSinglePage = YES;
        //如果只有一张图,则不可以滚动
        _ic.scrollEnabled = self.tuWanVM.indexPicNumber != 1;
        _pageControl.pageIndicatorTintColor = [UIColor redColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
        
        if (self.tuWanVM.indexPicNumber > 1) {
            _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
                [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
            } repeats:YES];
        }
        //小圆点 不能与用户交互
        _pageControl.userInteractionEnabled = NO;
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    [imageView setImageWithURL:[self.tuWanVM iconURLForRowInIndexPic:index] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    return view;
}

/*  允许循环滚动 */
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

/**  监控当前滚定到第几个 */
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
//    NSLog(@"%ld",carousel.currentItemIndex);
    _titleLb.text = [self.tuWanVM titleForRowInIndexPic:carousel.currentItemIndex];
    _pageControl.currentPage = carousel.currentItemIndex;
}

-(TuWanViewModel *)tuWanVM{
    if (!_tuWanVM) {
        _tuWanVM = [[TuWanViewModel alloc] initWithType:_infoType.integerValue];
    }
    return _tuWanVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*  注册cell  */
    [self.tableView registerClass:[TuWanLisCell class] forCellReuseIdentifier:@"ListCell"];
    [self.tableView registerClass:[TuWanImageCell class] forCellReuseIdentifier:@"ImageCell"];
    
    
    /** 获取数据  */
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tuWanVM refreshDataCompletionHandle:^(NSError *error) {
           [self.tableView reloadData];
            self.tableView.tableHeaderView = [self headerView];
            [self.tableView.header endRefreshing];
        }];
    }];
    [self.tableView.header beginRefreshing];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
       [self.tuWanVM getMoreDataCompletionHandle:^(NSError *error) {
           self.tableView.tableHeaderView = [self headerView];
           [self.tableView.footer endRefreshing];
           [self.tableView reloadData];
       }];
    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tuWanVM.rowNumber;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.tuWanVM containImages:indexPath.row]) {
        return 135;
    }
    return 90;
}

/**  滚动栏中被选中时触发  */
-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    if ([self.tuWanVM isHtmlInIndexPicForRow:index]) {
        TuWanHtmlViewController *vc = [[TuWanHtmlViewController alloc] initWithURL:[self.tuWanVM detailURLForRowInIndexPic:index]];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.tuWanVM isHtmlInListForRow:indexPath.row]) {
        TuWanHtmlViewController *vc = [[TuWanHtmlViewController alloc] initWithURL:[self.tuWanVM detailURLForRowInList:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([self.tuWanVM isPicInListForRow:indexPath.row]) {
        TuWanPicViewController *vc = [[TuWanPicViewController alloc] initWithAid:[self.tuWanVM aidInListForRow:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.tuWanVM containImages:indexPath.row]) {
        TuWanImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
        cell.titleLb.text = [self.tuWanVM titleForRowInList:indexPath.row];
        cell.clicksNumLb.text = [self.tuWanVM clicksForRowInList:indexPath.row];
        [cell.iconIV0.imageView setImageWithURL:[self.tuWanVM iconURLSForRow:indexPath.row][0] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell.iconIV1.imageView setImageWithURL:[self.tuWanVM iconURLSForRow:indexPath.row][1] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell.iconIV2.imageView setImageWithURL:[self.tuWanVM iconURLSForRow:indexPath.row][2] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
//        NSLog(@"你好啊超级啊读书笔记:%@",[self.tuWanVM iconURLSForRow:indexPath.row][2]);
        return cell;
    }
    
    TuWanLisCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
    
    [cell.iconIV.imageView setImageWithURL:[self.tuWanVM iconURLForRowInList:indexPath.row] placeholderImage:[UIImage imageNamed:@"10941686_0800"]];
    cell.titleLb.text = [self.tuWanVM titleForRowInList:indexPath.row];
    cell.longTitleLb.text = [self.tuWanVM descForRowInList:indexPath.row];
    cell.clicksNumLb.text = [self.tuWanVM clicksForRowInList:indexPath.row];
    
    return cell;
}

/*  去掉掉分割线的左侧缝隙  */
kRemoveCellSeparator

@end





