////
////  CustomLayoutViewController.m
////  CPCMobAdSDKTest
////
////  Created by dinghao on 2018/12/18.
////  Copyright © 2018年 dinghao. All rights reserved.
////
//
//#import "CustomLayoutViewController.h"
//#import <CPCMobAdSDK/CPCMobAdNativeAdDelegate.h>
//#import <CPCMobAdSDK/CPCMobAdNativeAdView.h>
//#import <CPCMobAdSDK/CPCMobAdNative.h>
//#import <CPCMobAdSDK/CPCMobAdNativeAdObject.h>
//#import "UIImageView+AFNetworking.h"
//@interface CustomLayoutViewController ()<CPCMobAdNativeAdDelegate>
//
//@property (nonatomic , strong) CPCMobAdNative * nativeAd;
//@property (nonatomic , strong) CPCMobAdNativeAdObject * objc;
//@property (nonatomic , strong) CPCMobAdNative * nativeAd2;
//
//@end
//
//@implementation CustomLayoutViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//
//    [self.view setBackgroundColor:[UIColor whiteColor]];
//
//    [CPCMobAdNativeAdView cpcDealTapGesture:YES];
//
//
//
//
//
//    self.nativeAd = [[CPCMobAdNative alloc]init];
//
//    self.nativeAd.delegate = self;
//
//    [self.nativeAd cpcRequestNativeAds];
//
//
//
//
//    self.nativeAd2 = [[CPCMobAdNative alloc]init];
//
//    self.nativeAd2.delegate = self;
//
//    [self.nativeAd2 cpcRequestNativeAds];
//
//
//
//
//
//
//
//}
//
//
//
//
//-(NSString*)adId
//{
//    return @"7479036";
//}
//
//
//int j = 0;
//- (void)dealloc
//{
//    j = 0;
//}
//- (void)cpcNativeAdObjectsSuccessLoad:(CPCMobAdNativeAdObject *)nativeAds native:(CPCMobAdNative *)native;
//{
//
//
//    self.objc = nativeAds;
//    NSLog(@"type ================== %d",nativeAds.ad_type);
//
//    if (nativeAds.ad_type == 1) {
//        NSLog(@"------------ 图文 -------------");
//    }
//
//
//    CPCMobAdNativeAdView * view = [[CPCMobAdNativeAdView alloc] initWithFrame:CGRectMake(0, 100 + j * 200, self.view.frame.size.width, 200) Object:nativeAds native:native];
//
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
//    [view addGestureRecognizer:tapGesture];
//
//    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, self.view.frame.size.width/3, 100)];
//
//    [imageView setImageWithURL:[NSURL URLWithString:nativeAds.adct_url]];
//
//    [view addSubview:imageView];
//
//
//
//    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(imageView.frame.origin.x + imageView.frame.size.width + 10, 10, self.view.frame.size.width - (imageView.frame.origin.x + imageView.frame.size.width + 10), 30)];
//    titleLabel.text = nativeAds.adct_title;
//    [view addSubview:titleLabel];
//
//    [view setBackgroundColor:[UIColor grayColor]];
//
//    [self.view addSubview:view];
//
//    j = j + 1;
//
//
//
//}
//
//-(void)tapGesture:(UIGestureRecognizer*)sender
//{
//
//    NSLog(@"主动跳转");
//    UIView *view = sender.view ;
//    CPCMobAdNativeAdObject *object  = self.objc;
//    if([view isKindOfClass:[CPCMobAdNativeAdView class]]) {
//        CPCMobAdNativeAdView * adView = (CPCMobAdNativeAdView *)view;
//        [object handleClick:view native: self.nativeAd];
//
//    } else {
//        //        [object handleClick:view];
//    }
//}
//
//
//
//
//
///**
// *  广告请求失败
// * @param 失败的BaiduMobAdNative
// * @param 失败的类型 BaiduMobFailReason
// */
//- (void)cpcNativeAdsFailLoad:(NSError *)reason
//{
//
//}
//- (void)cpcNativeAdShowReport:(BOOL)value
//{
//
//}
//
///**
// *  广告点击
// */
//- (void)cpcNativeAdClicked:(UIView*)nativeAdView
//{
//
//}
//
///**
// *  广告详情页关闭
// */
//-(void)cpcDidDismissLandingPage:(UIView *)nativeAdView
//{
//
//}
//
//
//
//
//- (void)viewWillAppear:(BOOL)animated
//{
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
//
//}
//
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//
//}
//
//@end
