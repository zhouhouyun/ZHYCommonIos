//
//  GlobalData.h
//  ZHYCommon
//
//  Created by zhouhouyun on 2019/11/18.
//  Copyright © 2019 zhouhouyun. All rights reserved.
//  全局单列数据

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GlobalData : NSObject

//单列的属性用 原子
@property (atomic,copy) NSString *userId;

+(instancetype)shareInstance;

@end

NS_ASSUME_NONNULL_END
