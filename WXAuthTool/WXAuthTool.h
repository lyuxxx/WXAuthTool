//
//  WXAuthTool.h
//  Pods-WXAuthTool_Example
//
//  Created by liuyuxuan on 2019/9/18.
//

#import <Foundation/Foundation.h>
#import <WXApi.h>
#import <WechatAuthSDK.h>

/**
微信登录授权回调

 @param respCode
 0    -    授权成功
 -1   -    授权失败
 -2   -    授权取消
 -3   -    未安装App
 -99  -    未知错误
 @param code 授权成功时会返回code,其它为nil
 */
typedef void(^WXAuthToolRespBlock)(NSInteger respCode, NSString *code);

NS_ASSUME_NONNULL_BEGIN

@interface WXAuthTool : NSObject <WXApiDelegate>

/**
 授权回调
 */
@property (nonatomic, copy) WXAuthToolRespBlock wxAuthRespBlock;

+ (WXAuthTool *)shared;

/**
 检查是否安装微信
 
 @return 是否安装微信
 */
+ (BOOL)isWeChatAppInstalled;

/**
 注册微信appId
 
 @param appId appId
 @return 返回值
 */
+ (BOOL)wechatRegisterAppWithAppId:(NSString *)appId;

/**
 处理微信通过URL启动App时传递回来的数据
 
 @param url URL
 @return 返回值
 */
+ (BOOL)wechatHandleOpenURL:(NSURL *)url;

/**
 请求微信授权

 @param block 回调
 */
- (void)sendWXAuthRequestWithCallBack:(WXAuthToolRespBlock)block;

@end

NS_ASSUME_NONNULL_END
