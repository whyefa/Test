//
//  Duck.m
//  Demo
//
//  Created by dow-np-162 on 2018/4/24.
//  Copyright © 2018年 dow-np-162. All rights reserved.
//

#import "Duck.h"

@interface Duck()

@property (nonatomic, copy) NSString *duckName;

@end

@implementation Duck

- (void)setName:(NSString *)name {
    self.duckName = name;
}

- (NSString *)name {
    return self.duckName;
}

- (void)laugh {
    NSLog(@"duck %@ 笑了: 嘎嘎嘎", self.duckName);
}

@end
