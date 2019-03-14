//
//  CPCH5CoreServer.h
//  Pods-CPCH5SDK
//
//  Created by dinghao on 2019/2/19.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CPCH5CoreServer : NSObject

+ (CPCH5CoreServer *)sharedInstance;

/**
 调用H5界面
 
 @param url 地址
 @param infoDic 参数字典 例子:    [dic setObject:@"12345" forKey:@"getMemberid"];
 @param value 返回之后是否隐藏nav
 @return 返回h5 视图控制器 ,用push形式加载
 */
- (UIViewController *)loadH5FromeUrl:(NSString*)url andDic:(NSDictionary *)infoDic backHiddenNav:(BOOL)value;

@end

NS_ASSUME_NONNULL_END
