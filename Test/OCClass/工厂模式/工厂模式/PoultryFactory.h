//
//  PoultryFactory.h
//  Demo
//
//  Created by dow-np-162 on 2018/4/24.
//  Copyright © 2018年 dow-np-162. All rights reserved.
//

#import "Animal.h"
@interface PoultryFactory : NSObject

+ (id<Animal>)createPoultry:(NSString *)name;

@end
