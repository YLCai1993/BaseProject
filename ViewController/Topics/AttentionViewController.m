//
//  AttentionViewController.m
//  BaseProject
//
//  Created by YLCai on 16/9/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AttentionViewController.h"
#import "ConcernCell.h"

@interface AttentionViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation AttentionViewController

#pragma mark - lazy load
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"ConcernCell" bundle:nil] forCellReuseIdentifier:@"ConcernCell"];
    [self.view addSubview:self.tableView];[self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-40);
        make.top.mas_equalTo(64);
    }];
    
    [self congfiTableView];
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"没有数据");
    }];
}

-(void)congfiTableView{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, 130)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, kWindowW, 18)];
    label.text = @"您关注的问题和问吧将出现在这里";
    label.textAlignment = NSTextAlignmentCenter;
    [headView addSubview:label];
    
    UIButton *concernButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, 150, 37)];
    [concernButton setTitle:@"去关注" forState:UIControlStateNormal];
    concernButton.backgroundColor = [UIColor redColor];
    [concernButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    concernButton.titleLabel.font = [UIFont systemFontOfSize:19];
    [concernButton bk_addEventHandler:^(id sender) {
        NSLog(@"点击了关注按钮");
    } forControlEvents:UIControlEventTouchUpInside];
    concernButton.x = kWindowW/2 - concernButton.width/2;
    [headView addSubview:concernButton];
    self.tableView.tableHeaderView = headView;
}

#pragma mark - UITableViewDelegate
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
        label.text = @"大家都在看";
    }else{
        imageView.image = [UIImage imageNamed:@"old_tabbar_icon_news_normal"];
        label.text = @"大家都在问";
    }
    return view;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"大家都在看";
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 72;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ConcernCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ConcernCell"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end














































