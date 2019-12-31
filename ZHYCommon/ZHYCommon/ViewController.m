//
//  ViewController.m
//  ZHYCommon
//
//  Created by zhouhouyun on 2019/5/9.
//  Copyright © 2019年 zhouhouyun. All rights reserved.
//

#import "ViewController.h"

#import "ZHYCommon.h"
#import "NSNumber+Zhy.h"
#import "Macros.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"现在时间:%@",[DateTools nowSecTimeStamp]);
    
    NSLog(@"时间距离:%@",[DateTools timeDistance:@(1574552059)]);
    
    NSLog(@"日期转换字符串:%@",[DateTools getDateString:[NSDate date] formatter:@"YYYY-MM-dd HH:mm:ss"]);
    
    NSLog(@"字符串转换日期:%@",[DateTools getDate:@"2019-11-25 16:12:18" formatter:@"YYYY-MM-dd HH:mm:ss"]);
    
    //测试 NullSafe
    id nullValue = [NSNull null];
    NSString *result = [nullValue stringValue];
    //result为nil
    if(result == nil){
        //
        NSLog(@"1");
    }
    
    result = @"";
    NSLog(@"isEmpty==%D",IsEmpty(result));
    
    NSNumber *object = [NSNumber numberWithDouble:6.554999];
    NSLog(@"hy_reviseString===%@",[object hy_reviseString]);
    NSLog(@"hy_formatterNumber===%@",[object hy_formatterNumber]);
    double conversionValue = (double)[object floatValue];
    NSString *d2Str = [NSString stringWithFormat:@"%.3lf",conversionValue];
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:d2Str];
    NSString *strD2 = [num1 stringValue];
    
    NSLog(@"str===%@",StringFromObject([NSDate date]));
}


@end
