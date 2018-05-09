//
//  SwiftTest.swift
//  Demo
//
//  Created by dow-np-162 on 2018/4/27.
//  Copyright © 2018年 dow-np-162. All rights reserved.
//

import Foundation

enum CustomError: Error {
    case DefaultError
}

class SwiftTest: NSObject {

    
    var str: String?
    
    func deferTest() {
        defer {
            print("defer 执行")
        }
        do {
            try printError()
        } catch {
            print(error)
        }
    }
    
    func mapTest() {
        let intA = [1, 3, 5, 7]
        let strA = intA.map{
            return "\($0)"
        }
        let filterArr = intA.filter{
            return $0 > 4
        }
        let sum = intA.reduce(0){
            return $0 + $1
        }
        print("整形数组[1, 3, 5, 7] 转为: \(strA)")
        print("整型数组[1, 3, 5, 7] 筛选大于4的子数组 \(filterArr)")
        print("整型数组[1, 3, 5, 7] 求和 \(sum)")
    }
    
    
    func printError() throws {
        throw CustomError.DefaultError.contextString()
    }
    
    
    func nullTest() {
        let null = NSNull()
        let dict = NSMutableDictionary()
        dict.setValue(null, forKey: "null")
        print("set NSNull 实例 到 dict \(dict)")
        dict.setValue(nil, forKey: "nil")// dict 中不会有 nil的键值对
        print("set nil 到 dict \(dict)")
        
        str = nil
        let ma = NSMutableArray()
        ma.add(str)
        ma.add("232")
        print("值为 nil 的 str \(str)")
        print("数组添加 nil \(ma)")
        
    }
    
    func structTest() {
        let s1 = Student(name: "Dow", age: 10)
        s1.say()
        let s2 = Student(name: "PCH")
        s2.say()
        
        let t1 = Teacher(aName: "B", aAge: 30)
        t1.say()
    
    }
}
