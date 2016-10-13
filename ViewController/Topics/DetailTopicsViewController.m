//
//  DetailTopicsViewController.m
//  BaseProject
//
//  Created by YLCai on 16/9/30.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailTopicsViewController.h"
#import "DetailTopicViewModel.h"
#import <UIImageView+WebCache.h>
#import "DetailTopicHeaderView.h"
#import "DetailTopicCell.h"


@interface DetailTopicsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)DetailTopicViewModel *DTVM;

/*  顶部视图 */
@property(nonatomic,strong)UIView *topView;

/*  顶部专家介绍 */
@property(nonatomic,strong)DetailTopicHeaderView *headerView;

@end

@implementation DetailTopicsViewController
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(DetailTopicViewModel *)DTVM{
    if (!_DTVM) {
        _DTVM = [[DetailTopicViewModel alloc] initWithSubjectID:_subjectID];
    }
    return _DTVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.topView = [UIView new];
    [self.tableView registerNib:[UINib nibWithNibName:@"DetailTopicCell" bundle:nil] forCellReuseIdentifier:@"DetailTopicCell"];
    
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.top.mas_equalTo(210);
    }];
    
    
//    NSLog(@"******:ID%@",_subjectID);
    
    /*  获取数据 */
    [self getData];
    
    /* 添加手势 */
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
}

-(void)swipe:(UISwipeGestureRecognizer *)gr{
    NSLog(@"手势调用");
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)confiTableHeaderView{
    self.topView.frame = CGRectMake(0, 0, kWindowW, 210);
    [self.view addSubview:self.topView];
    
    DetailTopicHeaderView *headerView = [[NSBundle mainBundle] loadNibNamed:@"DetailTopicHeaderView" owner:nil options:nil].firstObject;
    self.headerView = headerView;
    [headerView.bgImageView sd_setImageWithURL:[NSURL URLWithString:[self.DTVM getTableViewBgImageURL]] placeholderImage:[UIImage imageNamed:@"contentview_imagebg_logo"]];
    headerView.titleLabel.text = [self.DTVM getHeadTitleName];
    headerView.cntentLabel.text = [self.DTVM getHeadContent];
    headerView.cntentLabel.font = [UIFont boldSystemFontOfSize:16];
    [headerView.backButton bk_addEventHandler:^(id sender) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    headerView.frame = CGRectMake(0, 0, kWindowW, 210);
    [self.topView addSubview:headerView];
    
}

-(void)getData{
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.DTVM getDetailTopicDataFromComleteHandle:^(NSError *error) {
            [_tableView.header endRefreshing];
            [_tableView reloadData];
            [self confiTableHeaderView];
            if (error) {
                NSLog(@"error:%@",error);
            }
        }];
    }];
    [_tableView.header beginRefreshing];
}

#pragma mark - UITableViewDeleagte
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return [self.DTVM getReleatedNews].count;
    }else{
      return [self.DTVM getRowNumber];
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"相关新闻";
    }else{
        return @"2343讨论";
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, 30)];
    UIImageView *imageView = [[UIImageView alloc] init];
    view.backgroundColor = [UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1];
    imageView.frame = CGRectMake(10, 9, 15, 12);
    [view addSubview:imageView];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 8, 120, 15)];
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor grayColor];
    [view addSubview:label];
    if (section == 0) {
        imageView.image = [UIImage imageNamed:@"old_tabbar_icon_news_normal"];
        label.text = @"相关新闻";
    }else{
        UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"最新",@"最热"]];
        segment.backgroundColor = [UIColor whiteColor];
        segment.tintColor = [UIColor redColor];
        segment.frame = CGRectMake(self.view.width-85, 0, 75, 30);
        segment.layer.cornerRadius = 5;
        [view addSubview:segment];
    }
    return view;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        }
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        NSArray *arr = [self.DTVM getReleatedNews];
        if (arr.count != 0) {
        cell.textLabel.text = [self.DTVM getReleatedNews][indexPath.row];
        }
        return cell;
    }else{
        /**  设置第二行的cell  */
        DetailTopicCell *cell = [self cellforIndexPath:indexPath andTableView:tableView];
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 50;
    }else{
      return [self.DTVM cellHeightForRow:indexPath.row];
    }
    
}

-(DetailTopicCell *)cellforIndexPath:(NSIndexPath *)indexPath andTableView:(UITableView *)tableView{
    DetailTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailTopicCell"];
    [cell.userHeadImageView sd_setImageWithURL:[self.DTVM getUserHeadImageNameForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"beautiful"]];
    cell.nameLabel.text = [self.DTVM getUserNameForRow:indexPath.row];
    cell.contentLabel.text = [self.DTVM getUserContentForRow:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma UITableview的滚动效应
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    
    if (offset.y < 150 && offset.y>0) {
            self.topView.frame = CGRectMake(0,  -offset.y, kWindowW, 210);
            [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(210-offset.y);
            }];
            [UIView animateWithDuration:1.0f animations:^{
                [self.topView layoutIfNeeded];
//                self.headerView.titleLabel.alpha = 0;
                self.headerView.cntentLabel.alpha = 0;
                self.headerView.concernView.alpha = 0;
            } completion:^(BOOL finished) {
            }];
//        if (offset.y>60) {
//            [self.headerView.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.top.mas_equalTo(offset.y);
//            }];
//        }
    }
//    if (offset.y > 150) {
//        [self.headerView.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(165);
//        }];
//    }
#warning 这里需要完善
    /* 当偏移量小于60时候,显示内容 */
    if (offset.y<40 && offset.y>0 ) {
        [UIView animateWithDuration:1.0f animations:^{
            self.headerView.titleLabel.alpha = 1.0;
            self.headerView.cntentLabel.alpha = 1.0;
            self.headerView.concernView.alpha = 1.0;
        } completion:^(BOOL finished) {
        }];
    }
    
    if (offset.y < 20 && offset.y>0) {
        self.topView.frame = CGRectMake(0,  0, kWindowW, 210);
        self.headerView.frame = CGRectMake(0, 0, kWindowW, 210);
    }
}

@end

































