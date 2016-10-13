//
//  LeftViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LeftViewController.h"
#import "TuWanViewController.h"
#import "UIViewController+YQSlideMenu.h"
#import "RankListViewController.h"
#import "AlbumViewController.h"

@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIImageView *bgImageView;
@property(nonatomic,strong)NSArray *tableListArr;

@end

@implementation LeftViewController

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.backgroundView.backgroundColor = [UIColor clearColor];
        _tableView.bounces = NO;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /** 配置背景图片 */
    [self configBackgroundImage];
    self.tableListArr = @[@"游戏资讯",@"喜马拉雅",@"英雄联盟",@"美女瀑布"];

    [self.bgImageView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 200));
        make.left.mas_equalTo(30);
        make.centerY.mas_equalTo(0);
    }];
}

-(void)configBackgroundImage{
    UIImageView *bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"a4813741"]];
    self.bgImageView = bgImage;
    bgImage.userInteractionEnabled = YES;
    [self.view addSubview:bgImage];
    [bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(-30);
        make.bottom.right.mas_equalTo(30);
    }];
}

#pragma mark - UItableViewdelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins = NO;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        TuWanViewController *vc = [TuWanViewController standardRuWanNavi];
        vc.hidesBottomBarWhenPushed = YES;
        [self.slideMenuController showViewController:vc];
        vc.title = @"兔玩";
    }else if (indexPath.row == 1){
        RankListViewController *vc = [RankListViewController defaultNavi];
        vc.hidesBottomBarWhenPushed = YES;
        [self.slideMenuController showViewController:vc];
        
    }else if (indexPath.row ==3){
        AlbumViewController *vc = [AlbumViewController defaultAlbumViewController];
        vc.hidesBottomBarWhenPushed = YES;
        [self.slideMenuController showViewController:vc];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = self.tableListArr[indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:18];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

@end
