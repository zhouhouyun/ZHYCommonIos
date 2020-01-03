//
//  NSDictionary+Safe.m
//  SafeObjectCrash
//
//  Created by lujh on 2018/4/18.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import "NSDictionary+Safe.h"
#import <objc/runtime.h>
#import "NSObject+ImpChangeTool.h"

@implementation NSDictionary (Safe)

+ (void)load{
    [self SwizzlingMethod:@"initWithObjects:forKeys:count:" systemClassString:@"__NSPlaceholderDictionary" toSafeMethodString:@"initWithObjects_st:forKeys:count:" targetClassString:@"NSDictionary"];
}

#pragma mark -
/**
解决@{@"key":@"value"} 导致的崩溃

@return 返回值
*/
-(instancetype)initWithObjects_st:(id *)objects forKeys:(id<NSCopying> *)keys count:(NSUInteger)count {
    NSUInteger rightCount = 0;
    for (NSUInteger i = 0; i < count; i++) {
        if (!(keys[i] && objects[i])) {
            if(keys[i]){
                NSLog(@"🍎字典初始化%@=nil🍎",keys[i]);
            }
            
            if(objects[i]){
                NSLog(@"🍎字典初始化%@=nil🍎",objects[i]);
            }
            
            break;
        }else{
            rightCount++;
        }
    }
    self = [self initWithObjects_st:objects forKeys:keys count:rightCount];
    return self;
}

@end
