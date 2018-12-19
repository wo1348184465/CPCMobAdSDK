//
//  CPCMobAdNativeAdObject.h
//  CPCMobAdSDK
//
//  Created by dinghao on 2018/12/18.
//  Copyright © 2018年 dinghao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CPCMobAdNativeAdObject : NSObject

// 类型
@property (nonatomic , assign) int ad_type;






// 标题
@property (nonatomic , strong) NSString * adct_title;

// 描述
@property (nonatomic , strong) NSString * adct_desc;

// 落地页
@property (nonatomic , strong) NSString * adct_c_url;

// 图片
@property (nonatomic , strong) NSString * adct_url;


// 图片数组
@property (nonatomic , strong) NSArray * adct_ext_urls;

//图片宽度
@property (nonatomic , assign) int adct_width;

// 图片高度
@property (nonatomic , assign) int adct_height;

// 展示上报数组
@property (nonatomic , strong) NSArray * adct_imp;

// 点击上报数组
@property (nonatomic , strong) NSArray * adct_clk;






- (CPCMobAdNativeAdObject *)interpreterResponse:(id)responseObject;

/**
 * 发送展现
 */
- (void)trackImpression:(UIView *)view;

/**
 * 发送点击
 */
-(void)handleClick:(UIView*)view;





// 点击事件上报
- (void)reportClick:(NSArray *)clkArr;

// 展示上报
- (void)reportShow:(NSArray *)impArr;


- (void)viewPushController:(UIViewController *)currentCtrol config:(CPCMobAdNativeAdObject *)config view:(UIView *)view;



@end

NS_ASSUME_NONNULL_END
