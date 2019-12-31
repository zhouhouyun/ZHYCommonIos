//
//  NSNumber+Zhy.m
//  ZHYCommon
//
//  Created by zhouhouyun on 2019/12/31.
//  Copyright © 2019 zhouhouyun. All rights reserved.
//

#import "NSNumber+Zhy.h"


@implementation NSNumber (Zhy)

//在后台返回float或者double类型时，利用NSDecimalNumber处理精度丢失问题
-(NSString *)hy_reviseString
{
    //直接传入精度丢失有问题的Double类型
    double conversionValue = [self doubleValue];
//    NSString *doubleString = [NSString stringWithFormat:@"%.3lf",conversionValue];
    NSString *doubleString = [NSString stringWithFormat:@"%lf", conversionValue];
    NSDecimalNumber *decNumber = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber stringValue];
}

//普通精度要求
/**
 *  formatterNumber .00 小数点后两位
 *  @return return value description
 */
- (NSString *)hy_formatterNumber{

    return [self hy_formatterNumberFractionDigits:2];
}

- (NSString *)hy_formatterNumberFractionDigits:(NSUInteger)fractionDigits{
        
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    //四舍五入
    numberFormatter.numberStyle = NSNumberFormatterNoStyle;
    //
    [numberFormatter setMaximumFractionDigits:fractionDigits];
    [numberFormatter setMinimumFractionDigits:fractionDigits];
    
    return [numberFormatter stringFromNumber:self];
}



@end
