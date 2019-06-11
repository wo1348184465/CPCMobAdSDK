//
//  CPCCoreServer.h
//  CPCMobCPCDK
//
//  Created by dinghao on 2018/10/31.
//  Copyright © 2018年 dinghao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CPCLaunchAdViewConfig.h"
#import "CPCLaunchADViewDelegate.h"
#import "CPCAdViewConfig.h"
#import "CPCADViewDelegate.h"
#import "CPCADViewConfigModel.h"
#import "CPCInitConfig.h"


#define CPCMOBADSDK_VERSION @"0.1.0.94.0611.131.1" // 互动, sketch


NS_ASSUME_NONNULL_BEGIN

@interface CPCCoreServer : NSObject


@property (nonatomic , weak) id<CPCADViewDelegate> delegate;


@property (nonatomic , weak) id<CPCLaunchADViewDelegate> launchDelegate;



/**
 单例初始化
 
 
 @return 单例对象
 */
+ (CPCCoreServer *)sharedInstance;


// 开启定位
- (void)startLocation;


/**
 *  Log 输出开关 (默认关闭)
 *
 *  @param flag 是否开启
 */
+ (void)setLogEnable:(BOOL)flag;



/**
 Init SDK , and Set the secret key used to decrypt the jspatch script.
 
 @param patchKey :secret key
 @return is the initialization succeeds?
 */
- (BOOL)initWithCPCKey:(NSString *)patchKey;



/**
 初始化SDK以及一些配置

 @param config 初始化配置
 @return 是否成功初始化
 */
- (BOOL)initWithCPCConfig:(CPCInitConfig *)config;

- (void)test;


/************************************************************ 新版开发 ************************************/



// 互动广告





/**
 调用H5界面

 @param url 地址
 @param infoDic 参数字典 例子:    [dic setObject:@"12345" forKey:@"getMemberid"];
 @param value 返回之后是否隐藏nav
 @return 返回h5 视图控制器 ,用push形式加载
 */
- (UIViewController *)loadH5FromeUrl:(NSString*)url andDic:(NSDictionary *)infoDic backHiddenNav:(BOOL)value;




/**
 更新ADView字体大小 , 返回刷新后的大小
 
 @param adView 要更新的哪个adView
 @param font 要更新的Font
 
 */
- (CGFloat)cpcConfigWithFont:(UIView *)adView font:(UIFont*)font;







/**
 通过配置文件adviewConfig ,获取物料model

 @param adviewConfig 配置文件, alloc init 初始化, set语法赋值
 @param success 成功回调物料model
 @param failure 失败返回错误原因
 */
- (void)cpcGetADModel:(CPCAdViewConfig *)adviewConfig
           success:(void (^)(CPCADViewConfigModel * adViewModel))success
           failure:(void (^)(NSError * error))failure;



/**
 通过物料获取广告View , 和上一个方法一样
 
 @param adViewModel 物料model
 @return 返回ADView
 */
- (UIView *)cpcShowView:(CPCADViewConfigModel *)adViewModel setDelegate:(id<CPCADViewDelegate>)delegate;




/**
 根据物料model , 计算ADView的高度 , 如果不用这个方法, 用ADView.frame.size.height 同样可以获取高度
 
 @param adViewModel 物料model
 @return ADView的高度
 */
- (CGFloat)cpcAdViewForHeight:(CPCADViewConfigModel *)adViewModel;



/**
 传入物料, 判断是否过期

 @param adViewModel 请求到的广告物料
 @return YES:过期   NO:没过期
 */
-(BOOL)cpcIsExpired:(CPCADViewConfigModel *)adViewModel;



/******************************主动上报逻辑******************************/



/**
 配合百度打底使用 , 主动 上报展示
 
 @param adViewModel model
 */
- (void)cpcOnShowReport:(CPCADViewConfigModel *)adViewModel;

/**
 配合百度打底使用, 主动 点击上报
 
 @param adViewModel model
 */
- (void)cpcOnClickReport:(CPCADViewConfigModel *)adViewModel;





/******************************开屏广告逻辑******************************/

/**
 开屏广告
 
 @param config 配置类
 @param parameters 带有广告位的字典
 @param window self.window
 @param success 成功不会走
 @param failure 失败回调
 */
- (void)cpcGetLaunchADView:(CPCLaunchAdViewConfig *)config
                   body:(NSDictionary *)parameters
                 window:(UIWindow *)window
                success:(void (^)(NSObject * adViewModel))success
                failure:(void (^)(NSError * error))failure;





/**
 清除 开屏视频缓存文件
 
 @return 返回是否清除成功 , 默认超过30mb会自动清理
 */
- (BOOL)cpcDeleteVideoCache;




@end

NS_ASSUME_NONNULL_END
