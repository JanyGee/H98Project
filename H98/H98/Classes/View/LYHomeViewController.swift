//
//  LYHomeViewController.swift
//  H98
//
//  Created by Jany on 17/9/18.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYHomeViewController: UIViewController {

    var map:JanyBaseMapView?
    lazy var mainView:LYMainView = LYMainView()
    
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
        
        map = JanyBaiduMapView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        view.addSubview(map!)
        map?.startLocationSuccess({ 
            self.map?.stopLocation()
        }, fail: { (error) in
            print("反转地址失败")
        })
        
        view.addSubview(mainView)
        mainView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(self.view.snp.bottom).offset(-44)
            make.height.equalTo(300)
            
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
