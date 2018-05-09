//
//  AnimalFacatory.m
//  Demo
//
//  Created by dow-np-162 on 2018/4/24.
//  Copyright © 2018年 dow-np-162. All rights reserved.
//

#import "AnimalFacatory.h"

#import "Cat.h"
#import "Dog.h"

@implementation AnimalFacatory

+ (id<Animal>)createDog:(NSString *)name {
    Dog *dog = [[Dog alloc] init];
    dog.name = name;
    return dog;
}

+ (id<Animal>)createCat:(NSString *)name {
    Cat *cat = [[Cat alloc] init];
    cat.name = name;
    return cat;
}

@end
