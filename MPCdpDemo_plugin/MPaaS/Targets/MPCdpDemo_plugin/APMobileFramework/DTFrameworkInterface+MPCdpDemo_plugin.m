//
//  DTFrameworkInterface+MPCdpDemo_plugin.m
//  MPCdpDemo_plugin
//
//  Created by shifei.wkp on 2019/08/05.
//  Copyright © 2019 Alibaba. All rights reserved.
//

#import "DTFrameworkInterface+MPCdpDemo_plugin.h"
#import <MASSChannel/MASSAccess.h>


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

static UIWindow *splashScreenWindow;

@implementation DTFrameworkInterface (MPCdpDemo_plugin)

- (BOOL)shouldLogReportActive
{
    return YES;
}

- (NSTimeInterval)logReportActiveMinInterval
{
    return 0;
}

- (BOOL)shouldLogStartupConsumption
{
    return YES;
}

- (BOOL)shouldAutoactivateBandageKit
{
    return YES;
}

- (BOOL)shouldAutoactivateShareKit
{
    return YES;
}

- (DTNavigationBarBackTextStyle)navigationBarBackTextStyle
{
    return DTNavigationBarBackTextStyleAlipay;
}

- (void)application:(UIApplication *)application beforeDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // rpc初始化
    [MPRpcInterface initRpc];
    
    // 启动netctrl
    [[MASSAccess shareInstance] dispatchTokenSvrInfo:nil uploadInfo:nil downloadInfo:nil downloadInfoCrypto:nil configStorage:nil];
    
    // 营销初始化
    [CDPPromotionInterface start];
}

- (void)application:(UIApplication *)application afterDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 通知关闭启动页
    APWillKillSplashScreen();
    
    // 配置容器
    [MPNebulaAdapterInterface initNebula];
    [MPNebulaAdapterInterface shareInstance].nebulaVeiwControllerClass = NSClassFromString(@"H5WebViewController");
}

- (DTFrameworkCallbackResult)application:(UIApplication *)application handleDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 广告逻辑
    BOOL showSplashWindow = YES;
    showSplashWindow = splashScreenExist(showSplashWindow);
    if (showSplashWindow) {
        __weak typeof(self) weakSelf = self;
        splashScreenWindow = APSplashScreenStart(^{
            [weakSelf splashScreenDidDismiss];
        });
    }
    
    return DTFrameworkCallbackResultContinue;
}

- (void)splashScreenDidDismiss {
    // 切换主 window
    [DTContextGet().window makeKeyAndVisible];
    [self performSelector:@selector(doDismiss) withObject:nil afterDelay:0.0];
}

- (void)doDismiss {
    // 释放闪屏对象
    splashScreenWindow.rootViewController = nil;
    splashScreenWindow = nil;
    [self notifySplashScreenDismiss];
}

// 闪屏结束通知
- (void)notifySplashScreenDismiss {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kSplashScreenDidDismiss" object:nil];
}

@end

#pragma clang diagnostic pop
