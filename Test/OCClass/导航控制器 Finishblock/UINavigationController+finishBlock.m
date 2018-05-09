//
//  UINavigationController+finishBlock.m
//  Demo
//
//  Created by dow-np-162 on 2018/4/20.
//  Copyright © 2018年 dow-np-162. All rights reserved.
//

#import "UINavigationController+finishBlock.h"
#import <objc/runtime.h>
static const char finishKey;

@implementation UINavigationController (finishBlock)

- (void)setFinishBlock:(FinishBlock)finishBlock {
    objc_setAssociatedObject(self, &finishKey, finishBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (FinishBlock)finishBlock {
   return  objc_getAssociatedObject(self, &finishKey);
}

@end
