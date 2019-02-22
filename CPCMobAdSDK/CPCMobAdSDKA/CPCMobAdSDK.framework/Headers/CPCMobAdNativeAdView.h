//
//  CPCMobAdNativeAdView.h
//  CPCMobAdSDK
//
//  Created by dinghao on 2018/12/17.
//  Copyright © 2018年 dinghao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPCMobAdNativeAdObject.h"
#import "CPCMobAdNative.h"
NS_ASSUME_NONNULL_BEGIN

@interface CPCMobAdNativeAdView : UIView



//设置开发者自己处理View点击事件,只需要设置一次，不设置时，sdk内部采用默认方式处理
+ (void)cpcDealTapGesture:(BOOL) deal;


/**
 * 初始化，非视频信息流，MaterialType是NORMAL的初始化方法
 * 添加品牌名称brandName
 */
-(id)initWithFrame:(CGRect)frame
            Object:(CPCMobAdNativeAdObject *)obj
            native:(CPCMobAdNative * )native;





@end

NS_ASSUME_NONNULL_END
