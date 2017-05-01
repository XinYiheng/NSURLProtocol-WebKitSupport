//
//  CusURLProtocol.m
//  Http测试
//
//  Created by XinWeizhou on 2017/4/28.
//  Copyright © 2017年 XinWeizhou. All rights reserved.
//

#import "CusURLProtocol.h"

@implementation CusURLProtocol
+ (BOOL)canInitWithRequest:(NSURLRequest *)request {
    
    if ([request.URL.absoluteString isEqualToString:@"https://www.jiankang.com/detail/187282.shtml"]) {
        
        return YES;
    }
    return NO;
}
- (instancetype)initWithRequest:(NSURLRequest *)request cachedResponse:(NSCachedURLResponse *)cachedResponse client:(id<NSURLProtocolClient>)client {
    NSMutableURLRequest *mrequest = request.mutableCopy;
    mrequest.URL = [NSURL URLWithString:@"http://www.baidu.com"];
    NSLog(@"-------request-------%@",request);
    return [super initWithRequest:request cachedResponse:cachedResponse client:client];
}
// 可以对request进行修改
+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    NSMutableURLRequest *mrequest = request.mutableCopy;
    mrequest.URL = [NSURL URLWithString:@"http://www.baidu.com"];
    return mrequest;
}
- (void)startLoading {
    
    [NSURLConnection sendAsynchronousRequest:self.request queue:[NSOperationQueue new] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        [self.client URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageAllowed];
        [self.client URLProtocol:self didLoadData:data];
        [self.client URLProtocolDidFinishLoading:self];
    }];
}
- (void)stopLoading {

}
@end
