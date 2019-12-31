//
//  UITableViewCell+Zhy.m
//  ZHYCommon
//
//  Created by zhouhouyun on 2019/12/31.
//  Copyright © 2019 zhouhouyun. All rights reserved.
//

#import "UITableViewCell+Zhy.h"


@implementation UITableViewCell (Zhy)

-(void)hy_makeSeparateLineAlignLeft
{
    [self hy_makeSeparateLineInset:UIEdgeInsetsZero];
}

-(void)hy_makeSeparateLineInset:(UIEdgeInsets)edgeInsets
{
    if ([self respondsToSelector:@selector(setSeparatorInset:)])
    {
        [self setSeparatorInset:edgeInsets];
    }
    
    if ([self respondsToSelector:@selector(setLayoutMargins:)])
    {
        [self setLayoutMargins:edgeInsets];
    }
    
//    if ([self respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
//        [self setPreservesSuperviewLayoutMargins:NO];
//    }
}


@end
