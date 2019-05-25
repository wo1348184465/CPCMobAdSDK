//
//  CPCInitConfig.h
//  CPCMobAdSDK
//
//  Created by dinghao on 2019/4/28.
//  Copyright © 2019 dinghao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPCInitConfig : NSObject


@property (nonatomic , strong) NSString * tkid;
@property (nonatomic , strong) NSString * tuid;



@property (nonatomic , assign) BOOL isUseBaidu;



@end

NS_ASSUME_NONNULL_END
