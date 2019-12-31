//
//  NSDictionary+Zhy.m
//  ZHYCommon
//
//  Created by zhouhouyun on 2019/12/31.
//  Copyright © 2019 zhouhouyun. All rights reserved.
//

#import "NSDictionary+Zhy.h"

#import "NSArray+Zhy.h"

@implementation NSDictionary (Zhy)

//在封装的网络请求获取到后台数据的地方 将数据处理一下
//NSDictionary *dict = [responseObject dictionaryByReplacingNulls];
//success(dict);

//过滤 null
- (NSDictionary *)dictionaryByReplacingNulls {
    const NSMutableDictionary *replaced = [self mutableCopy];
    const id nul = [NSNull null];
    
    for (NSString *key in self)
    {
        id object = [self objectForKey:key];
        if (object == nul)
            [replaced removeObjectForKey:key];
        else if ([object isKindOfClass:[NSDictionary class]])
            [replaced setObject:[object dictionaryByReplacingNulls] forKey:key];
        else if ([object isKindOfClass:[NSArray class]])
            [replaced setObject:[object arrayByReplacingNulls] forKey:key];
        
        if([object isKindOfClass:[NSNumber class]])
        {
        //   如果后台返回有 double  float类型,,此步骤时候 经过ios 自带json解析(6.66  就已经变成了6.5999999999) 下面的方法 全局处理 保留三位小数精度,,相当于还原了 ios自带json 解析丢失精度的问题,亲测有效)

            double conversionValue = (double)[object floatValue];
            NSString *d2Str = [NSString stringWithFormat:@"%.3lf",conversionValue];
            NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:d2Str];
            NSString *strD2 = [num1 stringValue];
            [replaced setObject:strD2 forKey:key];
        }
    }

    return [NSDictionary dictionaryWithDictionary:[replaced copy]];
}

@end
