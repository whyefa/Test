//
//  ViewController.swift
//  Test
//
//  Created by dow-np-162 on 2018/4/27.
//  Copyright © 2018年 yefa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func showOCPage(_ sender: Any) {
        let ocPage = OCIndexController(nibName: "OCIndexController", bundle: nil)
        self.navigationController?.pushViewController(ocPage, animated: true)
    }
    
    @IBAction func showSwiftPage(_ sender: Any) {
        let swiftPage = SwiftIndexController(nibName: "SwiftIndexController", bundle: nil)
        self.navigationController?.pushViewController(swiftPage, animated: true)
    }
    
}

