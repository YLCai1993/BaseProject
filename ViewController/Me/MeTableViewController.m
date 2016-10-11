//
//  MeTableViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MeTableViewController.h"
#import "MeTableHeaderView.h"
#import "SigInViewController.h"

@interface MeTableViewController ()

@end

@implementation MeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    
    /*  配置表头视图 */
    [self configTableHeaderView];
}

-(void)configTableHeaderView{
    MeTableHeaderView *headerView = [[NSBundle mainBundle] loadNibNamed:@"MeTableHeaderView" owner:nil options:nil].firstObject;
    [headerView.sigInButton bk_addEventHandler:^(id sender) {
         SigInViewController *sigInVc = [[SigInViewController alloc] initWithNibName:@"SigInViewController" bundle:nil];
        sigInVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:sigInVc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableHeaderView = headerView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return 3;
            break;
        case 2:
            return 4;
            break;
    }
    return 0;
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 6;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
