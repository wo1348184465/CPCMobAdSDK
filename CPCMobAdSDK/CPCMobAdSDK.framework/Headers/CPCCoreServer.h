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






NS_ASSUME_NONNULL_BEGIN

@interface CPCCoreServer : NSObject


@property (nonatomic , weak) id<CPCADViewDelegate> delegate;


@property (nonatomic , weak) id<CPCLaunchADViewDelegate> launchDelegate;

- (void)baidutest;

/**
 单例初始化
 
 
 @return 单例对象
 */
+ (CPCCoreServer *)sharedInstance;


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




/************************************************************ 新版开发 ************************************/



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
- (UIView *)cpcShowView:(CPCADViewConfigModel *)adViewModel
            setDelegate:(id<CPCADViewDelegate>)delegate;




/**
 根据物料model , 计算ADView的高度 , 如果不用这个方法, 用ADView.frame.size.height 同样可以获取高度
 
 @param adViewModel 物料model
 @return ADView的高度
 */
- (CGFloat)cpcAdViewForHeight:(CPCADViewConfigModel *)adViewModel;







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



//预留的接口, 暂时没用
- (BOOL)cpcCheckExpired:(NSObject *)adviewModel;


@end

NS_ASSUME_NONNULL_END
