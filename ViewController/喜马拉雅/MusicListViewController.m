//
//  MusicListViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MusicListViewController.h"
#import "XiMaAlbumViewModel.h"
#import "MusicDetailCell.h"
#import "PlayMuiscView.h"

@interface MusicListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) XiMaAlbumViewModel *albumVM;
@property(nonatomic,strong) UITableView *tableView;

@end

@implementation MusicListViewController

-(instancetype)initWithAlbumId:(NSInteger)albumId{
    if (self = [super init]) {
        self.albumId = albumId;
    }
    return self;
}

-(XiMaAlbumViewModel *)albumVM{
    if (!_albumVM) {
        _albumVM = [[XiMaAlbumViewModel alloc] initWithAlbumId:_albumId];
    }
    return _albumVM;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.right.bottom.mas_equalTo(0);
            
        }];
        [_tableView registerClass:[MusicDetailCell class] forCellReuseIdentifier:@"MusicDetailCell"];
        _tableView.tableFooterView = [UIView new];
        //给个猜测的行高，让cell可以自行计算应该有的行高
        _tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
           [self.albumVM refreshDataCompletionHandle:^(NSError *error) {
               if (error) {
                   [self showSuccessMsg:error.localizedDescription];
            
               }else{
                   [_tableView reloadData];
                   [_tableView.footer resetNoMoreData];
               }
               [_tableView.header endRefreshing];
           }];
        }];
        _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
           [self.albumVM getMoreDataCompletionHandle:^(NSError *error) {
               if (error) {
                   [self showErrorMsg:error.localizedDescription];
               }else{
                   [_tableView reloadData];
                   if (self.albumVM.isHasMore) {
                       [_tableView.footer endRefreshing];
                   }else{
                       [_tableView.footer endRefreshingWithNoMoreData];
                   }
               }
           }];
        }];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Factory addBackItemToVC:self];
    [self.tableView.header beginRefreshing];
    
    /* 添加播放控制视图  */
    [self.view addSubview:[PlayMuiscView sharedInstance]];
    [[PlayMuiscView sharedInstance] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    /* 添加手势 */
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
}

-(void)swipe:(UISwipeGestureRecognizer *)gr{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UItableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.albumVM.rowNumber;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MusicDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MusicDetailCell"];
    [cell.coverIV.imageView setImageWithURL:[self.albumVM coverURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.titleLb.text = [self.albumVM titleForRow:indexPath.row];
    cell.timeLb.text = [self.albumVM timeForRow:indexPath.row];
    cell.sourceLb.text = [self.albumVM sourceForRow:indexPath.row];
    cell.playCountLb.text = [self.albumVM playCountForRow:indexPath.row];
    cell.favorCountLb.text = [self.albumVM favorCountForRow:indexPath.row];
    cell.commentCountLb.text = [self.albumVM commentCountForRow:indexPath.row];
    cell.durationLb.text = [self.albumVM durationForRow:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[PlayMuiscView sharedInstance] playerWithURl:[self.albumVM musicURLForRow:indexPath.row]];
    
}

@end





























