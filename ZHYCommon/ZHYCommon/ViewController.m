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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"现在时间:%@",[DateTools nowSecTimeStamp]);
    
    NSLog(@"时间距离:%@",[DateTools timeDistance:@(1574552059)]);
    
    NSLog(@"日期转换字符串:%@",[DateTools getDateString:[NSDate date] formatter:@"YYYY-MM-dd HH:mm:ss"]);
    
    NSLog(@"字符串转换日期:%@",[DateTools getDate:@"2019-11-25 16:12:18" formatter:@"YYYY-MM-dd HH:mm:ss"]);
    
    id nullValue = [NSNull null];
    NSString *result = [nullValue stringValue];
    NSLog(@"result===%@",result);
    
    NSNumber *object = [NSNumber numberWithDouble:6.554999];
    NSLog(@"number===%@",[object hy_reviseString]);
    NSLog(@"number===%@",[object hy_formatterNumber]);
    double conversionValue = (double)[object floatValue];

    NSString *d2Str = [NSString stringWithFormat:@"%.3lf",conversionValue];

    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:d2Str];

    NSString *strD2  = [num1 stringValue];
}


@end
