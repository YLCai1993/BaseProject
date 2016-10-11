//
//  AddViewController.m
//  BaseProject
//
//  Created by YLCai on 16/9/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AddViewController.h"

#define buttonW 70
#define buttonH 30
#define col 4
#define interY 20

@interface AddViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *allButtons;
@property(nonatomic,strong)NSMutableArray *wattingAddBtns;

@property(nonatomic,strong)NSMutableArray *added;
@property(nonatomic,strong)NSMutableArray *watting;

@end

@implementation AddViewController

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
    }
    return _tableView;
}

-(NSMutableArray *)allButtons{
    if (!_allButtons) {
        _allButtons = [@[@"头条",@"精选",@"娱乐",@"体育",@"网易号",@"马鞍山",@"视频",@"财经",@"科技",@"汽车",@"时尚",@"图片",@"直播",@"热点",@"跟帖",@"房产",@"轻松一刻",@"段子",@"军事",@"历史",@"家居",@"独家",@"游戏",@"健康",@"政务",@"漫画",@"哒哒趣闻",@"彩票",@"美女",@"NBA",@"社会",@"航空",@"影视歌",@"股票",@"中国足球",@"国际足球",@"CBA",@"跑步",@"手机",@"数码",@"智能",@"云课堂",@"态度公开课",@"旅游",@"读书",@"酒香",@"教育",@"琴子",@"暴雪游戏",@"态度营销",@"情感",@"艺术",@"海外",@"博客",@"论坛",@"萌宠",] copy];
    }
    return _allButtons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
   
    [self configTableHeaderView];
    [self configTableFotterView];
}
//配置表头视图
-(void)configTableHeaderView{
    UIView *headerView = [[UIView alloc] init];
    
    CGFloat interX = (self.view.width - buttonW*col)/5;
    for (NSInteger i = 0; i<self.addedBtns.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"channel_grid_circle"] forState:UIControlStateNormal];
        button.tag = i;
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        NSString *content = self.addedBtns[i];
        [button setTitle:content forState:UIControlStateNormal];
        if (content.length==4) {
            button.titleLabel.font = [UIFont systemFontOfSize:14];
        }else if (content.length == 5){
            button.titleLabel.font = [UIFont systemFontOfSize:13];
        }else{
            button.titleLabel.font = [UIFont systemFontOfSize:15];
        }
        CGFloat buttonX = interX + interX*(i%col) + buttonW*(i%col);
        CGFloat buttonY = interY + interY*(NSInteger)(i/col) + buttonH*(NSInteger)(i/col);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [button bk_addEventHandler:^(id sender) {
            NSLog(@"点击了上方的按钮");
        } forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:button];
    }
    NSInteger row = (self.addedBtns.count-1) / 4 +1;
    CGFloat headerViewH = row * buttonH + (row + 1)*interY;
    headerView.frame = CGRectMake(0, 0, self.view.width, headerViewH);
    headerView.alpha = 0.8;
     self.tableView.tableHeaderView  = headerView;
}
//配置表尾视图
-(void)configTableFotterView{
    UIView *footerView = [[UIView alloc] init];
    self.wattingAddBtns = [self.allButtons mutableCopy];
    [self.wattingAddBtns removeObjectsInArray:self.addedBtns];
    
    CGFloat interX = (self.view.width - buttonW*col)/5;
    for (NSInteger i = 0; i<self.wattingAddBtns.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"channel_grid_circle"] forState:UIControlStateNormal];
        button.tag = i;
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        NSString *content = self.wattingAddBtns[i];
        [button setTitle:content forState:UIControlStateNormal];
        if (content.length==4) {
            button.titleLabel.font = [UIFont systemFontOfSize:14];
        }else if (content.length == 5){
            button.titleLabel.font = [UIFont systemFontOfSize:13];
        }else{
            button.titleLabel.font = [UIFont systemFontOfSize:15];
        }
        CGFloat buttonX = interX + interX*(i%col) + buttonW*(i%col);
        CGFloat buttonY = interY + interY*(NSInteger)(i/col) + buttonH*(NSInteger)(i/col);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [button bk_addEventHandler:^(UIButton *sender) {
            NSString *new = self.wattingAddBtns[sender.tag];
            [self.addedBtns addObject:new];
            [self.wattingAddBtns removeObjectAtIndex:sender.tag];
//            [UIView animateWithDuration:1 animations:^{
                [self configTableHeaderView];
                [self configTableFotterView];
//            }];
        } forControlEvents:UIControlEventTouchUpInside];
        [footerView addSubview:button];
    }
    NSInteger row = (self.wattingAddBtns.count -1)/ 4 +1;
    CGFloat fotterViewH = row * buttonH + (row + 1)*interY;
    footerView.frame = CGRectMake(0, 0, self.view.width, fotterViewH);
    footerView.alpha = 0.8;
    self.tableView.tableFooterView = footerView;
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.contentView.backgroundColor = kRGBColor(233, 237, 242);
    cell.textLabel.text = @"点击加载更多栏目";
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.textLabel.textColor = [UIColor grayColor];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 27;
}




@end






























