//
//  CPCMobAdNative.h
//  CPCMobAdSDK
//
//  Created by dinghao on 2018/12/18.
//  Copyright © 2018年 dinghao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPCMobAdNativeAdDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface CPCMobAdNative : NSObject

/**
 *  广告位id
 */
@property(nonatomic, strong) NSString *adId;

/**
 * 原生广告delegate
 */
@property (nonatomic ,weak) id<CPCMobAdNativeAdDelegate> delegate;



/**
 * 请求广告
 */
- (void)cpcRequestNativeAds;





@end

NS_ASSUME_NONNULL_END
