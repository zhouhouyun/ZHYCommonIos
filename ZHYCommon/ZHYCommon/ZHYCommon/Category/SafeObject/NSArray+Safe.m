//
//  NSArray+Safe.m
//  SafeObjectCrash
//
//  Created by lujh on 2018/4/18.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import <objc/runtime.h>
#import "NSArray+Safe.h"
#import "NSObject+Swizzling.h"

#import "NSObject+ImpChangeTool.h"

@implementation NSArray (Safe)

#pragma mark - init method

+ (void)load {
    [self SwizzlingMethod:@"initWithObjects:count:" systemClassString:@"__NSPlaceholderArray" toSafeMethodString:@"initWithObjects_st:count:" targetClassString:@"NSArray"];
    
    //只执行一次这个方法
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //替换 objectAtIndex
        NSString *objectAtIndex = @"objectAtIndex:";
        NSString *tmpFirstStr = @"safe_ZeroObjectAtIndex:";
        NSString *safe_objectAtIndex = @"safe_objectAtIndex:";
        NSString *tmpSecondStr = @"safe_singleObjectAtIndex:";
        
        // 替换 objectAtIndexedSubscript
        
        NSString *tmpSubscriptStr = @"objectAtIndexedSubscript:";
        NSString *safe_objectAtIndexedSubscript = @"safe_objectAtIndexedSubscript:";
        
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArray0")
                                     originalSelector:NSSelectorFromString(objectAtIndex)                                swizzledSelector:NSSelectorFromString(tmpFirstStr)];
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSSingleObjectArrayI")
                                     originalSelector:NSSelectorFromString(objectAtIndex)                                     swizzledSelector:NSSelectorFromString(tmpSecondStr)];
        
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayI")
                                     originalSelector:NSSelectorFromString(objectAtIndex)                                     swizzledSelector:NSSelectorFromString(safe_objectAtIndex)];
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayI")
                                    originalSelector:NSSelectorFromString(tmpSubscriptStr)                                     swizzledSelector:NSSelectorFromString(safe_objectAtIndexedSubscript)];
        
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayI")
                                    originalSelector:NSSelectorFromString(@"arrayWithObjects:count:")                                     swizzledSelector:NSSelectorFromString(@"safe_arrayWithObjects:count:")];
        
    });
}


#pragma mark - implement method

/**
 safe_objectAtIndex 不能用一个 方法替换多个
 取出NSArray 第index个 值 对应 __NSArrayI
 
 @param index 索引 index
 @return 返回值
 */
- (id)safe_objectAtIndex:(NSUInteger)index {
    if (index >= self.count){
        return nil;
    }
    return [self safe_objectAtIndex:index];
}


/**
 NSArray *array = @[@1];
 [array objectAtIndex:4]; 或者 array[4];
 错误提示：[__NSSingleObjectArrayI objectAtIndex:]: index 4 beyond bounds [0 .. 0]
  __NSSingleObjectArrayI(不可变数组只有一个对象）
 
 @param index 索引 index
 @return 返回值
 */
- (id)safe_singleObjectAtIndex:(NSUInteger)index {
    if (index >= self.count){
        return nil;
    }
    return [self safe_singleObjectAtIndex:index];
}

/**
 取出NSArray 第index个 值 对应 __NSArray0
 
 @param index 索引 index
 @return 返回值
 */
- (id)safe_ZeroObjectAtIndex:(NSUInteger)index {
    if (index >= self.count){
        return nil;
    }
    return [self safe_ZeroObjectAtIndex:index];
}

/**
 取出NSArray 第index个 值 对应 __NSArrayI
 
 @param idx 索引 idx
 @return 返回值
 */
- (id)safe_objectAtIndexedSubscript:(NSUInteger)idx {
    if (idx >= self.count){
        return nil;
    }
    return [self safe_objectAtIndexedSubscript:idx];
}

/**
@[@"",@""] 初始化导致崩溃

@return 返回值
*/

-(instancetype)initWithObjects_st:(id *)objects count:(NSUInteger)count {
    NSUInteger rightCount = 0;
    for (NSUInteger i = 0; i < count; i++) {
        if (!objects[i]) {
            break;
        }else{
            rightCount++;
        }
    }
    self = [self initWithObjects_st:objects count:rightCount];
    return self;
}


//NSArray *arr1 =  @[@"1",@"2"];
//
//NSArray *arr2 =  [[NSArray alloc]init];
//
//NSArray *arr2 =  [[NSArray alloc]initwithobjocts:@"1",nil];
//
//NSArray *arr3 =  [NSArray alloc];
//
//NSMutbleArray *arr4 =  [NSMutbleArray array];
//
//1、arr2类名叫_NSArray0
//2、未init的arr3，类名叫做_NSPlaceHolderArray;
//3、初始化后的可变数组类名都叫_NSArrayM;
//4、初始化后的不可变数组类名都叫_NSArrayI.

+ (id)safe_arrayWithObjects:(const id [])objects count:(NSUInteger)cnt
{
    id validObjects[cnt];
    NSUInteger count = 0;
    for (NSUInteger i = 0; i < cnt; i++)
    {
        if (objects[i])
        {
            validObjects[count] = objects[i];
            count++;
        }
        else
        {
            
        }
    }
    
    return [self safe_arrayWithObjects:validObjects count:count];
}


@end
