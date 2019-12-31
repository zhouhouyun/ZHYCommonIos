//
//  NSArray+Zhy.m
//  ZHYCommon
//
//  Created by zhouhouyun on 2019/12/31.
//  Copyright © 2019 zhouhouyun. All rights reserved.
//

#import "NSArray+Zhy.h"

#import "NSDictionary+Zhy.h"

@implementation NSArray (Zhy)

//过滤 null
- (NSArray *)hy_arrayByReplacingNulls  {
    NSMutableArray *replaced = [self mutableCopy];
    const id nul = [NSNull null];

    for (int idx = 0; idx < [replaced count]; idx++) {
        id object = [replaced objectAtIndex:idx];
        
        if (object == nul)
            [replaced removeObjectAtIndex:idx];
        else if ([object isKindOfClass:[NSDictionary class]])
            [replaced replaceObjectAtIndex:idx withObject:[object hy_dictionaryByReplacingNulls]];
        else if ([object isKindOfClass:[NSArray class]])
            [replaced replaceObjectAtIndex:idx withObject:[object hy_arrayByReplacingNulls]];
    }

    return [replaced copy];
}

@end
