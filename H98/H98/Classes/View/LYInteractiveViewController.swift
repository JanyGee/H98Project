//
//  LYInteractiveViewController.swift
//  H98
//
//  Created by Jany on 17/9/18.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYInteractiveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
    }

}

extension LYInteractiveViewController{

    //MARK: UI
    fileprivate func setupUI() -> Void {
        view.backgroundColor = UIColor.cz_random()
        navigationItem.title = NSLocalizedString("message", comment: "消息")
    }
}
