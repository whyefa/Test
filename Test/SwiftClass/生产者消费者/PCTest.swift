
//
//  PCTest.swift
//  Test
//
//  Created by dow-np-162 on 2018/4/28.
//  Copyright © 2018年 yefa. All rights reserved.
//

import UIKit

class PCTest: NSObject {
    
    var productNum: Int = 0
    let condition: NSCondition = NSCondition()
    
    func start() {
        let t1 = Thread(target: self, selector: #selector(producerHandle), object: nil)
        t1.name = "生产者 1"
        
        let t2 = Thread(target: self, selector: #selector(producerHandle), object: nil)
        t2.name = "生产者2"

        let t3 = Thread(target: self, selector: #selector(producerHandle), object: nil)
        t3.name = "生产者3"
        
        let c1 = Thread(target: self, selector: #selector(customerHandle), object: nil)
        c1.name = "消费者 1"
        
        let c2 = Thread(target: self, selector: #selector(customerHandle), object: nil)
        c2.name = "消费者 3"
        
        t1.start()
        t2.start()
        t3.start()
        c1.start()
        c2.start()
    }
    
    // 生产线
    @objc func producerHandle() {
        while true {
            let currentThreadName = Thread.current.name
            condition.lock()
            if productNum > 10 {
                print("!!! 产品太多, 暂停")
                condition.unlock()
                sleep(1)
                continue
            } else {
                condition.unlock()
            }
            
            condition.lock()
            print("+++++++++++++++++++++++")
            print("...\(String(describing: currentThreadName)) begin:\(productNum)")
            productNum += 1
            condition.signal()
            print("...\(String(describing: currentThreadName)) end:\(productNum)")
            print("+++++++++++++++++++++++")
            condition.unlock()
        }
    }
    
    // 消费圈
    @objc func customerHandle() {
        while true {
            let currentThreadName = Thread.current.name
            condition.lock()
            print("----------------------")
            print("... \(String(describing: currentThreadName)) begin \(productNum)")
            while productNum <= 0 {
                condition.wait()
            }
            self.productNum -= 1
            print("...\(String(describing: currentThreadName)) end \(productNum)")
            print("----------------------")
            condition.unlock()
        }
    }
}
