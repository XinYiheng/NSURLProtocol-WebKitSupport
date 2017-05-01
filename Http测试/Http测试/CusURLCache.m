//
//  CusURLCache.m
//  Http测试
//
//  Created by XinWeizhou on 2017/4/28.
//  Copyright © 2017年 XinWeizhou. All rights reserved.
//

#import "CusURLCache.h"

@implementation CusURLCache
- (NSCachedURLResponse *)cachedResponseForRequest:(NSURLRequest *)request {
    
    NSURL *url = [request URL];
    NSLog(@"request.string = %@",request.URL.absoluteString);
    if ([url.absoluteString isEqualToString:@"http://www.baidu.com/"]) {
        
        NSLog(@"request = %@",request);
        
        NSURLResponse *response =
        [[NSURLResponse alloc] initWithURL:url
                                  MIMEType:@"text/plain"
                     expectedContentLength:1
                          textEncodingName:nil];
        NSCachedURLResponse *cachedResponse =
        [[NSCachedURLResponse alloc] initWithResponse:response
                                                 data:[NSData dataWithBytes:"helloWorld" length:1]];
        [super storeCachedResponse:cachedResponse forRequest:request];
    }
    
    return [super cachedResponseForRequest:request];
    
    
//    if (cachedResponse) {
//        NSDate* cacheDate = cachedResponse.userInfo[CustomURLCacheExpirationKey];
//        NSDate* cacheExpirationDate = [cacheDate dateByAddingTimeInterval:CustomURLCacheExpirationInterval];
//        if ([cacheExpirationDate compare:[NSDate date]] == NSOrderedAscending) {
//            [self removeCachedResponseForRequest:request];
//            return nil;
//        }
//    }
}

- (void)storeCachedResponse:(NSCachedURLResponse *)cachedResponse forRequest:(NSURLRequest *)request {
    NSLog(@"request2 = %@ === response2 = %@",request,cachedResponse);
    [super storeCachedResponse:cachedResponse forRequest:request];
}
@end
