//
//  CSCAppDelegate.m
//  WXAuthTool
//
//  Created by lyuxxx on 09/18/2019.
//  Copyright (c) 2019 lyuxxx. All rights reserved.
//

#import "CSCAppDelegate.h"
#import <WXAuthTool.h>

@implementation CSCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [WXAuthTool wechatRegisterAppWithAppId:@"" universalLink:@""];
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    NSString *fromBundleId = options[UIApplicationOpenURLOptionsSourceApplicationKey];
    if ([fromBundleId isEqualToString:@"com.tencent.xin"]) {
        if ([[url absoluteString] containsString:@"oauth"]) {
            //WeChat Auth
            return [WXAuthTool wechatHandleOpenURL:url];
        }
    }
    return YES;
}

@end
