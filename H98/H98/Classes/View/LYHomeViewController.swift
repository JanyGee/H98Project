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
    lazy var deviceInforView:LYSelectDeviceView = LYSelectDeviceView()
    lazy var phoneButton:UIButton = UIButton(type: .custom)
    lazy var positionButton:UIButton = UIButton(type: .custom)
    
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
    
    func firstLogin() -> Void {
        
        if !UserDefaults.standard.bool(forKey: "firstLaunch") {
            
            //不是第一次登陆,启动引导页
            UserDefaults.standard.set(true, forKey: "firstLaunch")
            
            
        }else{
            //非首次使用app
            
        }
    }
    
//    func verifyLogin() -> Bool {
//        
//        if !UserDefaults.standard.bool(forKey: "firstLaunch") {
//            
//            UserDefaults.standard.set(true, forKey: "firstLaunch")
//            
//        }else{
//        
//            UserDefaults.standard.set(true, forKey: "firstLaunch")
//        }
//    }
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
            make.bottom.equalTo(self.view.snp.bottom).offset(-49)
            make.height.equalTo(300)
        }

        view.addSubview(deviceInforView)
        deviceInforView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(self.view.snp.top).offset(20)
            make.right.equalTo(self.view.snp.right).offset(-10)
            make.height.equalTo(60)
        }
        
        view.addSubview(phoneButton)
        phoneButton.setBackgroundImage(UIImage(named:"iphone"), for: .normal)
        phoneButton.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.top.equalTo(deviceInforView.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 55, height: 55))
        }
        
        view.addSubview(positionButton)
        positionButton.setBackgroundImage(UIImage(named:"Shape23"), for: .normal)
        positionButton.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.top.equalTo(phoneButton.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 55, height: 55))
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
