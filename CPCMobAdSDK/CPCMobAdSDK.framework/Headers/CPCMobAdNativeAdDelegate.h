//
//  CPCMobAdNativeAdDelegate.h
//  CPCMobAdSDK
//
//  Created by dinghao on 2018/12/17.
//  Copyright © 2018年 dinghao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CPCMobAdNativeAdObject.h"
NS_ASSUME_NONNULL_BEGIN

@protocol CPCMobAdNativeAdDelegate <NSObject>
/**
 * 广告位id
 */
-(NSString*)adId;




/**
 广告请求成功

 @param nativeAds 请求成功的BaiduMobAdNativeAdObject
 */
- (void)cpcNativeAdObjectsSuccessLoad:(CPCMobAdNativeAdObject *)nativeAds native:(CPCMobAdNative *)native;






/**
 广告请求失败

 @param reason 失败的BaiduMobAdNative , 失败的类型 BaiduMobFailReason
 */
- (void)cpcNativeAdsFailLoad:(NSError *)reason;


/**
 *  广告点击
 */
- (void)cpcNativeAdClicked:(UIView*)nativeAdView;

/**
 *  广告详情页关闭
 */
-(void)cpcDidDismissLandingPage:(UIView *)nativeAdView;

// 自定义view 展示上报 ,初始化则认为展示
- (void)cpcNativeAdShowReport:(BOOL)value;



@end

NS_ASSUME_NONNULL_END
