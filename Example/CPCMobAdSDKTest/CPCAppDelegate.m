//
//  CPCAppDelegate.m
//  CPCMobAdSDKTest
//
//  Created by 丁昊 on 10/31/2018.
//  Copyright (c) 2018 丁昊. All rights reserved.
//

#import "CPCAppDelegate.h"
#import <CPCMobAdSDK/CPCCoreServer.h>
@interface CPCAppDelegate ()<CPCLaunchADViewDelegate,CPCADViewDelegate>

@end

@implementation CPCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"Info.plist" ofType:nil];
    
    
    NSDictionary *infoDic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    NSLog(@"------- plist = %@",infoDic);
    
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    self.window.rootViewController = [storyBoard instantiateViewControllerWithIdentifier:@"CPCViewController"];
    //    self.window.rootViewController = [storyBoard instantiateInitialViewController];
    
    [self.window makeKeyAndVisible];
    
    
    [CPCCoreServer setLogEnable:YES];
    
    CPCLaunchAdViewConfig * config = [CPCLaunchAdViewConfig new];
    config.showTime = 5;
    config.waitTime = 10;
    config.animate = LaunchAdAnimateNone;
    
    
    [CPCCoreServer sharedInstance].launchDelegate = self;
    [CPCCoreServer sharedInstance].delegate = self;
    
    NSMutableDictionary * body = [NSMutableDictionary dictionary];
    [body setValue:@"1028284" forKey:@"id"];
    
    [[CPCCoreServer sharedInstance] cpcGetLaunchADView:config body:body window:self.window success:^(NSObject * _Nonnull adViewModel) {
        NSLog(@"success");
        
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"error = %@",error);
    }];
    
    
    [[CPCCoreServer sharedInstance] initWithCPCKey:@"baidu"];
    
    //
    NSLog(@"width =  %f",[UIScreen mainScreen].bounds.size.width);
    
    
    // Override point for customization after application launch.
    return YES;
}


#pragma mark -
#pragma mark 基本回调
// 点击上报回调
- (void)CPCDataReportClick:(BOOL)click
{
    
}

// 展示上报
- (void)CPCDataReportShow:(BOOL)show
{
    
}

// 点击事件回调
- (void)CPCClickCallBack:(UIView *)adview
{
    
}



#pragma mark -
#pragma mark 开屏回调
- (void)CPCLaunchADView:(CPCLaunchAdViewConfig *)config clickAndOpenURL:(NSString *)clickURL
{
    NSLog(@"跳转链接:%@",clickURL);
}

- (void)CPCLaunchADView:(CPCLaunchAdViewConfig *)config clickClose:(BOOL)click
{
    NSLog(@"点击关闭按钮");
}


- (void)CPCLaunchADView:(CPCLaunchAdViewConfig *)config imageDownLoadFinish:(UIImage *)image
{
    NSLog(@"图片下载完成");
}



- (void)CPCLaunchADView:(CPCLaunchAdViewConfig *)config videoDownLoadFinish:(NSURL *)pathURL
{
    NSLog(@"视频下载完成:path = %@",pathURL);
}

- (void)CPCLaunchADView:(CPCLaunchAdViewConfig *)config videoTotal:(unsigned long long)total current:(unsigned long long)current
{
    NSLog(@"当前进度:%llu ,%llu",current,total);
}


- (void)CPCLaunchADView:(CPCLaunchAdViewConfig *)config showTime:(int)showTime
{
    NSLog(@"倒计时还剩:%d",showTime);
    
}

- (void)CPCLaunchADViewFinish:(CPCLaunchAdViewConfig *)config
{
    NSLog(@"开屏广告加载完成");
}


@end
