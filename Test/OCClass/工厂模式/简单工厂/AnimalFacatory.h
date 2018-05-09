//
//  AnimalFacatory.h
//  Demo
//
//  Created by dow-np-162 on 2018/4/24.
//  Copyright © 2018年 dow-np-162. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Animal.h"

@interface AnimalFacatory : NSObject

+ (id<Animal>)createDog:(NSString *)name;

+ (id<Animal>)createCat:(NSString *)name;

@end
