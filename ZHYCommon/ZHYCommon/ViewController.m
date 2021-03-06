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

#import "UIButton+EventInterval.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"现在时间:%@",[DateTools nowSecTimeStamp]);
    
    ZHYLog(@"时间距离:%@",[DateTools timeDistance:@(1574552059)]);
    
    LOG(@"日期转换字符串:%@",[DateTools getDateString:[NSDate date] formatter:@"YYYY-MM-dd HH:mm:ss"]);
    
    NSLog(@"字符串转换日期:%@",[DateTools getDate:@"2019-11-25 16:12:18" formatter:@"YYYY-MM-dd HH:mm:ss"]);
    
    //测试 NullSafe
    id nullValue = [NSNull null];
    NSNumber *nullValue0;
    
    // 为null 或者 nil 不会调用分类方法
    NSString *result = [nullValue0 hy_reviseString];
    //result为nil
    if(result == nil){
        //
        LOG(@"1");
    }
    
    result = @"";
    LOG(@"isEmpty==%D",IsEmpty(result));
    
    NSNumber *object = [NSNumber numberWithDouble:6.554999];
    NSLog(@"hy_reviseString===%@",[object hy_reviseString]);
    NSLog(@"hy_formatterNumber===%@",[object hy_formatterNumber]);
    double conversionValue = (double)[object floatValue];
    NSString *d2Str = [NSString stringWithFormat:@"%.3lf",conversionValue];
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:d2Str];
    NSString *strD2 = [num1 stringValue];
    
    NSLog(@"str===%@",StringFromObject([NSDate date]));
    
    //测试按钮点击间隔
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = [UIColor lightGrayColor];
    button.frame = CGRectMake(30.0, self.view.bounds.size.height / 2, self.view.bounds.size.width - 30.0 * 2, 50.0);
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@(0).stringValue forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    //! 设置按钮的点击响应间隔时间
    button.hy_eventInterval = 1.0;
    
    
    NSString *te = nil;
    NSDictionary *testDic = [NSDictionary dictionaryWithObjectsAndKeys:te,@"xxx", nil];
    NSString *cc = [testDic objectForKey:@"xxx"];
}


#pragma mark - Action functions
- (void)buttonClicked:(UIButton *)sender {
    
    NSInteger titleInteger = sender.currentTitle.integerValue;
    [sender setTitle:@(++titleInteger).stringValue forState:UIControlStateNormal];
}

@end
