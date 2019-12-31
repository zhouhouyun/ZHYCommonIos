//
//  UITableViewCell+Zhy.h
//  ZHYCommon
//
//  Created by zhouhouyun on 2019/12/31.
//  Copyright © 2019 zhouhouyun. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (Zhy)

//设置左间距
-(void)hy_makeSeparateLineAlignLeft;
-(void)hy_makeSeparateLineInset:(UIEdgeInsets)edgeInsets;

@end

NS_ASSUME_NONNULL_END
