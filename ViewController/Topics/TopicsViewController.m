//
//  TopicsViewController.m
//  BaseProject
//
//  Created by YLCai on 16/9/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TopicsViewController.h"
#import "TopicsViewModel.h"
#import <UIImageView+WebCache.h>
#import <UIButton+WebCache.h>
#import "DetailTopicsViewController.h"
#import "TopicsCell.h"

#define imageViewW 140
#define ImageViewH 92
#define inter 12
#define labelH 52

@interface TopicsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)TopicsViewModel *tVM;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation TopicsViewController

#pragma mark - lazy load
-(TopicsViewModel *)tVM{
    if (!_tVM) {
        _tVM = [[TopicsViewModel alloc] init];
    }
    return _tVM;
}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, 170)];
        _scrollView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
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
    [self.tableView registerNib:[UINib nibWithNibName:@"TopicsCell" bundle:nil] forCellReuseIdentifier:@"TopicsCell"];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(64);
    }];
    
    /*  获取表头数据  */
    [self getChannelData];
    /*  获取列表数据 */
    [self getData];
}

-(void)getData{
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.tVM getTopicsDataCompleteHandle:^(NSError *error) {
           [_tableView.header endRefreshing];
           [_tableView reloadData];
           if (error) {
               NSLog(@"error:%@",error);
           }
       }];
    }];
    [_tableView.header beginRefreshing];
    _tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
       [self.tVM getMoreTopicsDataCompleteHandle:^(NSError *error) {
           [_tableView.footer endRefreshing];
           [_tableView reloadData];
           if (error) {
               NSLog(@"error:%@",error);
           }
       }];
    }];
}

-(void)getChannelData{
    //140 92
    [self.tVM getTopicChannelCompleteaHandle:^(NSError *error) {
        if (error) {
            NSLog(@"error:%@",error);
        }
        [self configTableViewheader];
    }];
    
}

-(void)configTableViewheader{
    NSArray *images = [self.tVM getPictures];
    NSArray *names = [self.tVM getTopicName];
    if (images.count == 0 || images == nil) {
        return;
    }
    CGFloat maxY = 0;
    for (NSInteger i = 0; i<images.count; i++) {
        
        UIButton *button = [[UIButton alloc] init];
        [button sd_setBackgroundImageWithURL:[NSURL URLWithString:images[i]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"contentview_imagebg_logo"]];
        button.tag = i;
        CGFloat imageX = inter + (imageViewW + inter) * i;
        button.frame = CGRectMake(imageX, inter, imageViewW, ImageViewH);
        [self.scrollView addSubview:button];
        [button bk_addEventHandler:^(UIButton *sender) {
            NSLog(@"点击了第%ld个按钮",sender.tag);
        } forControlEvents:UIControlEventTouchUpInside];
        maxY = CGRectGetMaxX(button.frame);
        
        UILabel *label = [[UILabel alloc] init];
        label.text = [NSString stringWithFormat:@"# %@ #",names[i]];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:16];
        label.numberOfLines = 0;
        CGFloat labelY = inter + ImageViewH;
        label.backgroundColor = [UIColor whiteColor];
        label.frame = CGRectMake(imageX, labelY, imageViewW, labelH);
        [self.scrollView addSubview:label];
        
        
    }
    self.scrollView.contentSize = CGSizeMake(maxY + inter, 0);
    self.tableView.tableHeaderView = self.scrollView;
    
}

#pragma mark - UItableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.tVM.rowNumber;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 0 : 9;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 210;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TopicsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopicsCell"];
    cell.titleLabel.text = [self.tVM getTitleNameForSection:indexPath.section];
    [cell.head1ImageView sd_setImageWithURL:[NSURL URLWithString:[self.tVM getHead1ImageForSection:indexPath.section]] placeholderImage:[UIImage imageNamed:@"contentview_imagebg_logo"]];
    [cell.head2ImageView sd_setImageWithURL:[NSURL URLWithString:[self.tVM getHeadImage2ForSection:indexPath.section]] placeholderImage:[UIImage imageNamed:@"contentview_imagebg_logo"]];
    cell.comment1Label.text = [self.tVM getContent1ForSection:indexPath.section];
    cell.content2Label.text = [self.tVM getContent2ForSection:indexPath.section];
    cell.classLabel.text = [self.tVM getClassForSection:indexPath.section];
    cell.concernLabel.text = [self.tVM getConcernForSection:indexPath.section];
    cell.tablkLabel.text = [self.tVM getTalkForSection:indexPath.section];
 
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailTopicsViewController *vc = [[DetailTopicsViewController alloc] init];
    vc.subjectID = [self.tVM getSubjectIDForSection:indexPath.section];
    vc.hidesBottomBarWhenPushed = YES;
    [self presentViewController:vc animated:YES completion:nil];
    
}

@end

































