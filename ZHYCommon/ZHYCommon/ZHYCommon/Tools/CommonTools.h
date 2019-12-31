//
//  CommonTools.h
//  ZHYCommon
//
//  Created by zhouhouyun on 2019/12/27.
//  Copyright © 2019 zhouhouyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommonTools : NSObject

//获取系统版本
+(NSString *)getAppVersion;

//jsonObject:从https://itunes.apple.com/cn/lookup?id=1480635577获取到的json格式
+(UIAlertController *)alertUpdateInformation:(NSDictionary *)jsonObject;

@end

NS_ASSUME_NONNULL_END
