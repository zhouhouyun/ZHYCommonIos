//
//  NumberTools.h
//  ZHYCommon
//
//  Created by zhouhouyun on 2019/11/25.
//  Copyright © 2019 zhouhouyun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NumberTools : NSObject

//数字 转 多少万 多少千 
+(NSString *)conversionMillionThousand:(NSNumber *)number;

@end

NS_ASSUME_NONNULL_END
