//
//  NSNumber+Zhy.h
//  ZHYCommon
//
//  Created by zhouhouyun on 2019/12/31.
//  Copyright © 2019 zhouhouyun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (Zhy)


/*!
 @brief 修正浮点型精度丢失
 @return 修正精度后的数据
 */
//5.5999999999 -> 5.60
-(NSString *)hy_reviseString;

//保留小数点后2位，2位后的四舍五入 6.5549->6.55 6.555->6.56
- (NSString *)hy_formatterNumber;
- (NSString *)hy_formatterNumberFractionDigits:(NSUInteger)fractionDigits;

@end

NS_ASSUME_NONNULL_END
