//
//  NSString+Safe.m
//  SafeObjectCrash
//
//  Created by zhouhouyun on 2020/1/3.
//  Copyright © 2020 lujh. All rights reserved.
//

#import "NSString+Safe.h"
#import <objc/runtime.h>
#import "NSObject+Swizzling.h"


@implementation NSString (Safe)

+ (void)load {
    //只执行一次这个方法
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 替换  substringFromIndex:
        NSString *tmpSubFromStr = @"stringByAppendingString:";
        NSString *tmpSafeSubFromStr = @"safe_stringByAppendingString:";
        
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSCFConstantString")
                                     originalSelector:NSSelectorFromString(tmpSubFromStr)                                     swizzledSelector:NSSelectorFromString(tmpSafeSubFromStr)];
        
        

    });
    
}

-(NSString *)safe_stringByAppendingString:(NSString *)aString{
    if (!aString) {
        return self;
    }
    
    return [self safe_stringByAppendingString:aString];
}

@end
