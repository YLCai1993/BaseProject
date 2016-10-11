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

@interface DetailTopicsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)DetailTopicViewModel *DTVM;

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
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.top.mas_equalTo(64);
    }];
    
    [self getData];
}

-(void)confiTableHeaderView{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 210)];
    DetailTopicHeaderView *view = [[NSBundle mainBundle] loadNibNamed:@"DetailTopicHeaderView" owner:nil options:nil].firstObject;
    [view.bgImageView sd_setImageWithURL:[NSURL URLWithString:[self.DTVM getTableViewBgImageURL]] placeholderImage:[UIImage imageNamed:@"contentview_hd_loading_logo"]];
    view.titleLabel.text = [self.DTVM getHeadTitleName];
    view.cntentLabel.text = [self.DTVM getHeadContent];
    [view.concernView setTitle:@"+关注" forState:UIControlStateNormal];
    view.bgImageView.userInteractionEnabled = YES;
    [view.concernView bk_addEventHandler:^(id sender) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:view];
    self.tableView.tableHeaderView = headerView;
    
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
    return 2;
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
        segment.frame = CGRectMake(self.view.width-85, 0, 75, 30);
        segment.layer.cornerRadius = 5;
        segment.backgroundColor = [UIColor redColor];
        [view addSubview:segment];
    }
    return view;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"你好";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end

































