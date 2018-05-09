//
//  Cat.m
//  Demo
//
//  Created by dow-np-162 on 2018/4/24.
//  Copyright © 2018年 dow-np-162. All rights reserved.
//

#import "Cat.h"

@interface Cat()

@property (nonatomic, copy) NSString *catName;

@end

@implementation Cat

-  (void)setName:(NSString *)name {
    self.catName = name;
}

- (NSString *)name {
    return self.catName;
}

- (void)laugh {
    NSLog(@"cat %@ 笑了: 喵喵喵", self.catName);
}

@end
