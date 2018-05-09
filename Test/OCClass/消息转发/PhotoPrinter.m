//
//  PhotoPrinter.m
//  Test
//
//  Created by dow-np-162 on 2018/4/16.
//  Copyright © 2018年 dow-np-162. All rights reserved.
//

#import "PhotoPrinter.h"
#import <objc/runtime.h>
#import "NormalPrint.h"
@implementation PhotoPrinter

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSString *selStr = NSStringFromSelector(sel);
    if ([selStr isEqualToString:@"printPhoto:"]) {
        class_addMethod(self, sel, (IMP)printPhoto, "v@:@");
        return YES;
    } else if ([selStr isEqualToString:@"printCMD"]) {
        return NO;
    } else if ([selStr isEqualToString:@"print"]) {
        return NO;
    }
    return [super resolveInstanceMethod:sel];
}

void printPhoto(NSString * s) {

    NSLog(@"print photo == %@", s);
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSString *selStr = NSStringFromSelector(aSelector);
    if ([selStr isEqualToString:@"printCMD"]) {
        NormalPrint *p = [NormalPrint new];
        return p;
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSString *method = NSStringFromSelector(aSelector);
    if ([@"print" isEqualToString:method]) {
        NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:"v@:@"];
        return signature;
    }
    return nil;
}
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL sel = @selector(print);
    NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    anInvocation = [NSInvocation invocationWithMethodSignature:signature];
    [anInvocation setTarget:self];
    [anInvocation setSelector:@selector(print)];
    NSString *city = @"北京";
    // 消息的第一个参数是self，第二个参数是选择子，所以"北京"是第三个参数
//    [anInvocation setArgument:&city atIndex:2];
    
    if ([self respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:self];
        return;
    } else {
        NormalPrint *s = [[NormalPrint alloc] init];
        if ([s respondsToSelector:sel]) {
            [anInvocation invokeWithTarget:s];
            return;
        }
    }
    
    // 从继承树中查找
    [super forwardInvocation:anInvocation];
}

@end
