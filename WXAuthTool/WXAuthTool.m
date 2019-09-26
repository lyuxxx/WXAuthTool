//
//  WXAuthTool.m
//  Pods-WXAuthTool_Example
//
//  Created by liuyuxuan on 2019/9/18.
//

#import "WXAuthTool.h"

@implementation WXAuthTool

+ (WXAuthTool *)shared {
    static WXAuthTool *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[WXAuthTool alloc] init];
    });
    return instance;
}

+ (BOOL)isWeChatAppInstalled {
    return [WXApi isWXAppInstalled];
}

+ (BOOL)wechatRegisterAppWithAppId:(NSString *)appId universalLink:(NSString *)universalLink {
    return [WXApi registerApp:appId universalLink:universalLink];
}

+ (BOOL)wechatHandleOpenURL:(NSURL *)url {
    return [WXApi handleOpenURL:url delegate:[WXAuthTool shared]];
}

- (void)sendWXAuthRequestWithCallBack:(WXAuthToolRespBlock)block {
    self.wxAuthRespBlock = block;
    if ([WXApi isWXAppInstalled]) {
        SendAuthReq *req = [[SendAuthReq alloc] init];
        req.state = @"wx_oauth_authorization_state";//用于保持请求和回调的状态，授权请求或原样带回
        req.scope = @"snsapi_userinfo";//授权作用域：获取用户个人信息
        [WXApi sendReq:req completion:nil];
    } else {
        if (self.wxAuthRespBlock) {
            self.wxAuthRespBlock(-3, nil);
        }
    }
}

#pragma mark - WXApiDelegate
- (void)onResp:(BaseResp *)resp {
    if([resp isKindOfClass:[SendAuthResp class]]){//判断是否为授权登录类
        
        SendAuthResp *res = (SendAuthResp *)resp;
        
        if([res.state isEqualToString:@"wx_oauth_authorization_state"]){
            
            NSString *code = res.code;
            
            switch (resp.errCode) {
                case WXSuccess:
                {
                    if (self.wxAuthRespBlock) {
                        self.wxAuthRespBlock(0, code);
                    }
                }
                    break;
                case WXErrCodeAuthDeny:
                {
                    if (self.wxAuthRespBlock) {
                        self.wxAuthRespBlock(-1, nil);
                    }
                }
                    break;
                case WXErrCodeUserCancel:
                {
                    if (self.wxAuthRespBlock) {
                        self.wxAuthRespBlock(-2, nil);
                    }
                }
                    break;
                default:
                {
                    if (self.wxAuthRespBlock) {
                        self.wxAuthRespBlock(-99, nil);
                    }
                }
                    break;
            }
        } else {
            if (self.wxAuthRespBlock) {
                self.wxAuthRespBlock(-99, nil);
            }
        }
    }
}

@end
