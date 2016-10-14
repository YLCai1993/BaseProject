//
//  QuestionViewController.m
//  BaseProject
//
//  Created by YLCai on 16/9/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "QuestionViewController.h"
#import "QuestionChannelViewModel.h"
#import "QuestionViewModel.h"
#import <UIButton+WebCache.h>
#import <UIImageView+WebCache.h>
#import "DetailQuestionViewController.h"
#import "QuestionCell.h"
#define buttonW 41
#define buttonH 41
#define col 5
#define interY 33


@interface QuestionViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
//获取横幅内容
@property(nonatomic,strong)QuestionChannelViewModel *qcVM;
//获取下方内容
@property(nonatomic,strong)QuestionViewModel *qVM;

@end

@implementation QuestionViewController

-(QuestionChannelViewModel *)qcVM{
    if (!_qcVM) {
        _qcVM = [[QuestionChannelViewModel alloc] init];
    }
    return _qcVM;
}

-(QuestionViewModel *)qVM{
    if (!_qVM) {
        _qVM = [[QuestionViewModel alloc] init];
    }
    return _qVM;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /*  注册cell  */
    [self.tableView registerNib:[UINib nibWithNibName:@"QuestionCell" bundle:nil] forCellReuseIdentifier:@"QuestionCell"];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(64);
    }];
    
    /*  获取横幅数据 */
    [self getChannelData];
    /*  获取下方数据 */
    [self getgata];
}


-(void)getgata{
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.qVM getTopicsDataCompleteHandle:^(NSError *error) {
           [_tableView.header endRefreshing];
           [_tableView reloadData];
           if (error) {
               NSLog(@"error:%@",error);
           }
       }];
    }];
    [_tableView.header beginRefreshing];
    
    _tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
       [self.qVM getMoreTopcisDataCompleteHandle:^(NSError *error) {
           [_tableView.footer endRefreshing];
           [_tableView reloadData];
           if (error) {
               NSLog(@"error:%@",error);
           }
       }];
    }];
}

-(void)getChannelData{
    [self.qcVM getChannelDataCompleteHandle:^(NSError *error) {
        if (error) {
            NSLog(@"error:%@",error);
        }
        [self configTableView];
    }];
}

-(void)configTableView{
    
    UIView *headerView = [[UIView alloc] init];
    CGFloat interX = (self.view.width - buttonW*col)/(col+1);
    NSArray *picNames = [self.qcVM getItemsPcitureURL];
    NSArray *itemsNames = [self.qcVM getItemsNames];
    CGFloat lasteY = 0;
    for (NSInteger i = 0; i<picNames.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button sd_setBackgroundImageWithURL:[NSURL URLWithString:picNames[i]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"bitmap_300*200"]];
        button.tag = i;
        button.layer.cornerRadius = 5;
        button.layer.masksToBounds = YES;
        CGFloat buttonX = interX + interX*(i%col) + buttonW*(i%col);
        CGFloat buttonY = 12 + interY*(NSInteger)(i/col) + buttonH*(NSInteger)(i/col);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [button bk_addEventHandler:^(UIButton *sender) {
#warning 这里需要修改
            NSLog(@"点击了上8888方的按钮");
        } forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:button];
        
        UILabel *label = [[UILabel alloc] init];
        label.text = itemsNames[i];
        label.textColor = [UIColor darkGrayColor];
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        CGFloat labelX = interX + interX*(i%col) + buttonW*(i%col);
        CGFloat labelY = 12 + buttonH + (5+buttonH)*(NSInteger)(i/col) + 28*(NSInteger)(i/col);
        label.frame = CGRectMake(labelX, labelY, buttonW, 28);
        [headerView addSubview:label];
        lasteY = CGRectGetMaxY(label.frame);
    }
    
    UIButton *showBtn = [UIButton buttonWithType:0];
    [showBtn setBackgroundImage:[UIImage imageNamed:@"channel_nav_arrow"] forState:UIControlStateNormal];
    [showBtn bk_addEventHandler:^(id sender) {
        NSLog(@"收起");
    } forControlEvents:UIControlEventTouchUpInside];
    showBtn.size = CGSizeMake(25, 20);
    showBtn.x = self.view.width/2 - showBtn.width/2;
    showBtn.y = lasteY;
    [headerView addSubview:showBtn];
    
    NSInteger row = (picNames.count-1) / 5 +1;
    CGFloat headerViewH = row * buttonH + (row + 1)*interY;
    headerView.frame = CGRectMake(0, 0, self.view.width, headerViewH);
    headerView.alpha = 0.8;
   
    self.tableView.tableHeaderView = headerView;

}

#pragma mark - UItableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.qVM getRowNumber];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 8;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.qVM cellHeightForRow:indexPath.section];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuestionCell"];
    [cell.headerImageView sd_setImageWithURL:[NSURL URLWithString:[self.qVM getHeadImageForSection:indexPath.section]] placeholderImage:[UIImage imageNamed:@"error"]];
    cell.name.text = [self.qVM getNameForSection:indexPath.section];
    cell.niName.text = [self.qVM getNiNameForSection:indexPath.section];
    [cell.contentImage sd_setImageWithURL:[NSURL URLWithString:[self.qVM getContentImageForSection:indexPath.section]] placeholderImage:[UIImage imageNamed:@"bitmap_300*200"]];
    cell.classLabel.text = [self.qVM getClassNameForSection:indexPath.section];
    cell.concernLabel.text = [self.qVM getConcernFoSection:indexPath.section];
    cell.contentlabel.text = [self.qVM getContentForSection:indexPath.section];
    cell.questionLabel.text = [self.qVM getQuestionForSection:indexPath.section];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    NSLog(@"******:%@",[self.qVM getexperIDForRow:indexPath.section]);
    
    [self.delegate questionViewController:self didSendExpertID:[self.qVM getexperIDForRow:indexPath.section]];
    
}

@end












