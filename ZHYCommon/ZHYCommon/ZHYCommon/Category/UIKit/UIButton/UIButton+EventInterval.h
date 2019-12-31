//
//  UIButton+EventInterval.h
//  ZHYCommon
//
//  Created by zhouhouyun on 2019/12/31.
//  Copyright © 2019 zhouhouyun. All rights reserved.
//  防止重复点击


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (EventInterval)

//点击间隔时间
@property (nonatomic, assign) NSTimeInterval hy_eventInterval;

@end

NS_ASSUME_NONNULL_END
