//
//  CellDetailViewController.m
//  LWS
//
//  Created by 张凯 on 16/7/19.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "CellDetailViewController.h"
#import "SVProgressHUD.h"
#import "DEFINE.h"

@interface CellDetailViewController ()<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation CellDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavTitle:@"攻略详细" leftImg:@"string" rightImg:nil bgColor:nil];
    self.nav.backgroundColor = [UIColor clearColor];
    

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlStr]]];
}

-(void)leftAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [SVProgressHUD dismiss];
}




#pragma mark - UIWebViewDelegate
#pragma mark 开始加载
- (void)webViewDidStartLoad:(UIWebView *)webView{
    // 应用程序的活动指示器
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [SVProgressHUD showWithStatus:@"网页正在加载中..."];
}

#pragma mark 加载完毕
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    // 关闭网络活动指示器
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [SVProgressHUD dismiss];
    
    //取得html内容
    NSString *titleStr = [_webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    //document.getElementsByClassName("download-banner")[0].style.display="none";//隐藏顶部
     //document.getElementsByClassName("tab-download-wrap")[0].style.display="none";//隐藏底部
    NSString *hiddenTop = @"document.getElementsByClassName('download-banner')[0].style.display='none'";
    NSString *hiddenBottom =@"document.getElementsByClassName('tab-download-wrap')[0].style.display='none'";
    //修改页面内容
    [_webView stringByEvaluatingJavaScriptFromString:hiddenTop];
    [_webView stringByEvaluatingJavaScriptFromString:hiddenBottom];
    
}

#pragma mark 加载失败
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [SVProgressHUD dismiss];
    NSLog(@"error detail:%@",error.localizedDescription);
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"系统提示" message:@"网络连接发生错误!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
