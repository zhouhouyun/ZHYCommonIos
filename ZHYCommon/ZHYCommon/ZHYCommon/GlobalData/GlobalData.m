//
//  GlobalData.m
//  ZHYCommon
//
//  Created by zhouhouyun on 2019/11/18.
//  Copyright © 2019 zhouhouyun. All rights reserved.
//

#import "GlobalData.h"

@implementation GlobalData

static GlobalData *_instance = nil;

+ (instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init] ;
    }) ;
    
    return _instance ;
}

+ (id) allocWithZone:(struct _NSZone *)zone
{
    return [GlobalData shareInstance] ;
}

- (id) copyWithZone:(struct _NSZone *)zone
{
    return [GlobalData shareInstance] ;
}

@end
