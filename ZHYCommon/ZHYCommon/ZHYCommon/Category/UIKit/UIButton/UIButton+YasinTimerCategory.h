//
//  UIButton+YasinTimerCategory.h
//  GreenYears
//
//  Created by Yasin on 2017/11/3.
//  Copyright © 2017年 Yasin. All rights reserved.
//  按钮倒计时

#import <UIKit/UIKit.h>

//倒计时(如果按钮倒计时出现闪烁，将xib或者storyboard中Type属性设置为custom即可)
//[_vcodeButton startCountDownTime:60 withCountDownBlock:^{
//
//    NSLog(@"开始倒计时");
//
//    //此处发送验证码等操作
//    //................
//
//}];

@interface UIButton (YasinTimerCategory)

- (void)startCountDownTime:(int)time withCountDownBlock:(void(^)(void))countDownBlock;

@end
