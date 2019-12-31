//
//  NumberTools.m
//  ZHYCommon
//
//  Created by zhouhouyun on 2019/11/25.
//  Copyright © 2019 zhouhouyun. All rights reserved.
//

#import "NumberTools.h"

@implementation NumberTools

+(NSString *)conversionMillionThousand:(NSNumber *)number{
    NSString * str = @"";
    if (number.integerValue > 9999) {
        str = [NSString stringWithFormat:@"%.2f万",number.floatValue / 10000.0];
    }else if (number.integerValue > 999){
        str = [NSString stringWithFormat:@"%.2f千",number.floatValue / 1000.0];
    }else{
        str = [NSString stringWithFormat:@"%@",number];
    }
    
    if (number.integerValue == 0) {
        str = @"0";
    }
    return str;
}

@end
