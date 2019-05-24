//
//  CPCLaunchAdCoreServer.h
//  CPCiOSSDK
//
//  Created by dinghao on 2018/8/21.
//  Copyright © 2018年 dinghao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, Animation) {
    LaunchAdAnimateNone = 1,     // 无动画
    LaunchAdAnimateFadein ,      // 渐入渐出
};

@interface CPCLaunchAdViewConfig : NSObject


/** 设置开屏广告的frame(default CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * 0.8) */
@property (nonatomic, assign) CGRect frame;



/** 广告展示时间(default 5 ,单位:秒) */
@property(nonatomic, assign) NSInteger showTime;


/** 等待时间时间(default 3 ,单位:秒) */
@property(nonatomic, assign) NSInteger waitTime;


/** 请求次数 */
@property(nonatomic, assign) NSInteger requestCount;


/** 当前的window */
@property(nonatomic, strong) UIWindow * window;


@property (nonatomic , assign) Animation animate;




//count
//
//UIwindow


//1.请求时长
//2.展示时间
//3.当天请求次数
//4.默认静音, 自动循环



@end
