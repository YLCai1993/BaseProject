//
//  DetailQuestionViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailQuestionViewController.h"
#import "DetailQuestionCell.h"
#import "DetailTopicHeaderView.h"
#import "DetailQuestionViewModel.h"
#import "DetailQuestionExpertView.h"
#import <UIImageView+WebCache.h>

@interface DetailQuestionViewController ()<UITableViewDelegate,UITableViewDataSource>

/* 请求数据工具 */
@property(nonatomic,strong)DetailQuestionViewModel *DQVM;

@property(nonatomic,strong)UITableView *tableView;

/*  顶部视图 */
@property(nonatomic,strong)UIView *topView;

/*  顶部专家介绍 */
@property(nonatomic,strong)DetailTopicHeaderView *headerView;

/*  专家信息 */
@property(nonatomic,strong)DetailQuestionExpertView *expertView;

@end

@implementation DetailQuestionViewController

-(DetailQuestionViewModel *)DQVM{
    if (!_DQVM) {
        _DQVM = [[DetailQuestionViewModel alloc] initWithID:self.ID];
    }
    return _DQVM;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(instancetype)initWithID:(NSString *)ID{
    if (self = [super init]) {
        self.ID = ID;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /*  注册cell */
    [self.tableView registerNib:[UINib nibWithNibName:@"DetailQuestionCell" bundle:nil] forCellReuseIdentifier:@"DetailQuestionCell"];
    self.topView = [UIView new];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(333);
    }];
    /*  获取数据  */
    [self getData];
    
    /* 添加手势 */
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
}

-(void)swipe:(UISwipeGestureRecognizer *)gr{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)getData{
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.DQVM getDetailTopicDataFromComleteHandle:^(NSError *error) {
            [_tableView reloadData];
            [_tableView.header endRefreshing];
            if (error) {
                NSLog(@"error:%@",error);
            }
            /** 配置头部数据 */
            [self configHeaderView];
        }];
    }];
    [_tableView.header beginRefreshing];

}

-(void)configHeaderView{
    self.topView.frame = CGRectMake(0, 0, kWindowW, 333);
    [self.view addSubview:self.topView];
    
    DetailTopicHeaderView *headerView = [[NSBundle mainBundle] loadNibNamed:@"DetailTopicHeaderView" owner:nil options:nil].firstObject;
    self.headerView = headerView;
    [headerView.bgImageView sd_setImageWithURL:[self.DQVM getHeaderVewImage] placeholderImage:[UIImage imageNamed:@"contentview_imagebg_logo"]];
    headerView.titleLabel.hidden = YES;
    headerView.cntentLabel.text = [self.DQVM getContentStr];
    headerView.cntentLabel.font = [UIFont boldSystemFontOfSize:16];
    [headerView.cntentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(80);
    }];
    [headerView.backButton bk_addEventHandler:^(id sender) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    headerView.frame = CGRectMake(0, 0, kWindowW, 210);
    [self.topView addSubview:headerView];
    DetailQuestionExpertView *expertView = [[NSBundle mainBundle] loadNibNamed:@"DetailQuestionExpertView" owner:nil options:nil].firstObject;
    self.expertView = expertView;
    expertView.frame = CGRectMake(0, 210, kWindowW, 123);
    [expertView.headImageView sd_setImageWithURL:[self.DQVM getExpertHeaderImage] placeholderImage:[UIImage imageNamed:@"beautiful"]];
    expertView.nameLabel.text = [self.DQVM getExpertName];
    expertView.zhiYeLabel.text = [self.DQVM getExpertZhiYe];
    expertView.contentLable.text = [self.DQVM getExpertRecommand];
    [self.topView insertSubview:expertView belowSubview:headerView];
   
}

#pragma mark - UITableViewDetagate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0 ? [self.DQVM getRelateNews].count:[self.DQVM rowNumber];//[self.DQVM rowNumber]
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return section==0 ? @"相关新闻":@"265提问 83回复 进行中";
}
/*  表头视图的内容 */
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, 30)];
    UIImageView *imageView = [[UIImageView alloc] init];
    view.backgroundColor = [UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1];
    imageView.frame = CGRectMake(10, 9, 15, 12);
    [view addSubview:imageView];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 8, 120, 15)];
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor grayColor];
    [view addSubview:label];
    if (section == 0) {
        imageView.image = [UIImage imageNamed:@"old_tabbar_icon_news_normal"];
        label.text = @"相关新闻";
    }else{
        UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"最新",@"最热"]];
        segment.backgroundColor = [UIColor whiteColor];
        segment.tintColor = [UIColor redColor];
        segment.frame = CGRectMake(self.view.width-85, 0, 75, 30);
        segment.layer.cornerRadius = 5;
        [view addSubview:segment];
    }
    return view;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        }
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        NSArray *arr = [self.DQVM getRelateNews];
        if (arr.count != 0) {
                cell.textLabel.text = [self.DQVM getRelateNews][indexPath.row];
        }
        return cell;
    }else{
        /**  设置第二行的cell  */
        DetailQuestionCell *cell = [self cellforIndexPath:indexPath andTableView:tableView];
        return cell;
    }
}

-(DetailQuestionCell *)cellforIndexPath:(NSIndexPath *)indexPath andTableView:(UITableView *)tableView{
    DetailQuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailQuestionCell"];
    [cell.askHeadImageView sd_setImageWithURL:[self.DQVM getAskHeaderImageForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"beautiful"]];
    cell.askTitleLabel.text = [self.DQVM getAskNameForRow:indexPath.row];
    cell.askContentLabel.text = [self.DQVM getAskContentForRow:indexPath.row];
    [cell.answerHeadImageView sd_setImageWithURL:[self.DQVM getAnswerHeaderImageForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"beautiful"]];
    cell.answerTitleLabel.text = [self.DQVM getAnswerNameForRow:indexPath.row];
    cell.answerContentLabel.text = [self.DQVM getAnswerContentForRow:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
       return [self.DQVM cellHightForRow:indexPath.row];
    }else{
        return 50;
    }
}

#pragma mark -
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    
    if (offset.y < 273 && offset.y>0) {
    if (offset.y < 150) {
        self.topView.frame = CGRectMake(0,  -offset.y, kWindowW, 333);
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(333-offset.y);
        }];
        [UIView animateWithDuration:1.0f animations:^{
            [self.topView layoutIfNeeded];
            self.headerView.cntentLabel.alpha = 0;
            self.headerView.concernView.alpha = 0;
        } completion:^(BOOL finished) {
        }];
    }else{
        self.expertView.frame = CGRectMake(0, 210 - (offset.y-150), kWindowW, 123);
        self.headerView.frame = CGRectMake(0, offset.y - 150 + (offset.y-150), kWindowW, 210);
        self.topView.frame = CGRectMake(0,  -offset.y - (offset.y-150), kWindowW, 333);
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(333-offset.y);
        }];
    }
    }
    
    /* 当偏移量小于60时候,显示内容 */
    if (offset.y<60 && offset.y>0 ) {
        [UIView animateWithDuration:1.0f animations:^{
            self.headerView.cntentLabel.alpha = 1.0;
            self.headerView.concernView.alpha = 1.0;
        } completion:^(BOOL finished) {
        }];
    }
    
    if (offset.y < 20 && offset.y>0) {
        self.topView.frame = CGRectMake(0,  0, kWindowW, 333);
        self.headerView.frame = CGRectMake(0, 0, kWindowW, 210);
        self.expertView.frame = CGRectMake(0, 210, kWindowW, 123);
    }
}
@end



























