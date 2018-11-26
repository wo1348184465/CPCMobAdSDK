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


@property (nonatomic , strong) NSString * adid;

@property (nonatomic , strong) UIViewController * push;

@property(nonatomic, assign) float titleImageOffset;

@property(nonatomic, assign) float imageOffset;

@property(nonatomic, assign) BOOL isRight;

@property(nonatomic, strong) UIFont * titleFont;

@property(nonatomic, assign) CGSize clickSize;

@property(nonatomic, assign) UIEdgeInsets edgeInset;

@property (nonatomic, assign) NSString * time;

@property(nonatomic, assign) CPCVideoADViewType videoType;


@property (nonatomic , assign) int style;// 样式号, 用于试验看样式, 正式请求请不要用



@end
