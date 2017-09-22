//
//  JanyNavigationController.swift
//  MyWeiBo
//
//  Created by jany on 17/8/23.
//  Copyright © 2017年 Jany. All rights reserved.
//

import UIKit

class JanyNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: true)
    }
}
