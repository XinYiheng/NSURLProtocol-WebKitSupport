//
//  ViewController.m
//  Http测试
//
//  Created by XinWeizhou on 2017/4/27.
//  Copyright © 2017年 XinWeizhou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDataDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSURLCache *urlCache = [NSURLCache sharedURLCache];
    [self makeRequest];
    NSHTTPCookieStorage *cookieStore = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *cookies = cookieStore.cookies;
    if (cookies.count) {
        NSLog(@"cookie = %@",cookies[0]);
    }
}
- (void)makeRequest {
    NSURLRequest *quest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.baidu.com"] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:10];
    NSURLConnection *connet = [[NSURLConnection alloc] initWithRequest:quest delegate:self];
    [connet start];
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"response = %@",response);
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"data = %@",data);
}
//- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse {
//    NSLog(@"cachedResponse = %@",cachedResponse);
//    return cachedResponse;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
