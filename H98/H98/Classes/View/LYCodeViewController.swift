//
//  LYCodeViewController.swift
//  H98
//
//  Created by Jany on 17/9/20.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import Hero

class LYCodeViewController: UIViewController {

    fileprivate lazy var titleView:LYCustomTopView = LYCustomTopView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.cz_random()
        setupUI()
    }
}

extension LYCodeViewController{

    fileprivate func setupUI() {
        
        view.addSubview(titleView)
            
        titleView.snp.makeConstraints { (make) in
                
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(66)
            make.top.equalTo(0)
        }
        

        titleView.setUIState(flag: false, bkImage: "", titleStr: NSLocalizedString("scaning_code", comment: "扫描二维码"))
        titleView.leftButtonClickBlock = {[weak self] in
            self?.dismiss(animated: true, completion: nil)
        }

    }
}
