//
//  Student.swift
//  SwiftD
//
//  Created by dow-np-162 on 2018/4/9.
//  Copyright © 2018年 dow-np-162. All rights reserved.
//

import Foundation

struct Student {
    var name: String
    var age: Int
    var cls: String?
    
    init(name: String, age: Int  = 15) {
        self.name = name
        self.age = age
    }
    
    func say() {
        print("Student \(self.name) 年龄 \(age)")
    }
}
