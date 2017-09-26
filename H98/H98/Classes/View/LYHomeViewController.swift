//
//  LYHomeViewController.swift
//  H98
//
//  Created by Jany on 17/9/18.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYHomeViewController: UIViewController {

    lazy var map:JanyBaseMapView = JanyBaseMapView()
    
    lazy var btn:UIButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        
        //loginView()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
}

extension LYHomeViewController{

    //MARK: UI
    fileprivate func setupUI() -> Void {
        
        view.addSubview(map)
        
        map.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
        }
        map.startLocationSuccess({
            
            self.map.stopLocation()
            
        }) { (error) in

        
        }
    }
    
    //MARK: 登录测试
    func loginView() {
        
        guard let cls = NSClassFromString(Bundle.main.namespace() + "." + "LYLoginViewController") as? UIViewController.Type else {
            return
        }
        
        let vc = cls.init()
        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        present(vc, animated: true, completion: nil)
    }
}
