//
//  DateTools.h
//  ZHYCommon
//
//  Created by zhouhouyun on 2019/11/18.
//  Copyright © 2019 zhouhouyun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DateTools : NSObject


//时间转格式化的字符串
+(NSString *)getDateString:(NSDate *)date formatter:(NSString *)formatter;

+(NSDate *)getDate:(NSString *)dateStr formatter:(NSString *)formatter;

//timeStamp:秒的时间戳
+(NSString *)timeDistance:(NSNumber *)timeStamp;

//utc 秒时间戳
+(NSString *)nowSecTimeStamp;

@end

NS_ASSUME_NONNULL_END
