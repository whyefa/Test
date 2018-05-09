//
//  Teacher.swift
//  SwiftD
//
//  Created by dow-np-162 on 2018/4/9.
//  Copyright © 2018年 dow-np-162. All rights reserved.
//

import Foundation

class Teacher: NSObject {
    var name: String
    var age: Int
    var subject: String?
    
    init(aName: String, aAge: Int) {
        name = aName
        age = aAge
    }
    
    func say() {
        print("Teacher: \(name) age \(age) \(subject)")
    }
}
