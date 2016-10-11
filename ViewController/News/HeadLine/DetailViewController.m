//
//  DetailViewController.m
//  BaseProject
//
//  Created by YLCai on 16/9/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailViewModel.h"
#import <UIImageView+WebCache.h>
#import "DetailCell.h"

#define buttonW 70
#define buttonH 30
#define col 4
#define interY 20

@interface DetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)DetailViewModel *DVVM;

@end

@implementation DetailViewController

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
    }
    return _tableView;
}

-(DetailViewModel *)DVVM{
    if (!_DVVM) {
        _DVVM = [[DetailViewModel alloc] initWithType:_specialID];
    }
    return _DVVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"top_navigation_shareicon"] style:UIBarButtonItemStylePlain target:self action:nil];
    [self.tableView registerNib:[UINib nibWithNibName:@"DetailCell" bundle:nil] forCellReuseIdentifier:@"cell4"];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.view.backgroundColor = [UIColor greenColor];
    [self getData];
}

-(void)getData{
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.DVVM refreshDataCompleteHandle:^(NSError *error) {
           [_tableView reloadData];
           [_tableView.header endRefreshing];
           if (error) {
               [self showErrorMsg:error.description];
           }
           [self cofigTableHeaderView];
       }];
    }];
    [_tableView.header beginRefreshing];
}
-(void)cofigTableHeaderView{
    self.navigationItem.title = [self.DVVM getNaviGationname];
    
    UIView *headerView = [UIView new];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 65)];
    [imageView sd_setImageWithURL:[self.DVVM getHeaderImageURL]];
    [headerView addSubview:imageView];
    
    NSArray *class = [self.DVVM getClassMessage];
    NSInteger number = class.count;
    if (class.count>=8) {
        number = 8;
    }
    CGFloat interX = (self.view.width - buttonW*col)/5;
    for (NSInteger i = 0; i<number; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"night_channel_compact_placeholder_inactive"] forState:UIControlStateNormal];
        button.tag = i;
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        NSString *content = class[i];
        if (i == 7) {
         [button setTitle:@"更多" forState:UIControlStateNormal];
        }else{
         [button setTitle:content forState:UIControlStateNormal];
        }
        
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        CGFloat buttonX = interX + interX*(i%col) + buttonW*(i%col);
        CGFloat buttonY = interY + interY*(NSInteger)(i/col) + buttonH*(NSInteger)(i/col) + 65;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [button bk_addEventHandler:^(id sender) {
            NSLog(@"点击了上方的按钮");
        } forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:button];
    }
    NSInteger row = (number-1) / 4 +1;
    CGFloat headerViewH = row * buttonH + (row + 1)*interY + 65;
    headerView.frame = CGRectMake(0, 0, self.view.width, headerViewH);
    headerView.alpha = 0.8;
    self.tableView.tableHeaderView  = headerView;
}

#pragma mark - UITableViewDelegate

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.width-10, 30)];
    label.font = [UIFont systemFontOfSize:14];
    label.backgroundColor = kRGBColor(230, 233, 235);
    label.text = [NSString stringWithFormat:@"  %ld/%ld %@",section+1,self.DVVM.sectionNumber,[self.DVVM titleForSection:section]];
    return label;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.DVVM.sectionNumber;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.DVVM rowNumberForSection:section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell4"];
    [cell.headImageView sd_setImageWithURL:[self.DVVM iconForIndexPath:indexPath]];
    cell.titleLabel.text = [self.DVVM titleForIndexPath:indexPath];
    cell.commentLabel.layer.cornerRadius = 10;
    cell.commentLabel.text = [self.DVVM commentForIndexPath:indexPath];
    return cell;
}
     
@end
