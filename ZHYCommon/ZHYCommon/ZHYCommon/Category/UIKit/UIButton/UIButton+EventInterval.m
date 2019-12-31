//
//  UIButton+EventInterval.m
//  ZHYCommon
//
//  Created by zhouhouyun on 2019/12/31.
//  Copyright © 2019 zhouhouyun. All rights reserved.
//

#import "UIButton+EventInterval.h"

#import <objc/runtime.h>

static char * const hy_eventIntervalKey = "hy_eventIntervalKey";
static char * const eventUnavailableKey = "eventUnavailableKey";

@interface UIButton ()

@property (nonatomic, assign) BOOL eventUnavailable;

@end

@implementation UIButton (EventInterval)

+ (void)load {
    
    Method method = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method qi_method = class_getInstanceMethod(self, @selector(qi_sendAction:to:forEvent:));
    method_exchangeImplementations(method, qi_method);
}

#pragma mark - Action functions
- (void)qi_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    if (self.eventUnavailable == NO) {
        self.eventUnavailable = YES;
        [self qi_sendAction:action to:target forEvent:event];
        [self performSelector:@selector(setEventUnavailable:) withObject:@(NO) afterDelay:self.hy_eventInterval];
    }
}


#pragma mark - Setter & Getter functions

- (NSTimeInterval)hy_eventInterval {
    
    return [objc_getAssociatedObject(self, hy_eventIntervalKey) doubleValue];
}

- (void)setHy_eventInterval:(NSTimeInterval)hy_eventInterval {
    
    objc_setAssociatedObject(self, hy_eventIntervalKey, @(hy_eventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)eventUnavailable {
    
    return [objc_getAssociatedObject(self, eventUnavailableKey) boolValue];
}

- (void)setEventUnavailable:(BOOL)eventUnavailable {
    
    objc_setAssociatedObject(self, eventUnavailableKey, @(eventUnavailable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
