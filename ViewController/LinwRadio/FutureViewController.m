//
//  FutureViewController.m
//  BaseProject
//
//  Created by YLCai on 16/9/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "FutureViewController.h"
#import "HeadRadioModel.h"
#import "FutureCell.h"

@interface FutureViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation FutureViewController

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"直播预告";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tabbar_icon_refresh"] style:UIBarButtonItemStylePlain target:self action:@selector(refresh)];
    [self.tableView registerNib:[UINib nibWithNibName:@"FutureCell" bundle:nil] forCellReuseIdentifier:@"FutureCell"];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}
/*  刷新操作 */
-(void)refresh{
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tableView.header endRefreshing];
    }];
}

#pragma amrk - UITabeViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.futureLineRadios.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"最近直播";
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HeadFutureModel *model = self.futureLineRadios[indexPath.row];
    FutureCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FutureCell"];
    NSString *time = model.startTime;
    NSString *detailTime  = [time substringWithRange:NSMakeRange(11, 5)];
    cell.Linetime.text = detailTime;
    cell.Linecontent.text = model.roomName;
    return cell;
}

@end

































