//
//  BaiKeViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaiKeViewController.h"
#import "YLImageView.h"
#import "ToolMenuViewModel.h"
#import "TuWanHtmlViewController.h"
#import "BestGroupViewController.h"
#import "ZBCategoryViewController.h"
#import "SumAbilityViewController.h"

#pragma mark BaiKeCell
@interface BaiKeCell : UITableViewCell
@property(nonatomic,strong) YLImageView *iconView;
@property(nonatomic,strong) UILabel *nameLb;
@end

@implementation BaiKeCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = 1;
    }
    return self;
}
- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.iconView.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    return _nameLb;
}

- (YLImageView *)iconView {
    if(_iconView == nil) {
        _iconView = [[YLImageView alloc] init];
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(36, 36));
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(0);
        }];
    }
    return _iconView;
}
@end

#pragma BaiKeViewController
@interface BaiKeViewController ()<UITableViewDelegate,UITableViewDataSource>
/** viewmodel */
@property(nonatomic,strong) ToolMenuViewModel *toolVM;
/** table */
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation BaiKeViewController

- (id)init{
    if (self=[super init]) {
        self.navigationItem.title=@"游戏百科";
    }
    return self;
}

/** 实现viewmodel懒加载 */
- (ToolMenuViewModel *)toolVM {
    if(_toolVM == nil) {
        _toolVM = [[ToolMenuViewModel alloc] init];
    }
    return _toolVM;
}
/** 实现tableView懒加载：设置代理、去掉多余cell、头部刷新、
 注册cell*/
- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[BaiKeCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.tableFooterView = [UIView new];
        _tableView.rowHeight = 52;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.toolVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView reloadData];
                }
                [_tableView.header endRefreshing];
            }];
        }];
    }
    return _tableView;
}

#pragma mark - UITableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.toolVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaiKeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.iconView.imageView setImageWithURL:[self.toolVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.nameLb.text = [self.toolVM titleForRow:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.toolVM itemTypeForRow:indexPath.row] == ToolMenuItemTypeWeb) {
        TuWanHtmlViewController *vc=[[TuWanHtmlViewController alloc] initWithURL:[self.toolVM webURLForRow:indexPath.row]];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        if ([[self.toolVM tagForRow:indexPath.row] isEqualToString:@"best_group"]) {
            BestGroupViewController *vc = [BestGroupViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        if ([[self.toolVM tagForRow:indexPath.row] isEqualToString:@"item"]) {
            ZBCategoryViewController *vc = [ZBCategoryViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        if ([[self.toolVM tagForRow:indexPath.row] isEqualToString:@"sum_ability"]) {
            SumAbilityViewController *vc = [SumAbilityViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    [self.tableView.header beginRefreshing];
}


@end








