//
//  ChickenFactory.m
//  Demo
//
//  Created by dow-np-162 on 2018/4/24.
//  Copyright © 2018年 dow-np-162. All rights reserved.
//

#import "ChickenFactory.h"
#import "Chicken.h"
@implementation ChickenFactory

+ (id<Animal>)createPoultry:(NSString *)name {
    Chicken *c = [[Chicken alloc] init];
    c.name = name;
    return c;
}

@end
