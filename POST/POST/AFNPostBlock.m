//
//  AFNPostBlock.m
//  POST
//
//  Created by 七扇门 on 16/6/7.
//  Copyright © 2016年 luotao. All rights reserved.
//

#import "AFNPostBlock.h"

@implementation AFNPostBlock
+ (void)getDataWithString:(NSString *)string body:(NSDictionary *)parameters block:(AFNData)block blockerror:(AFNDataError)blockError
{
    AFNetworkReachabilityManager *netWorkManager = [AFNetworkReachabilityManager sharedManager];
    
    NSString *url_string = [NSString stringWithFormat:@"%@",string];
    url_string = [url_string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    请求超时
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 15;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];

    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html",nil];
    
    [manager POST:url_string parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [netWorkManager stopMonitoring];
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            blockError(error);
//            NSLog(@"Error: %@", error);
            [manager.operationQueue cancelAllOperations];
        });

    }];
}
@end
