//
//  HeadLineViewController.m
//  BaseProject
//
//  Created by YLCai on 16/9/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeadLineViewController.h"
#import "ScrollDisplayViewController.h"
#import "DetailNormalViewController.h"
#import "DetailViewController.h"
#import "AdsViewController.h"
#import "HeadLineViewModel.h"
#import "NormalCell.h"
#import "OnePictureCell.h"
#import "ThreePictureCell.h"
#import "Global.h"

//将headLine添加到NewsViewController中
@interface HeadLineViewController ()<UITableViewDelegate,UITableViewDataSource,scrollDisplayViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)HeadLineViewModel *headLineVM;

@property(nonatomic,strong)ScrollDisplayViewController *sdVC;

@end

@implementation HeadLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self refresh];
}

-(void)configTableHeader{
    if (self.headLineVM.headImageURL.count == 0) {
        return;
    }
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 185)];
    [_sdVC removeFromParentViewController];
    
    NSMutableArray *arr = [NSMutableArray array];
    NSMutableArray *detail = [NSMutableArray array];
        for (AdsNewsModel *ads in self.headLineVM.headImageURL) {
            [arr addObject:[NSURL URLWithString:ads.imgsrc]];
        }
        //描述性文字
        for (AdsNewsModel *ads in self.headLineVM.headImageURL) {
            [detail addObject:ads.title];
        }
    _sdVC = [[ScrollDisplayViewController alloc] initWithImgPaths:arr];
    _sdVC.detailMessage = detail;
    _sdVC.canCycle = YES;
    _sdVC.autoCycle = YES;
    if (self.headLineVM.headImageURL.count == 1) {
        _sdVC.showPageControl = NO;
    }
    _sdVC.delegate = self;
    [self addChildViewController:_sdVC];
    [headView addSubview:_sdVC.view];
    [_sdVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(headView);
    }];
    self.tableView.tableHeaderView = headView;
}

-(void)refresh{
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [_headLineVM refreshDataCompleteHandle:^(NSError *error) {
           [_tableView.header endRefreshing];
           [_tableView reloadData];
           if (error) {
               [self showErrorMsg:error.description];
           }
           [self configTableHeader];
       }];
    }];
    [_tableView.header beginRefreshing];
    
    _tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
       [self.headLineVM getMoreDataCompleteHandle:^(NSError *error) {
           if (error) {
               [self showErrorMsg:error.description];
           }
           [_tableView reloadData];
           [_tableView.footer endRefreshing];
       }];
    }];
}

#pragma mark - scrollDisplayViewControllerDelegate
-(void)scrollDisplayViewController:(ScrollDisplayViewController *)scrollDisplayViewController didSelectedIndex:(NSInteger)index{
    AdsViewController *vc = [[AdsViewController alloc] init];
    vc.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    AdsNewsModel *ads = self.headLineVM.headImageURL[index];
    vc.tag = ads.tag;
    if (!_className) {
        //ads.url网址链接的后面部分
        if ([ads.tag isEqualToString:@"doc"]) {
            vc.type = ads.url;
            adsStr = ads.url;
        }else{
            NSString *subStr = [ads.url substringFromIndex:9];
            vc.type = subStr;
            adsStr = subStr;
        }
    }else{
        NSString *subStr = [ads.url substringFromIndex:9];
        vc.type = subStr;
        adsStr = subStr;
    }
    [self presentViewController:vc animated:YES completion:nil];
    
}

#pragma mark - UITableViewdelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.headLineVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        NSArray *images = [self.headLineVM imgnewextraForRow:indexPath.row];
        if (!images) {
            NSString *tag = [self.headLineVM tagForRow:indexPath.row];
            if (tag == nil) {
                NormalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
                [cell.pictureView sd_setImageWithURL:[self.headLineVM iconForRow:indexPath.row]];
                cell.titleLabel.text = [self.headLineVM titleForRow:indexPath.row];
                cell.classLabel.text = [self.headLineVM classForRow:indexPath.row];
                cell.classLabel.hidden =[[self.headLineVM classForRow:indexPath.row] isEqualToString:@"#"] ? YES :NO;
                cell.commentLabel.text = [[self.headLineVM classForRow:indexPath.row] isEqualToString:@"#"] ?@"置顶":[self.headLineVM commentForRow:indexPath.row];
                //是否置顶，能删除
                if ([[self.headLineVM classForRow:indexPath.row] isEqualToString:@"#"]) {
//                    [cell.commentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//                        make.right.mas_equalTo(-10);
//                        make.bottom.mas_equalTo(-10);
//                    }];
                    cell.deleteButton.hidden = YES;
                    cell.commentLabel.textColor = [UIColor whiteColor];
                    cell.commentLabel.backgroundColor = [UIColor colorWithRed:72/255.0 green:134/255.0 blue:139/255.0 alpha:1];
                }else{
                    cell.commentLabel.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1];
                }
                  //非头条内容评论偏右
                if (self.headLineVM.className) {
                    [cell.commentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.right.bottom.mas_equalTo(-10);
                    }];
                    cell.deleteButton.hidden = YES;
                }
                return cell;
            }else{
                OnePictureCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
                [cell.onePictureView sd_setImageWithURL:[self.headLineVM iconForRow:indexPath.row]];
                cell.titleLabel.text = [self.headLineVM titleForRow:indexPath.row];
                cell.classLabel.text = [self.headLineVM classForRow:indexPath.row];
                cell.commentLabel.text = [self.headLineVM commentForRow:indexPath.row];
                if (self.headLineVM.className) {
                    [cell.commentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.right.bottom.mas_equalTo(-10);
                    }];
                    cell.deleteButton.hidden = YES;
                }
                return cell;
            }
        }else{
            ThreePictureCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
            [cell.pictureOneView sd_setImageWithURL:[self.headLineVM iconForRow:indexPath.row]];
            ImgnewextraNewsModel *model = [self.headLineVM imgnewextraForRow:indexPath.row][0];
            [cell.pictureTwoView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
            model = [self.headLineVM imgnewextraForRow:indexPath.row][1];
            [cell.pictureThreeView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
            cell.titleLabel.text = [self.headLineVM titleForRow:indexPath.row];
            cell.classLabel.text = [self.headLineVM classForRow:indexPath.row];
            cell.commentLabel.text = [self.headLineVM commentForRow:indexPath.row];
            if (self.headLineVM.className) {
                [cell.commentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.right.bottom.mas_equalTo(-10);
                }];
                cell.deleteButton.hidden = YES;
            }
            return cell;
        }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.headLineVM cellHeightForRow:indexPath.row];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *specialID1 = [self.headLineVM specialIdForRow:indexPath.row];
    if (specialID1) {
        DetailViewController *vc = [[DetailViewController alloc] init];
        vc.specialID = specialID1;
        specialID = specialID1;
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
         NSString *tag = [self.headLineVM tagForRow:indexPath.row];
        if (tag == nil) {
            DetailNormalViewController *vc = [[DetailNormalViewController alloc] init];
            vc.docId = [self.headLineVM docIdRow:indexPath.row];
            adsStr = [self.headLineVM docIdRow:indexPath.row];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            DetailNormalViewController *vc = [[DetailNormalViewController alloc] init];
            vc.docId = @"C1NHAO5600011229";
            adsStr = @"C1NHAO5600011229";
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

#pragma mark - lazy getter
-(HeadLineViewModel *)headLineVM{
    if (!_headLineVM) {
        _headLineVM = [[HeadLineViewModel alloc] initWithType:_type andClassName:_className];
    }
    return _headLineVM;
}

@end
