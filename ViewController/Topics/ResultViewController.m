//
//  ResultViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ResultViewController.h"
#import "ConcernCell.h"

@interface ResultViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *lefttableView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;

@property(nonatomic,strong)NSMutableArray *classArray;

@end

@implementation ResultViewController

-(NSMutableArray *)classArray{
    if (!_classArray) {
        _classArray = [@[@"法律",@"健康",@"汽车",@"财经",@"历史",@"时政",@"体育",@"军事",@"旅游",@"房产",@"科技",@"教育",@"娱乐",@"生活",@"时尚"] copy];
    }
    return _classArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rightTableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    /*   隐藏滚动条   */
    self.lefttableView.showsVerticalScrollIndicator = NO;
    self.rightTableView.showsVerticalScrollIndicator = NO;
    
    /*   右边的tableView注册   */
    [self.rightTableView registerNib:[UINib nibWithNibName:@"ConcernCell" bundle:nil] forCellReuseIdentifier:@"ConcernCell"];
}

#pragma mark - UItableViewdelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.lefttableView) {
        return 60;
    }
    return 70;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.lefttableView) {
       return self.classArray.count;
    }else{
        return arc4random_uniform(15);
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView == self.lefttableView) {
        self.rightTableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.lefttableView.header endRefreshing];
           [self.rightTableView reloadData];
        }];
        [self.lefttableView.header beginRefreshing];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _lefttableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        }
        cell.textLabel.text = self.classArray[indexPath.row];
        cell.textLabel.textColor = [UIColor grayColor];
        return cell;
    }else{
        ConcernCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ConcernCell"];
        cell.titleLabel.text = @"姓名";
        cell.tagLabel.hidden = NO;
        return cell;
    }
}

@end
