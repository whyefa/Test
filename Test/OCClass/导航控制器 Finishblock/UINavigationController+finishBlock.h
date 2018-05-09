//
//  UINavigationController+finishBlock.h
//  Demo
//
//  Created by dow-np-162 on 2018/4/20.
//  Copyright © 2018年 dow-np-162. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FinishBlock) (void);

@interface UINavigationController (finishBlock)

@property (nonatomic, copy) FinishBlock finishBlock;

@end
