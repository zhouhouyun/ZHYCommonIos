//
//  UITableView+Zhy.m
//  ZHYCommon
//
//  Created by zhouhouyun on 2019/12/31.
//  Copyright © 2019 zhouhouyun. All rights reserved.
//

#import "UITableView+Zhy.h"


@implementation UITableView (Zhy)

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
}

@end
