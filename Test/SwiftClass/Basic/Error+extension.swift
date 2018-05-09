//
//  Error+extension.swift
//  Demo
//
//  Created by dow-np-162 on 2018/4/26.
//  Copyright © 2018年 dow-np-162. All rights reserved.
//

import Foundation


extension String : Error {
    
}

extension Error {
    public func contextString(file: String = #file, function: String = #function, line: Int = #line) -> String{
        return "方法: \(function) 文件名 \(file) 行: \(line)"
    }
}
