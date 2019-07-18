//
//  CPCH5ViewController.h
//  CPCH5SDK
//
//  Created by dinghao on 2019/7/18.
//  Copyright © 2019 dinghao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol CPCH5AdViewControlerDelegate <NSObject>


- (void)willClose;

@end


@interface CPCH5ViewController : UIViewController



@property (nonatomic , strong) UIViewController * rootVC;
@property (nonatomic , strong) UIWindow * myWindow;
@property (nonatomic , copy) NSString * url;
@property (nonatomic , copy) NSString * memberid;

@property (nonatomic , strong) UINavigationController * pushNav;


@property(nonatomic, weak) id<CPCH5AdViewControlerDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
