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


@property (nonatomic, strong) NSString * unionName;

@property (nonatomic, strong) NSString * appid;

@property (nonatomic, strong) NSString * adslotid;

@property (nonatomic, strong) NSArray * imp;

@property (nonatomic, strong) NSArray * clk;

@property (nonatomic, strong) NSObject * baiduAdObject;



//------------------------------百度 打底------------------------------//





//------------------------------广告基础属性------------------------------//

@property (nonatomic , strong) NSObject * adViewModel; //物料信息, 不对外展示
@property (nonatomic , weak) UIViewController * pushRootVC; //用于跳转跟视图



@property (nonatomic , assign) CGFloat cellHeight; //广告高度

@property (nonatomic , assign) CGFloat heightForWith;

@property (nonatomic , assign) CGFloat width;



@property (nonatomic , assign) long long requestTime; //请求时间

@property (nonatomic , assign) int functionId; // 功能号
//------------------------------广告基础属性------------------------------//


@end
