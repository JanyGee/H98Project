//
//  LYForgetViewController.swift
//  H98
//
//  Created by Jany on 17/9/18.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import Hero

class LYForgetViewController: UIViewController {

    private lazy var titleView:LYTitleView = LYTitleView()
    private lazy var txtField:LYTxtView = LYTxtView()
    private lazy var txtCode:LYTxtCodeView = LYTxtCodeView()
    private lazy var nextButton:UIButton = UIButton(type: .custom)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.cz_color(withHex: 0xff6852)
        
        setupUI()
    }
    
    //MARK: 下一步
    func nextButtonClick() -> Void {
        
        guard let cls = NSClassFromString(Bundle.main.namespace() + "." + "LYResetViewController") as? UIViewController.Type else {
            return
        }
        
        let vc = cls.init()
        vc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        present(vc, animated: true, completion: nil)
    }
    
    //MARK: UI
    func setupUI() -> Void {
        
        isHeroEnabled = true
        
        view.addSubview(titleView)
        view.addSubview(txtField)
        view.addSubview(txtCode)
        view.addSubview(nextButton)
        
        titleView.heroID = "fog"
        titleView.setButtonStateAndTitle(flag: false, title: NSLocalizedString("forget_pwd", comment: "忘记密码"))
        titleView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(66)
            make.top.equalTo(0)
        }
        
        titleView.leftButtonClickBlock = {[weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
        
        txtField.heroID = "count"
        txtField.backgroundColor = UIColor.cz_random()
        txtField.setTxtPlaceHolder(place: NSLocalizedString("input_email_or_iphone", comment: "输入邮箱或者密码"))
        txtField.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.view).offset(-100)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(50)
        }
        
        txtCode.heroID = "code"
        txtCode.backgroundColor = UIColor.cz_random()
        txtCode.setTxtPlaceHolder(place: NSLocalizedString("input_code", comment: "输入验证码"))
        txtCode.snp.makeConstraints { (make) in
            make.top.equalTo(txtField.snp.bottom).offset(10)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(50)
        }
        
        nextButton.heroID = "log"
        nextButton.backgroundColor = UIColor.cz_random()
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.setTitle(NSLocalizedString("next", comment: "下一步"), for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonClick), for: .touchUpInside)
        nextButton.snp.makeConstraints { (make) in
            make.top.equalTo(txtCode.snp.bottom).offset(80)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(50)
        }
    }
}
