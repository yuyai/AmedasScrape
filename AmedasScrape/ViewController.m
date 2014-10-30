//
//  ViewController.m
//  AmedasScrape
//
//  Created by 岩田裕也 on 2014/10/26.
//  Copyright (c) 2014年 Yuya IWATA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // UIWebViewのインスタンス化
    CGRect rect = self.view.frame;
    UIWebView *webView = [[UIWebView alloc]initWithFrame:rect];
    
    // Webページの大きさを自動的に画面にフィットさせる
    webView.scalesPageToFit = YES;
    webView.scrollView.scrollEnabled = YES;
    
    // デリゲートを指定
    webView.delegate = self;
    
    // URLを指定
    NSURL *url = [NSURL URLWithString:@"http://www.jma.go.jp/jp/amedas_h/today-40341.html?areaCode=000&groupCode=26"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // リクエストを投げる
    [webView loadRequest:request];
    
    // UIWebViewのインスタンスをビューに追加
    [self.view addSubview:webView];
}

/**
 * Webページのロード時にインジケータを動かす
 */
- (void)webViewDidStartLoad:(UIWebView*)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}


/**
 * Webページのロード完了時にインジケータを非表示にする
 */
- (void)webViewDidFinishLoad:(UIWebView*)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
