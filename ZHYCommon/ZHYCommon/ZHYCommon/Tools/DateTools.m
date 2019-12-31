//
//  DateTools.m
//  ZHYCommon
//
//  Created by zhouhouyun on 2019/11/18.
//  Copyright © 2019 zhouhouyun. All rights reserved.
//

#import "DateTools.h"

//NSDateFormatter 分配很消耗内存
static NSDateFormatter *_cachedDateFormatter = nil;

static NSDateFormatter *_dateFormatter = nil;

@implementation DateTools

//
+ (NSDateFormatter *)cachedDate {
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _cachedDateFormatter = [[NSDateFormatter alloc] init] ;
    });
    
    return _cachedDateFormatter;
}

+ (NSDateFormatter *)dateFormatter {
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _dateFormatter = [[NSDateFormatter alloc] init] ;
    });
    
    return _dateFormatter;
}

+(NSString *)getDateString:(NSDate *)date formatter:(NSString *)formatter{
    NSDateFormatter *forc = [self cachedDate];
    [forc setLocale:[NSLocale currentLocale]];
    [forc setDateFormat:formatter];
    return [forc stringFromDate:date];
}

+(NSDate *)getDate:(NSString *)dateStr formatter:(NSString *)formatter{
    NSDateFormatter *forc = [self dateFormatter];
    //中国时区
    [forc setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];
    [forc setDateFormat:formatter];
    NSDate *date = [forc dateFromString:dateStr];
    return date;
}

+(NSString *)timeDistance:(NSNumber *)timeStamp{
    NSDate *date = [NSDate date];
    NSTimeInterval nowTime = [date timeIntervalSince1970];
    int timeInterval = nowTime - [timeStamp doubleValue];
    NSString *result;
    
    long temp = 0;
    
    if (timeInterval/60 < 1)
    {
        //秒
        result = [NSString stringWithFormat:@"刚刚"];
    }else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    return result;
}

+(NSString *)nowSecTimeStamp{
    //获取当前时间0秒后的时间
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval time=[date timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}

@end
