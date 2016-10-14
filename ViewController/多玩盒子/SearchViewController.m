//
//  SearchViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchDetailViewController.h"

@interface SearchViewController ()<UIWebViewDelegate>

@property(nonatomic,strong)UIWebView *webView;

@end

@implementation SearchViewController

-(UIWebView *)webView{
    if (!_webView) {
        _webView = [UIWebView new];
        [self.view addSubview:_webView];
        _webView.delegate = self;
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _webView;
}

- (id)init{
    if (self=[super init]) {
        self.title=@"召唤师查询";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"你好" style:UIBarButtonItemStylePlain target:self action:@selector(show:)];
    
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *path = @"http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView";
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:path]]];
}

-(void)show:(UIBarButtonItem *)item{
    NSLog(@"点击了你好按钮");
}

#pragma mark - UIWebViewDelegate
//如果返回NO，则不会加载请求
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //点击web中任意一项，跳转到下一页
    //如果当前webview加载的请求 不是当前页面的
    NSString *path = @"http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView";
    //request.URL.absoluteString当前请求的真实路径
    if (![request.URL.absoluteString isEqualToString:path]) {
        SearchDetailViewController *vc = [[SearchDetailViewController alloc] initWithRequest:request];
        [self.navigationController pushViewController:vc animated:YES];
        return NO;
    }
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self hideProgress];
}

@end















