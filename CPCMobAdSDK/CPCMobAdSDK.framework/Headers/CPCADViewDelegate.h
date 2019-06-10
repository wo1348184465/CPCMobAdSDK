//
//  CPCADViewDelegate.h
//  CPCiOSSDK
//
//  Created by dinghao on 2018/10/9.
//  Copyright © 2018年 dinghao. All rights reserved.
//



#import <Foundation/Foundation.h>


@protocol CPCADViewDelegate <NSObject>



@optional
// 点击上报回调
- (void)CPCDataReportClick:(BOOL)click;

// 展示上报
- (void)CPCDataReportShow:(BOOL)show;


// 点击就回调
- (void)CPCClickCallBack:(UIView *)adview;


// 广告移除回调
- (void)CPCAdViewWillRemove:(UIView *)adView;

@end
