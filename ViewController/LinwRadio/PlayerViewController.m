//
//  PlayerViewController.m
//  BaseProject
//
//  Created by YLCai on 16/9/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "PlayerViewController.h"
#import "VideoPlayerController.h"
#import "CommentVideo1Cell.h"
#import <UIButton+WebCache.h>
#import <UIImageView+WebCache.h>
#import "VideoViewModel.h"
#import "PictureView.h"

#define buttonW 50

@interface PlayerViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)VideoPlayerController *videoController;
@property(nonatomic,strong)UIView *bannerView;
@property(nonatomic,strong)VideoViewModel *vVM;
@property(nonatomic,strong)UIButton *selectedButton;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation PlayerViewController

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
       
    }
    return _tableView;
}

-(VideoViewModel *)vVM{
    if (!_vVM) {
        _vVM = [[VideoViewModel alloc] initWithRoomID:_roomID iszhiBo:_isZhiBo];
    }
    return _vVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerNib:[UINib nibWithNibName:@"CommentVideo1Cell" bundle:nil] forCellReuseIdentifier:@"cell6"];
    
    [self.view addSubview:self.tableView];
    NSString *videoURL = [self.vVM getURL];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        if (videoURL == nil) {
            make.top.mas_equalTo(160);
        }else{
            make.top.mas_equalTo(270);
        }
        
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    /*  获取数据  */
    [self getData];
    [self configBannerView];
}

-(void)configBannerView{
    NSLog(@"调用");
    NSString *videoURL = [self.vVM getURL];
    UIView *bannerView = [[UIView alloc] init];
        if (videoURL == nil) {
            bannerView.frame = CGRectMake(0, 120, self.view.width, 40);
        }else{
             bannerView.frame = CGRectMake(0, 230, self.view.width, 40);
        }

    bannerView.backgroundColor = [UIColor whiteColor];
    self.bannerView = bannerView;
    [self.view addSubview:bannerView];
    
    for (NSInteger i = 0; i<2; i++) {
        UIButton *zhiBoBUtton = [[UIButton alloc] initWithFrame:CGRectMake((self.view.width-2*buttonW+10)/2 + (buttonW + 10)*i,5, buttonW, 30)];
        zhiBoBUtton.backgroundColor = [UIColor whiteColor];
        [zhiBoBUtton setTitle:@[@"直播",@"聊天室"][i] forState:UIControlStateNormal];
        if (i == 0) {
            zhiBoBUtton.selected = YES;
            self.selectedButton = zhiBoBUtton;
            self.selectedButton.titleLabel.font = [UIFont systemFontOfSize:18];
            [self.selectedButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }else{
            zhiBoBUtton.titleLabel.font = [UIFont systemFontOfSize:16];
            [zhiBoBUtton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        }
        [zhiBoBUtton bk_addEventHandler:^(UIButton *sender) {
            self.selectedButton.selected = NO;
            sender.selected = YES;
            self.selectedButton = sender;
            [self.selectedButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            NSLog(@"点击了按钮");
        } forControlEvents:UIControlEventTouchUpInside];
        [bannerView addSubview:zhiBoBUtton];
    }
    UIButton *hidButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.width-35, 10, 25, 20)];
    [hidButton setBackgroundImage:[UIImage imageNamed:@"channel_nav_arrow"] forState:UIControlStateNormal];
    [bannerView addSubview:hidButton];
    
}

-(void)getData{
    
    [self.vVM getdataCompleteHandle:^(NSError *error) {
        [_tableView reloadData];
        /* 播放视频 */
        [self playerVideo];
    }];
        _tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.vVM getMoreDataCompleteHandle:^(NSError *error) {
            [_tableView.footer endRefreshing];
            [_tableView reloadData];
            if (error) {
                NSLog(@"error:%@",error);
            }
        }];
    }];    
}

-(void)playerVideo{
    
    UIButton *button = [UIButton buttonWithType:0];
    [button setBackgroundImage:[UIImage imageNamed:@"icon_back_highlighted"] forState:UIControlStateNormal];
    button.layer.cornerRadius = 22;
    [button bk_addEventHandler:^(id sender) {
        [self.videoController dismiss];
        [self dismissViewControllerAnimated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 10, 50, 45);

    
    NSString *videoURL = [self.vVM getURL];
    if (videoURL != nil) {
        [self playVideoWithURl:[NSURL URLWithString:[self.vVM getURL]]];
        [self.view addSubview:self.videoController.view];
         [self.videoController.view addSubview:button];
    }else{
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, 120)];
        imageView.backgroundColor = [UIColor redColor];
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.imageURL] placeholderImage:[UIImage imageNamed:@"contentview_imagebg_logo"]];
        [self.view addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        [imageView addSubview:button];
    }
   

}

-(void)playVideoWithURl:(NSURL *)url{
    if (!self.videoController) {
        self.videoController = [[VideoPlayerController alloc] initWithFrame:CGRectMake(0, 20, self.view.width, 210)];
    }
    self.videoController.contentURL = url;
}

#pragma  mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.vVM rowNumber];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"你啊后";
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 40)];
    label.text = [NSString stringWithFormat:@" %@",[self.vVM getSectionViewForSection:section]];
    label.font = [UIFont systemFontOfSize:13];
    label.backgroundColor = [UIColor colorWithRed:231/255.0 green:231/255.0 blue:231/255.0 alpha:1];
    label.textColor = [UIColor redColor];
    return label;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommentVideo1Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell6"];
    [cell.headButton sd_setBackgroundImageWithURL:[NSURL URLWithString:[self.vVM getHeadImagURLForRow:indexPath.section]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"contentview_pkbutton_red"]];
    cell.name.text = [self.vVM getTitleForRow:indexPath.section];
    cell.content.text = [self.vVM getContentForRow:indexPath.section];
    NSArray *images = [self.vVM contentPictureForSection:indexPath.section];
    NSMutableArray *asd = [NSMutableArray new];
    for (VideoMessageImagesModel *Model in images) {
        NSString *str = Model.fullSizeSrc;
        [asd addObject:str];
    }
    if (images == nil) {
       cell.BigImage.hidden = YES;
    }
    
    switch (images.count) {
        case 0:
            cell.threeBgView.hidden = YES;
            cell.twoBgView.hidden = YES;
            cell.bgView.hidden = YES;
            cell.BigImage.hidden = YES;
            break;
        case 1:{
            cell.threeBgView.hidden = YES;
            cell.twoBgView.hidden = YES;
            cell.bgView.hidden = YES;
            cell.BigImage.hidden = NO;
            VideoMessageImagesModel *imageModel = images[0];
            [cell.BigImage sd_setImageWithURL:[NSURL URLWithString:imageModel.fullSizeSrc] placeholderImage:[UIImage imageNamed:@"contentview_hd_loading_logo"]];
        }
            break;
        case 2:{
            cell.threeBgView.hidden = YES;
            cell.twoBgView.hidden = NO;
            cell.bgView.hidden = YES;
            cell.BigImage.hidden = YES;
            VideoMessageImagesModel *imageModel = images[0];
            [cell.twoOnePic sd_setImageWithURL:[NSURL URLWithString:imageModel.fullSizeSrc] placeholderImage:[UIImage imageNamed:@"contentview_hd_loading_logo"]];
            imageModel = images[1];
            [cell.twoTwoPic sd_setImageWithURL:[NSURL URLWithString:imageModel.fullSizeSrc] placeholderImage:[UIImage imageNamed:@"contentview_hd_loading_logo"]];
        }
            break;
        case 3:{
            cell.threeBgView.hidden = NO;
            cell.twoBgView.hidden = YES;
            cell.bgView.hidden = YES;
            cell.BigImage.hidden = YES;
            VideoMessageImagesModel *imageModel = images[0];
            [cell.threeOnePic sd_setImageWithURL:[NSURL URLWithString:imageModel.fullSizeSrc] placeholderImage:[UIImage imageNamed:@"contentview_hd_loading_logo"]];
            imageModel = images[1];
            [cell.threeTwoPic sd_setImageWithURL:[NSURL URLWithString:imageModel.fullSizeSrc] placeholderImage:[UIImage imageNamed:@"contentview_hd_loading_logo"]];
            imageModel = images[2];
            [cell.threeThreePic sd_setImageWithURL:[NSURL URLWithString:imageModel.fullSizeSrc] placeholderImage:[UIImage imageNamed:@"contentview_hd_loading_logo"]];
        }
            break;
        case 4:{
            cell.threeBgView.hidden = YES;
            cell.twoBgView.hidden = YES;
            cell.bgView.hidden = NO;
            cell.BigImage.hidden = YES;
            VideoMessageImagesModel *imageModel = images[0];
            [cell.onePic sd_setImageWithURL:[NSURL URLWithString:imageModel.fullSizeSrc] placeholderImage:[UIImage imageNamed:@"contentview_hd_loading_logo"]];
            imageModel = images[1];
            [cell.twoPic sd_setImageWithURL:[NSURL URLWithString:imageModel.fullSizeSrc] placeholderImage:[UIImage imageNamed:@"contentview_hd_loading_logo"]];
            imageModel = images[2];
            [cell.threePic sd_setImageWithURL:[NSURL URLWithString:imageModel.fullSizeSrc] placeholderImage:[UIImage imageNamed:@"contentview_hd_loading_logo"]];
            imageModel = images[3];
            [cell.fourPic sd_setImageWithURL:[NSURL URLWithString:imageModel.fullSizeSrc] placeholderImage:[UIImage imageNamed:@"contentview_hd_loading_logo"]];
        }
            break;
        default:
            break;
    }
    
    if (images.count == 0 || images == nil) {
        cell.BigImage.hidden = YES;
    }else if(images.count == 1){
        cell.BigImage.hidden = NO;
        VideoMessageImagesModel *imageModel = images[0];
        [cell.BigImage sd_setImageWithURL:[NSURL URLWithString:imageModel.fullSizeSrc] placeholderImage:[UIImage imageNamed:@"contentview_hd_loading_logo"]];
        /*
        if (images.count<=4) {
            PictureView *pic = [PictureView new];
            pic.imagesURL = asd;
            [cell.bgView addSubview:pic];
            NSLog(@"cellheight:%lf",cell.bgView.height);
        }
         */
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.vVM cellHeightForSection:indexPath.section];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end























