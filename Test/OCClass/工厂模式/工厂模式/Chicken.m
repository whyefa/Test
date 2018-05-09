//
//  Chicken.m
//  Demo
//
//  Created by dow-np-162 on 2018/4/24.
//  Copyright © 2018年 dow-np-162. All rights reserved.
//

#import "Chicken.h"

@interface Chicken()

@property (nonatomic, copy) NSString *chickenName;

@end

@implementation Chicken

- (void)setName:(NSString *)name {
    self.chickenName = name;
}

- (NSString *)name {
    return self.chickenName;
}

- (void)laugh {
    NSLog(@"chicken %@ 笑了: 咯咯咯", self.chickenName);
}

@end
