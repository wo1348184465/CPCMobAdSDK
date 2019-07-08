//
//  CPCAdViewConfig.h
//  CPCiOSSDK
//
//  Created by dinghao on 2018/9/21.
//  Copyright © 2018年 dinghao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



typedef NS_ENUM(NSInteger , CPCVideoADViewType)
{
    CPCVideoADViewCoverType = 0,
    CPCVideoADViewAndTitleType,
};

@interface CPCAdViewConfig : NSObject


@property (nonatomic , strong) NSString * adid; // 广告位

@property (nonatomic , strong) UIViewController * pushRootVC;// 跳转跟视图

@property(nonatomic, assign) float titleImageOffset; // 标题与图片的距离

@property(nonatomic, assign) float imageOffset; //图片和图片之间的距离

@property(nonatomic, assign) BOOL isRight; // 图文广告是否是右图广告

@property(nonatomic, strong) UIFont * titleFont; //标题文字大小

@property(nonatomic, assign) CGSize clickSize; // 点击区域, 不需要修改不用管

@property(nonatomic, assign) UIEdgeInsets edgeInset;// 文字, 图片, 距离边框的距离


@property (nonatomic , strong) NSString * channel; //频道id

@property (nonatomic , strong) NSString * memberid; //用户id


@property (nonatomic , assign) CGFloat aspectRatio; // 高宽比

@property (nonatomic, assign) NSString * time;//



@property (nonatomic, assign) int  isNewStyle;//
@property (nonatomic, assign) int  countdown;//

@property (nonatomic, assign) BOOL isClose180ms;

@property(nonatomic, assign) CPCVideoADViewType videoType; 




@property (nonatomic , assign) int style;// 样式号, 用于试验看样式, 正式请求请不要用



@end
