//
//  LYResetViewController.swift
//  H98
//
//  Created by Jany on 17/9/18.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYResetViewController: UIViewController {

    private lazy var bkImageView:UIImageView = UIImageView()
    lazy var titleView:LYTitleView = LYTitleView()
    lazy var txtField:LYTxtView = LYTxtView()
    lazy var pwdField:LYTxtView = LYTxtView()
    lazy var compeletButton:UIButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        setupUI()
    }
    
    //MARK: 点击完成
    func compeletButtonClick() -> Void {
        
        guard let presentingViewController: UIViewController = self.presentingViewController else {
            return
        }
        
        isHeroEnabled = false
        dismiss(animated: false) {
            // go back to MainMenuView as the eyes of the user
            presentingViewController.dismiss(animated: true, completion: nil)
        }

    }
    
    func dissmissToRooViewController() -> Void {
        
        var rootVC = presentingViewController
        while let parent = rootVC?.presentingViewController {

            rootVC = parent
        }
        
        rootVC?.dismiss(animated: true, completion: nil)
    }
    
    //MARK: UI
    func setupUI() -> Void {
        
        isHeroEnabled = true
        
        view.addSubview(bkImageView)
        view.addSubview(titleView)
        view.addSubview(txtField)
        view.addSubview(pwdField)
        view.addSubview(compeletButton)
        
        bkImageView.image = UIImage(named: "RESETPASSWORD")
        bkImageView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
        }
        
        titleView.setButtonStateAndTitle(flag: false, img:"back", title: "")
        titleView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(66)
            make.top.equalTo(0)
        }
        
        txtField.heroID = "count"
        txtField.setTxtPlaceHolder(place: NSLocalizedString("new_pwd", comment: "输入新密码"))
        txtField.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.view).offset(-80)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(50)
        }
        
        titleView.leftButtonClickBlock = {[weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
        
        pwdField.heroID = "code"
        //pwdField.backgroundColor = UIColor.cz_random()
        pwdField.setTxtPlaceHolder(place: NSLocalizedString("again_pwd", comment: "再次输入"))
        pwdField.snp.makeConstraints { (make) in
            make.top.equalTo(txtField.snp.bottom).offset(10)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(50)
        }
        
        compeletButton.heroID = "log"
        //compeletButton.backgroundColor = UIColor.cz_random()
        compeletButton.setTitleColor(UIColor.white, for: .normal)
        compeletButton.titleEdgeInsets = UIEdgeInsetsMake(-5, 0, 0, 0)
        compeletButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        compeletButton.setBackgroundImage(UIImage(named:"login_next"), for: .normal)
        compeletButton.setTitle(NSLocalizedString("competition", comment: "完成"), for: .normal)
        compeletButton.addTarget(self, action: #selector(compeletButtonClick), for: .touchUpInside)
        compeletButton.snp.makeConstraints { (make) in
            make.top.equalTo(pwdField.snp.bottom).offset(150)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(55)
        }

    }
}
