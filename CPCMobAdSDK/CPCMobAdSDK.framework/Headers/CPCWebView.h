//
//  CPCWebView.h
//  CPCMobAdSDK
//
//  Created by dinghao on 2019/5/8.
//  Copyright © 2019 dinghao. All rights reserved.
//

#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPCWebView : WKWebView


@property (nonatomic , strong) NSString * url;

@property (nonatomic , strong) NSString * memberid;


- (void)loadRequest;


@end

NS_ASSUME_NONNULL_END
