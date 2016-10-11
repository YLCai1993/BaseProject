//
//  TopicViewController.m
//  BaseProject
//
//  Created by YLCai on 16/9/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TopicViewController.h"
#import "ScrollDisplayViewController.h"
#import "QuestionViewController.h"
#import "TopicsViewController.h"
#import "AttentionViewController.h"
#import "ResultViewController.h"

@interface TopicViewController ()<scrollDisplayViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

@property(nonatomic,strong)ScrollDisplayViewController *sdVC;
@property(nonatomic,strong)QuestionViewController *questionVC;
@property(nonatomic,strong)TopicsViewController *topicsVC;
@property(nonatomic,strong)AttentionViewController *attentionVC;

@end

@implementation TopicViewController

#pragma mark - lazy load
-(QuestionViewController *)questionVC{
    if (!_questionVC) {
        _questionVC = [[QuestionViewController alloc] init];
    }
    return _questionVC;
}

-(TopicsViewController *)topicsVC{
    if (!_topicsVC) {
        _topicsVC = [[TopicsViewController alloc] init];
    }
    return _topicsVC;
}

-(AttentionViewController *)attentionVC{
    if (!_attentionVC) {
        _attentionVC = [[AttentionViewController alloc] init];
    }
    return _attentionVC;
}

/*   配置滚动视图  */
-(ScrollDisplayViewController *)sdVC{
    if (!_sdVC) {
        NSArray *controllers = @[self.questionVC,self.topicsVC,self.attentionVC];
        _sdVC = [[ScrollDisplayViewController alloc] initWithViewControllers:controllers];
        _sdVC.autoCycle = NO;
        _sdVC.canCycle = NO;
        _sdVC.delegate = self;
        _sdVC.showPageControl = NO;
    }
    return _sdVC;
}

/*   该当前显示视图  */
- (IBAction)changeView:(UISegmentedControl *)sender {
    _sdVC.currentPage = sender.selectedSegmentIndex;
}

/*  点击搜索的响应事件  */
- (IBAction)searchClick:(UIBarButtonItem *)sender {
    ResultViewController *resultVC = [kStoryboard(@"Main") instantiateViewControllerWithIdentifier:@"ResultViewController"];
    resultVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:resultVC animated:YES];
    NSLog(@"点击了搜索按钮");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"话题";
    self.segment.layer.cornerRadius = 15;
    
    [self.view addSubview:self.sdVC.view];
    [self.sdVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}


#pragma mark - scrollDisplayViewControllerDelegate
-(void)scrollDisplayViewController:(ScrollDisplayViewController *)scrollDisplayViewController currentIdenx:(NSInteger)index{
    self.segment.selectedSegmentIndex = index;
    self.segment.selected = YES;
    NSLog(@"index:%ld",index);
}

@end

































