//
//  ViewController.m
//  YGNetworkHelper
//
//  Created by Kevin on 2018/3/16.
//  Copyright © 2018年 Kevin. All rights reserved.
//

#import "ViewController.h"
#import "YGNetworkHelper/YGNetworkHelper.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //实时监测网络状况
    [YGNetworkHelper networkStatusWithBlock:^(YGNetworkStatusType status) {
        NSLog(@"%lu",(unsigned long)status);
    }];
    
    NSDictionary *dict = @{@"gender" : @(1),@"new_device" :@(NO),@"since" : @(0)};
    NSString *urlstring = @"https://api.kkmh.com/v1/daily/comic_lists/0";
    [YGNetworkHelper GET:urlstring parameters:dict isCache:YES success:^(id responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSError *error, id cacheReponse) {
        NSLog(@"%@",cacheReponse);
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [YGNetworkCache removeAllHttpCache];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
