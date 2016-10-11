//
//  ClassViewController.m
//  BaseProject
//
//  Created by YLCai on 16/9/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ClassViewController.h"
#import "LineRadioViewController.h"
#import "ClassViewModel.h"
#import <UIImageView+WebCache.h>
#import "PlayerViewController.h"
#import "RadioCell.h"
#define buttonW 62
#define buttonH 30
#define col 5
#define interY 12

@interface ClassViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIButton *seleceButton;
@property(nonatomic,strong)ClassViewModel *cVM;
@property(nonatomic,strong)LineRadioViewController *LRVC;
@property(nonatomic,strong)PlayerViewController *vc;

@end

@implementation ClassViewController

-(LineRadioViewController *)LRVC{
    if (!_LRVC) {
        _LRVC = [[LineRadioViewController alloc] init];
     }
    return _LRVC;
}

-(ClassViewModel *)cVM{
    if (!_cVM) {
        _cVM = [[ClassViewModel alloc] init];
    }
    return _cVM;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"RadioCell" bundle:nil] forCellReuseIdentifier:@"RadioCell"];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.bottom.mas_equalTo(0);
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self getdata];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(changeToClass)];
    swipe.direction=UISwipeGestureRecognizerDirectionRight;
    [self.tableView addGestureRecognizer:swipe];
}

-(void)changeToClass{
    [self.delegate classViewController:self sendIndex:0];
}

-(void)getTableData{
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.cVM getTableViewDataCompleteHandle:^(NSError *error) {
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
        }];
    }];
    [_tableView.header beginRefreshing];
   
    _tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.cVM getMoreDataCompleteHandle:^(NSError *error) {
            [self.tableView reloadData];
            [self.tableView.footer endRefreshing];
        }];
    }];
}

-(void)getdata{
    [self.cVM getChannelDataCompleteHandle:^(NSError *error) {
        [self.tableView reloadData];
        [self configTableView];
    }];
}

-(void)configTableView{
    UIView *headerView = [[UIView alloc] init];
    
    CGFloat interX = (self.view.width - buttonW*col)/(col+1);
    NSArray *names = [self.cVM getnames];
    NSArray *IDS = [self.cVM getIds];
    for (NSInteger i = 0; i<names.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"channel_grid_circle"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        button.tag = i;
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        NSString *content = names[i];
        [button setTitle:content forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        CGFloat buttonX = interX + interX*(i%col) + buttonW*(i%col);
        CGFloat buttonY = interY + interY*(NSInteger)(i/col) + buttonH*(NSInteger)(i/col);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [button bk_addEventHandler:^(UIButton *sender) {
            self.seleceButton.selected = NO;
            sender.selected = YES;
            NSString *ID = IDS[sender.tag];
            self.cVM.ID = ID.integerValue;
            self.seleceButton = sender;
            /*  获取表格数据  */
            [self getTableData];
            NSLog(@"点击了上方的按钮");
        } forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:button];
        if (i == 0) {
            button.selected = YES;
            self.seleceButton = button;
            NSString *ID = IDS[0];
            self.cVM.ID = ID.integerValue;
//            NSLog(@"id:%ld",self.cVM.ID);
        }
        
    }
    NSInteger row = (names.count-1) / 5 +1;
    CGFloat headerViewH = row * buttonH + (row + 1)*interY;
    headerView.frame = CGRectMake(0, 0, self.view.width, headerViewH);
    headerView.alpha = 0.8;
    self.tableView.tableHeaderView  = headerView;
    
    /*  获取表格数据  */
    [self getTableData];
}

#pragma mark - UITableViewdelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    NSLog(@"rowNumger:%ld",[self.cVM rowNumber]);
    return [self.cVM rowNumber];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RadioCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RadioCell"];

    [cell.bgImage sd_setImageWithURL:[NSURL URLWithString:[self.cVM getBgImageForRow:indexPath.row]] placeholderImage:[UIImage imageNamed:@"angle-mask"]];
    cell.contentLabel.text = [self.cVM getRoomNameForRow:indexPath.row];
    BOOL isZhiBo = [self.cVM isZhiBoForRow:indexPath.row];
    if (isZhiBo) {
        cell.zhiBoLabel.text = @"直播";
        cell.zhiBoLabel.backgroundColor = [UIColor redColor];
    }else{
       cell.zhiBoLabel.text = @"回顾";
        cell.zhiBoLabel.backgroundColor = [UIColor grayColor];
    }
    cell.apartLabel.text = [self.cVM apartiNumberForRow:indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BOOL isZhiBo = [self.cVM isZhiBoForRow:indexPath.row];
    PlayerViewController *vc = [[PlayerViewController alloc] init];
    self.vc = vc;
    vc.roomID = [NSString stringWithFormat:@"%ld",[self.cVM getRoomIDForRow:indexPath.row]];
    vc.isZhiBo = isZhiBo;
    if (isZhiBo) {
        [self presentViewController:vc animated:YES completion:nil];
    }else{
        NSLog(@"不是直播");
        [self presentViewController:vc animated:YES completion:nil];
        vc.imageURL =[self.cVM getBgImageForRow:indexPath.row];
    }
    
}

@end








































