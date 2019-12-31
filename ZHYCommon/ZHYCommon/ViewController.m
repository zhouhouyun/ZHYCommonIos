//
//  ViewController.m
//  ZHYCommon
//
//  Created by zhouhouyun on 2019/5/9.
//  Copyright © 2019年 zhouhouyun. All rights reserved.
//

#import "ViewController.h"

#import "ZHYCommon.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"现在时间:%@",[DateTools nowSecTimeStamp]);
    
    NSLog(@"时间距离:%@",[DateTools timeDistance:@"1574552059"]);
    
    NSLog(@"日期转换字符串:%@",[DateTools getDateString:[NSDate date] formatter:@"YYYY-MM-dd HH:mm:ss"]);
    
    NSLog(@"字符串转换日期:%@",[DateTools getDate:@"2019-11-25 16:12:18" formatter:@"YYYY-MM-dd HH:mm:ss"]);
}


@end
