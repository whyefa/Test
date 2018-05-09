//
//  Dog.m
//  Demo
//
//  Created by dow-np-162 on 2018/4/24.
//  Copyright © 2018年 dow-np-162. All rights reserved.
//

#import "Dog.h"

@interface Dog()

@property (nonatomic, copy) NSString *dogname;

@end

@implementation Dog

-  (void)setName:(NSString *)name {
    self.dogname = name;
}

- (NSString *)name {
    return self.dogname;
}

- (void)laugh {
    NSLog(@"dog %@ 笑了: 汪汪汪", self.dogname);
}

@end
