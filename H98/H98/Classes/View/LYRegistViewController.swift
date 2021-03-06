//
//  LYRegistViewController.swift
//  H98
//
//  Created by Jany on 17/9/18.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYRegistViewController: UIViewController {

    private lazy var bkImageView:UIImageView = UIImageView()
    private lazy var titleView:LYTitleView = LYTitleView()
    private lazy var txtField:LYTxtView = LYTxtView()
    private lazy var pwdField:LYTxtView = LYTxtView()
    private lazy var txtCode:LYTxtCodeView = LYTxtCodeView()
    private lazy var nextButton:UIButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        
        setupUI()
        
    }
    
    //MARK: 下一步
    func nextButtonClick() -> Void {
        
        guard let cls = NSClassFromString(Bundle.main.namespace() + "." + "LYBindleViewController") as? UIViewController.Type else {
            return
        }
        
        let vc = cls.init()
        vc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        present(vc, animated: true, completion: nil)
    }
    
    //MARK: UI
    func setupUI() -> Void {
        
        view.addSubview(bkImageView)
        view.addSubview(titleView)
        view.addSubview(txtField)
        view.addSubview(pwdField)
        view.addSubview(txtCode)
        view.addSubview(nextButton)
        
        bkImageView.image = UIImage(named: "REGISTER")
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

        titleView.leftButtonClickBlock = { [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
    

        //txtField.backgroundColor = UIColor.cz_random()
        txtField.setTxtPlaceHolder(place: NSLocalizedString("input_email_or_iphone", comment: "输入邮箱或者密码"))
        txtField.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.view).offset(-80)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(50)
        }
        
        //pwdField.backgroundColor = UIColor.cz_random()
        pwdField.setTxtPlaceHolder(place: NSLocalizedString("input_pwd", comment: "输入密码"))
        pwdField.snp.makeConstraints { (make) in
            make.top.equalTo(txtField.snp.bottom)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(50)
        }
        

        //txtCode.backgroundColor = UIColor.cz_random()
        txtCode.setTxtPlaceHolder(place: NSLocalizedString("input_code", comment: "输入验证码"))
        txtCode.snp.makeConstraints { (make) in
            make.top.equalTo(pwdField.snp.bottom)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(50)
        }
        
        //nextButton.backgroundColor = UIColor.cz_random()
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.titleEdgeInsets = UIEdgeInsetsMake(-5, 0, 0, 0)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        nextButton.setBackgroundImage(UIImage(named:"login_next"), for: .normal)
        nextButton.setTitle(NSLocalizedString("next", comment: "下一步"), for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonClick), for: .touchUpInside)
        nextButton.snp.makeConstraints { (make) in
            make.top.equalTo(txtCode.snp.bottom).offset(50)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(55)
        }
    
    }

}
