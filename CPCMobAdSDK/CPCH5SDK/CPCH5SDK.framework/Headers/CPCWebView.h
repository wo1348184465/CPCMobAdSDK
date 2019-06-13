//
//  CPCWebView.h
//  CPCMobAdSDK
//
//  Created by dinghao on 2019/5/8.
//  Copyright © 2019 dinghao. All rights reserved.
//

#import <WebKit/WebKit.h>

#define CPCWebView_VERSION @"1.0.1.0613.2"
NS_ASSUME_NONNULL_BEGIN

@protocol CPCWebViewDelegate <NSObject>


- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler;


- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler;

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation;


- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation;


- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error;


- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation;


- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation;


- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error;



- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message;


- (void)willClose;



@end


@interface CPCWebView : WKWebView


@property (nonatomic , strong) NSString * url;

@property (nonatomic , strong) NSString * memberid;

@property (nonatomic , weak) id<CPCWebViewDelegate> CPCWebDelegate;

- (void)loadRequest;

- (instancetype)initWithFrame:(CGRect)frame;


@end

NS_ASSUME_NONNULL_END
