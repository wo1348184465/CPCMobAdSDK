//
//  CPCADViewConfigModel.h
//  CPCiOSSDK
//
//  Created by dinghao on 2018/10/11.
//  Copyright © 2018年 dinghao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CPCADViewConfigModel : NSObject

//------------------------------百度 打底------------------------------//
@property (nonatomic, assign) NSInteger flag;


@property (nonatomic, copy) NSString * unionName;

@property (nonatomic, copy) NSString * appid;

@property (nonatomic, copy) NSString * adslotid;

@property (nonatomic, copy) NSArray * imp;

@property (nonatomic, copy) NSArray * clk;

@property (nonatomic, strong) NSObject * baiduAdObject;

@property (nonatomic , copy) NSDictionary * response;

//------------------------------百度 打底------------------------------//





//------------------------------广告基础属性------------------------------//

@property (nonatomic , strong) NSObject * adViewModel; //物料信息, 不对外展示
@property (nonatomic , weak) UIViewController * pushRootVC; //用于跳转跟视图

@property (nonatomic , copy) void(^heightChange)(CGFloat height);


@property (nonatomic , assign) CGFloat cellHeight; //广告高度


@property (nonatomic , assign) CGFloat heightForWith;

@property (nonatomic , assign) CGFloat width;



@property (nonatomic , assign) long long requestTime; //请求时间

@property (nonatomic , assign) int functionId; // 功能号
//------------------------------广告基础属性------------------------------//


@property(nonatomic, assign) float titleImageOffset; // 标题与图片的距离

@property(nonatomic, assign) float imageOffset; //图片和图片之间的距离

@property(nonatomic, assign) BOOL isRight; // 图文广告是否是右图广告

@property(nonatomic, strong) UIFont * titleFont; //标题文字大小

@property(nonatomic, assign) CGSize clickSize; // 点击区域, 不需要修改不用管

@property(nonatomic, assign) UIEdgeInsets edgeInset;// 文字, 图片, 距离边框的距离


@property (nonatomic , copy) NSString * channel; //频道id

@property (nonatomic , copy) NSString * memberid; //用户id


@property (nonatomic , assign) CGFloat aspectRatio; // 高宽比

@property (nonatomic, assign) NSString * time;//

@property (nonatomic, assign) int  isNewStyle;//
@property (nonatomic, assign) int  countdown;//


- (CGFloat )heightWithTitleFont;


@end
