//
//  CPCH5WebView.h
//  CPCH5SDK
//
//  Created by dinghao on 2019/2/20.
//  Copyright © 2019年 dinghao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CPCH5Delegate <NSObject>

- (void)cpcWebViewDidFinishLoad:(UIWebView *)webView;


@end


@interface CPCH5WebView : UIView

- (instancetype)initWithFrame:(CGRect)frame;
- (void)loadRequest;


@property (nonatomic , strong) NSString * url;

@property (nonatomic , strong) NSDictionary * infoDic;

@property (nonatomic , weak) id<CPCH5Delegate> cpcDelegate;





@end

NS_ASSUME_NONNULL_END
