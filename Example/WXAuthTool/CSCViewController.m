//
//  CSCViewController.m
//  WXAuthTool
//
//  Created by lyuxxx on 09/18/2019.
//  Copyright (c) 2019 lyuxxx. All rights reserved.
//

#import "CSCViewController.h"
#import <WXAuthTool.h>

@interface CSCViewController ()

@end

@implementation CSCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)wechatAuth {
    [[WXAuthTool shared] sendWXAuthRequestWithCallBack:^(NSInteger respCode, NSString *code) {
        if (respCode == 0) {//成功会返回code，其它为nil
            
        }
    }];
}

@end
