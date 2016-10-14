//
//  SearchDetailViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "SearchDetailViewController.h"

@interface SearchDetailViewController ()<UIWebViewDelegate>

@property(nonatomic,strong)UIWebView *webView;

@end

@implementation SearchDetailViewController

-(UIWebView *)webView{
    if (!_webView) {
        _webView = [UIWebView new];
        _webView.delegate = self;
        [self.view addSubview:self.webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _webView;
}

-(id)initWithRequest:(NSURLRequest *)request{
    if (self = [super init]) {
        self.request = request;
        //推出来不显示下方栏
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Factory addBackItemToVC:self];
    self.navigationItem.title = @"召唤师查询";
    [self.webView loadRequest:_request];
}

#pragma mark - UIWebViewDlegate
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //点击web中任意一项，跳转到下一页
    //如果当前webview加载的请求 不是当前页面的
    if (navigationType != 5) {
       SearchDetailViewController *vc = [[SearchDetailViewController alloc] initWithRequest:request];
        [self.navigationController pushViewController:vc animated:YES];
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
