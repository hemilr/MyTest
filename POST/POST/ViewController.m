//
//  ViewController.m
//  POST
//
//  Created by 七扇门 on 16/6/7.
//  Copyright © 2016年 luotao. All rights reserved.
//

#import "ViewController.h"
#import "AFNPostBlock.h"
#import "MBProgressHUD.h"

#define kBaseUrl @"http://servicetest.api.sevendoor.cn/"
#define APPID @"clientAppid"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"加载中...";
    
    NSString *urlStr = [kBaseUrl stringByAppendingString:@"3041/ios"];
    NSDictionary *params = @{@"app_id":@"clientAppid"}; 
    NSLog(@"%@", params);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
    });
    
    [AFNPostBlock getDataWithString:urlStr body:params block:^(id block) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        NSLog(@"%@", block);
    } blockerror:^(id blockError) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        NSLog(@"%@", blockError);
    }];

}


@end
