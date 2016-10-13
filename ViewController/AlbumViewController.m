//
//  AlbumViewController.m
//  BaseProject
//
//  Created by YLCai on 16/9/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumViewController.h"
#import "PSCollectionView.h"
#import "BeautifulViewModel.h"

@interface AlbumViewController ()<UIScrollViewDelegate,PSCollectionViewDelegate, PSCollectionViewDataSource>

@property(nonatomic,strong)PSCollectionView *collectionView;
@property(nonatomic,strong)BeautifulViewModel *vm;

@end

@implementation AlbumViewController

+(id)defaultAlbumViewController{
    static AlbumViewController *album = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        album = [[AlbumViewController alloc] init];
    });
    return album;
}

- (BeautifulViewModel *)vm{
    if (!_vm) {
        _vm = [BeautifulViewModel new];
    }
    return _vm;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"美女瀑布";
    
    self.collectionView = [[PSCollectionView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH)];
    self.collectionView.delegate = self;
    self.collectionView.collectionViewDelegate = self;
    self.collectionView.collectionViewDataSource = self;
    
    CGRect frame = self.collectionView.frame;
    frame.origin.y = 20;
    self.collectionView.frame = frame;
    self.collectionView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    
    
    [self.view addSubview:self.collectionView];
    
    
    //设置竖向 两行
    self.collectionView.numColsPortrait = 2;
    
    //获取数据
    [self getData];
}

-(void)getData{
    //头部刷新
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.vm refreshDataCompletehandle:^(NSError *error) {
            //AF是回调 是在主线程中
            [self.collectionView reloadData];
            if (error) {
                [self showErrorMsg:error.description];
            }
            [self.collectionView.header endRefreshing];
        }];
    }];
    [self.collectionView.header beginRefreshing];

    self.collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.vm getMoreBeautifulDataCompletehandle:^(NSError *error) {
            [self.collectionView reloadData];
            if (error) {
                [self showErrorMsg:error.description];
            }
            [self.collectionView.footer endRefreshing];
        }];
    }];
}

-(NSInteger)numberOfRowsInCollectionView:(PSCollectionView *)collectionView{
    return self.vm.rowNumber;
}

//返回每个Item的高度
-(CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index{
    AlbumDataModel *data = [self.vm.dataArr objectAtIndex:index];
    CGFloat width = data.coverWidth.floatValue;
    CGFloat height = data.coverHeight.floatValue;
    
    return (kWindowW/2 - 12) *height /width;
}

-(PSCollectionViewCell *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index{
    PSCollectionViewCell *cell = [collectionView dequeueReusableViewForClass:[PSCollectionViewCell class]];
    if (!cell) {
        cell = [[PSCollectionViewCell alloc] initWithFrame:CGRectZero];
        UIImageView *imageView = [UIImageView new];
        [cell addSubview:imageView];
        imageView.tag = 100;
    }
    
    UIImageView *iv = (UIImageView *)[cell viewWithTag:100];
    iv.frame = CGRectMake(0, 0, kWindowW/2 - 12, [self collectionView:collectionView heightForRowAtIndex:index]);
    [iv setImageWithURL:[self.vm iconForRow:index]];
    return cell;
}

@end





























































