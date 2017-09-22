//
//  JanyBaseViewController.swift
//  MyWeiBo
//
//  Created by jany on 17/8/23.
//  Copyright © 2017年 Jany. All rights reserved.
//

import UIKit

class JanyBaseViewController: UIViewController {

    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
    lazy var navItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var title: String?{
        
        didSet{
            
            navItem.title = title
        }
    }
}

extension JanyBaseViewController {
    
    func setupUI() {
        
        view.backgroundColor = UIColor.orange
        
        view.addSubview(navigationBar)
        
        navigationBar.items?.append(navItem)
    }
}
