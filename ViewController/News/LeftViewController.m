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
#import "YLTabBarController.h"
#import "TuWanViewController.h"
#import "DuoWanTabBarController.h"

@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIImageView *bgImageView;
@property(nonatomic,strong)NSArray *tableListArr;

/*  头像 */
@property(nonatomic,strong)UIButton *headButton;

/* 名称，个性签名 */
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *singleLabel;

/* 指针 */
@property(nonatomic,strong)UILabel *zhiZhenLabel;
@property(nonatomic,strong)UILabel *fenzhen;
@property(nonatomic,strong)UILabel *shizhen;

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
    
    /* 配置头像等文件 */
    [self configMyMessage];
    
    [self congigAnimation];
    
    self.tableListArr = @[@"游戏相关",@"个性音乐",@"多玩盒子",@"美女瀑布"];

    [self.bgImageView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 200));
        make.left.mas_equalTo(30);
        make.centerY.mas_equalTo(0);
    }];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(rotation) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:60.0 target:self selector:@selector(rotation1) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:3600.0 target:self selector:@selector(rotation2) userInfo:nil repeats:YES];
}

-(void)congigAnimation{
    /* 获取当前系统时间 */
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dataTime = [formater stringFromDate:[NSDate date]];
    
    NSInteger shi = [dataTime substringWithRange:NSMakeRange(11, 2)].integerValue;
    NSInteger fen = [dataTime substringWithRange:NSMakeRange(14, 2)].integerValue;
    NSInteger miao = [dataTime substringWithRange:NSMakeRange(17, 2)].integerValue;
    
    /* 计算角度 */
    CGFloat hour = shi/24.0 * 2*M_PI;
    CGFloat minute = fen/60.0 * 2*M_PI;
    CGFloat second = miao / 60.0 * 2*M_PI;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timetime"]];
    [self.view addSubview:imageView];
    imageView.layer.cornerRadius = 80;
    imageView.layer.masksToBounds = YES;
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(35);
        make.bottom.mas_equalTo(-35);
        make.size.mas_equalTo(CGSizeMake(160, 160));
    }];
    
    UILabel *label = [UILabel new];
    self.zhiZhenLabel = label;
    label.backgroundColor = [UIColor blackColor];
    label.layer.bounds = CGRectMake(0, 0, 2, 50);
    label.layer.position = CGPointMake(80, 80);
    label.layer.anchorPoint = CGPointMake(0.5, 1);
    label.layer.transform = CATransform3DMakeRotation(hour, 0, 0, 1);
    label.layer.masksToBounds = YES;
    [imageView addSubview:label];
    
    UILabel *fenzhen = [UILabel new];
    self.fenzhen = fenzhen;
    fenzhen.backgroundColor = [UIColor blackColor];
    fenzhen.layer.bounds = CGRectMake(0, 0, 2, 40);
    fenzhen.layer.position = CGPointMake(80, 80);
    fenzhen.layer.anchorPoint = CGPointMake(0.5, 1);
    fenzhen.layer.transform = CATransform3DMakeRotation(minute, 0, 0, 1);
    fenzhen.layer.masksToBounds = YES;
    [imageView addSubview:fenzhen];
    
    UILabel *shizhen = [UILabel new];
    self.shizhen = shizhen;
    shizhen.backgroundColor = [UIColor blackColor];
    shizhen.layer.bounds = CGRectMake(0, 0, 2, 30);
    shizhen.layer.position = CGPointMake(80, 80);
    shizhen.layer.transform =CATransform3DMakeRotation(second, 0, 0, 1);
    shizhen.layer.anchorPoint = CGPointMake(0.5, 1);
    shizhen.layer.masksToBounds = YES;
    [imageView addSubview:shizhen];

    
    
}

-(void)rotation{
    self.zhiZhenLabel.layer.transform = CATransform3DRotate(self.zhiZhenLabel.layer.transform, 2*M_PI/60.0, 0, 0, 1);
}

-(void)rotation1{
    self.fenzhen.layer.transform = CATransform3DRotate(self.fenzhen.layer.transform, 2*M_PI/60.0, 0, 0, 1);
}

-(void)rotation2{
    self.shizhen.layer.transform = CATransform3DRotate(self.shizhen.layer.transform, 2*M_PI/60.0, 0, 0, 1);
}

-(void)configMyMessage{
    UIButton *headButton = [UIButton buttonWithType:0];
    self.headButton = headButton;
    [headButton setBackgroundImage:[UIImage imageNamed:@"headerheader"] forState:UIControlStateNormal];
    [headButton bk_addEventHandler:^(id sender) {
        NSLog(@"点击了头像");
    } forControlEvents:UIControlEventTouchUpInside];
    headButton.layer.cornerRadius = 23;
    headButton.layer.masksToBounds = YES;
    [self.view addSubview:headButton];
    [headButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.top.mas_equalTo(75);
        make.size.mas_equalTo(CGSizeMake(50, 44));
    }];
    
    UILabel *nameLabel = [UILabel new];
    nameLabel.text = @"Eleven";
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.font = [UIFont boldSystemFontOfSize:17];
    [self.view addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headButton.mas_right).mas_equalTo(10);
        make.top.mas_equalTo(87);
        
    }];
    
    UILabel *Label = [UILabel new];
    Label.text = @"关注天下新闻，全在天下新闻";
    Label.textColor = [UIColor whiteColor];
    Label.numberOfLines = 0;
    Label.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:Label];
    [Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.top.mas_equalTo(self.headButton.mas_bottom).mas_equalTo(10);
        
    }];

}

-(void)configBackgroundImage{
    UIImageView *bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftbg.jpg"]];
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
    }else if (indexPath.row == 2){
        DuoWanTabBarController *vc = [DuoWanTabBarController standardInstance];
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
