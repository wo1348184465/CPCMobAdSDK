//
//  CPCLaunchADViewDelegate.h
//  CPCiOSSDK
//
//  Created by dinghao on 2018/8/24.
//  Copyright © 2018年 dinghao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPCLaunchAdViewConfig.h"


@protocol CPCLaunchADViewDelegate <NSObject>




/**
 广告点击

 @param config 配置信息
 @param clickURL 广告的链接
 */
- (void)CPCLaunchADView:(CPCLaunchAdViewConfig *)config clickAndOpenURL:(NSString *)clickURL;


/**
 点击关闭

 @param config 配置信息
 @param click 点击关闭会返回YES
 */
- (void)CPCLaunchADView:(CPCLaunchAdViewConfig *)config clickClose:(BOOL)click;



/**
 图片读取完成/下载完成

 @param config 配置文件
 @param image 图片
 */
- (void)CPCLaunchADView:(CPCLaunchAdViewConfig *)config imageDownLoadFinish:(UIImage *)image;




/**
 视频读取完成/或者下载完成

 @param config 配置文件
 @param pathURL 保存路径
 */
- (void)CPCLaunchADView:(CPCLaunchAdViewConfig *)config videoDownLoadFinish:(NSURL *)pathURL;





/**
 视频下载进度回调

 @param config 配置文件
 @param total 总大小
 @param current 当前大小
 */
- (void)CPCLaunchADView:(CPCLaunchAdViewConfig *)config videoTotal:(unsigned long long)total current:(unsigned long long)current;




/**
 展示时间回调 ,倒计时回调

 @param config 配置文件
 @param showTime 倒计时剩余时间
 */
- (void)CPCLaunchADView:(CPCLaunchAdViewConfig *)config showTime:(int)showTime;



/**
 广告显示完成

 @param config 配置文件
 */
- (void)CPCLaunchADViewFinish:(CPCLaunchAdViewConfig *)config;


@end
