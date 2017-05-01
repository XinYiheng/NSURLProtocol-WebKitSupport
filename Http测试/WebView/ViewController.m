//
//  ViewController.m
//  WebView
//
//  Created by XinWeizhou on 2017/4/27.
//  Copyright © 2017年 XinWeizhou. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()<UIWebViewDelegate>
@property(nonatomic,strong) UIWebView *webView;
@property(nonatomic,strong) WKWebView *wkWebView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 500)];
    [self.view addSubview:webView];
    self.webView = webView;
    self.webView.delegate = self;
    self.wkWebView = [[WKWebView alloc] initWithFrame:webView.frame configuration:[WKWebViewConfiguration new]];
//    [self.view addSubview:self.wkWebView];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSHTTPCookieStorage *cookieStore = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//    [cookieStore setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyNever];
//    NSArray *cookies = cookieStore.cookies;
//    if (cookies.count) {
//        
//        NSLog(@"cookie = %@",cookies[0]);
//    }
//    
    NSArray * types =@[WKWebsiteDataTypeDiskCache,WKWebsiteDataTypeMemoryCache,WKWebsiteDataTypeCookies];
    NSSet *websiteDataTypes = [NSSet setWithArray:types];
    [[WKWebsiteDataStore defaultDataStore] fetchDataRecordsOfTypes:websiteDataTypes completionHandler:^(NSArray<WKWebsiteDataRecord *> * _Nonnull dataArray) {
        for (WKWebsiteDataRecord *record in dataArray) {
            NSLog(@"dataRecord = %@",record);
        }
        NSArray *array = dataArray;
    }];
    
    NSURLRequest *quest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://www.jiankang.com/detail/187282.shtml"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [self.webView loadRequest:quest];
//    [self.wkWebView loadRequest:quest];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"request = %@,",request);
    NSLog(@"type = %@,",request);
    
//    UIWebViewNavigationTypeLinkClicked,
//    UIWebViewNavigationTypeFormSubmitted,
//    UIWebViewNavigationTypeBackForward,
//    UIWebViewNavigationTypeReload,
//    UIWebViewNavigationTypeFormResubmitted,
//    UIWebViewNavigationTypeOther
    
    switch (navigationType) {
        case UIWebViewNavigationTypeLinkClicked:
            NSLog(@"UIWebViewNavigationTypeLinkClicked");
            break;
        case UIWebViewNavigationTypeFormSubmitted:
            NSLog(@"UIWebViewNavigationTypeFormSubmitted");
            break;
        case UIWebViewNavigationTypeBackForward:
            NSLog(@"UIWebViewNavigationTypeBackForward");
            break;
        case UIWebViewNavigationTypeReload:
            NSLog(@"UIWebViewNavigationTypeReload");
            break;
        case UIWebViewNavigationTypeFormResubmitted:
            NSLog(@"UIWebViewNavigationTypeFormResubmitted");
            break;
        case UIWebViewNavigationTypeOther:
            NSLog(@"UIWebViewNavigationTypeOther");
            break;
        default:
            break;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
