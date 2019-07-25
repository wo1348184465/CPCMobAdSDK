//
//  CPCPlayerView.h
//  CPCMobAdSDK
//
//  Created by dinghao on 2019/5/20.
//  Copyright © 2019 dinghao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger, TouchPlayerViewMode) {
    TouchPlayerViewModeNone, // 轻触
    TouchPlayerViewModeHorizontal, // 水平滑动
    TouchPlayerViewModeUnknow, // 未知
};

typedef void(^AVPlayerItemReadyToPlayBlock)(void); // 准备播放的回调

typedef void(^AVPlayerItemFinishedBlock)(void); //播放完成回调

typedef void(^AVPlayerItemPlayTimeBlock)(float realTime); //播放到当前的时间

@interface CPCPlayerView : UIView

@property (nonatomic , assign)         int isRealPlay; // 是否正在播放



// AVPlayer 控制视频播放
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;
@property (nonatomic, strong) NSURL * url;
@property (strong, nonatomic) UISlider *playProgress; // 播放进度

@property (strong, nonatomic) AVPlayerItem * playerItem;

@property (nonatomic, copy, nullable) AVPlayerItemReadyToPlayBlock playerItemReadyToPlayBlock;
@property (nonatomic, copy, nullable) AVPlayerItemFinishedBlock playerItemFinishedBlock;
@property (nonatomic, copy, nullable) AVPlayerItemPlayTimeBlock playerItemPlayTimeBlock;



// 是否重复播放
@property (nonatomic , assign) BOOL isRePlay;

// 是否允许背景声

@property (nonatomic , assign) BOOL isAllowBackgroundSound;

// 是否自动播放
@property (nonatomic , assign) BOOL isAutoPlay;
// 播放状态
@property (nonatomic, assign) BOOL isPlaying;

// 是否横屏
@property (nonatomic, assign) BOOL isLandscape;

// 是否锁屏
@property (nonatomic, assign) BOOL isLock;

@property (nonatomic , assign) BOOL isBarHidden;

@property (nonatomic , assign) int traceTimeInt;

// 传入视频地址
- (void)updatePlayerWithURL:(NSURL *)url;

// 移除通知
- (void)removeObserveAndNOtification;

// 切换为横屏
- (void)setLandscapeLayout;

// 切换为竖屏
- (void)setProtraitLayout;

// 播放
- (void)play;

// 暂停
- (void)pause;

- (void)rePlay;

+ (CPCPlayerView *)sharedInstance;


@end

NS_ASSUME_NONNULL_END
