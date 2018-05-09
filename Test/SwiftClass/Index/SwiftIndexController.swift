//
//  SwiftIndexController.swift
//  Test
//
//  Created by dow-np-162 on 2018/4/27.
//  Copyright © 2018年 yefa. All rights reserved.
//

import UIKit

class SwiftIndexController: UIViewController {
    
    let data = ["defer",
                "null & nil",
                "map & filter",
                "生产者 消费者"
                ]
    let testObj = SwiftTest()
    
    @IBOutlet weak var list: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Swift基础"
        configTableView()
    }

    func configTableView() {
        list.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

}


extension SwiftIndexController: UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            testObj.deferTest()
        case 1:
            testObj.nullTest()
        case 2:
            testObj.mapTest()
        case 3:
            PCTest().start()

        default:
            print("没有指定响应动作")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}
