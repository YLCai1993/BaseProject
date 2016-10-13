//
//  RankListViewController.m
//  BaseProject
//
//  Created by YLCai on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RankListViewController.h"
#import "XiMaCategoryCell.h"
#import "XiMaCategoryViewModel.h"
#import "MusicListViewController.h"

@interface RankListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)XiMaCategoryViewModel *ximaVm;

@end
@implementation RankListViewController

-(XiMaCategoryViewModel *)ximaVm{
    if (!_ximaVm) {
        _ximaVm = [XiMaCategoryViewModel new];
    }
    return _ximaVm;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[XiMaCategoryCell class] forCellReuseIdentifier:@"cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _tableView;
}

+(id )defaultNavi{
    static RankListViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [RankListViewController new];
    });
    return vc;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"音乐TOP50";
    
//    [Factory addMenuItemToVC:self];
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.ximaVm refreshDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }else{
              [self.tableView reloadData];
            }
            //重置脚部 没有更多数据
            [_tableView.footer resetNoMoreData];
            [_tableView.header endRefreshing];
        }];
    }];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.ximaVm getMoreDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
                if (error.code == 999) {
                    [self.tableView.footer endRefreshingWithNoMoreData];
                }else{
                    [self.tableView.footer endRefreshing];
                }
            }else{
                [self.tableView reloadData];
            }
            [_tableView.footer endRefreshing];
        }];
    }];
    [self.tableView.header beginRefreshing];
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ximaVm.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XiMaCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.titleLb.text = [self.ximaVm titleForRow:indexPath.row];
    cell.descLb.text = [self.ximaVm descForRow:indexPath.row];
    cell.numberLb.text = [self.ximaVm numberForRow:indexPath.row];
    [cell.iconIV.imageView setImageWithURL:[self.ximaVm iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.orderLb.text  = @(indexPath.row + 1).stringValue;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MusicListViewController *vc = [[MusicListViewController alloc] initWithAlbumId:[self.ximaVm albumIdForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170/2;
}

@end






























