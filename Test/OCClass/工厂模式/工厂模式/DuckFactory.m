//
//  DuckFactory.m
//  Demo
//
//  Created by dow-np-162 on 2018/4/24.
//  Copyright © 2018年 dow-np-162. All rights reserved.
//

#import "DuckFactory.h"

#import "Duck.h"

@implementation DuckFactory

+ (id<Animal>)createPoultry:(NSString *)name {
    Duck *d = [[Duck alloc] init];
    d.name = name;
    return d;
}

@end
