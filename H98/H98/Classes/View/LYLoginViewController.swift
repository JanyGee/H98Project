//
//  LYLoginViewController.swift
//  H98
//
//  Created by Jany on 17/9/18.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import Hero
import Toast_Swift

class LYLoginViewController: UIViewController,EAIntroDelegate {

    private lazy var bkImageView:UIImageView = UIImageView()
    lazy var titleView:LYTitleView = LYTitleView()
    lazy var txtField:LYTxtView = LYTxtView()
    lazy var pwdField:LYTxtView = LYTxtView()
    lazy var loginButton:UIButton = UIButton(type: .custom)
    lazy var regBtn:UIButton = UIButton(type: .custom)
    lazy var fogBtn:UIButton = UIButton(type: .custom)
    lazy var bottomView:LYSecondLoginView = LYSecondLoginView()
    var loginSuccessBlock:(()->())?
    
    
    var countTxt:String?
    var pwdTxt:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        firstLogin()
    }
    
    func loginRequest(account:String,pwd:String) -> Void {
        
//        let request = RequestManager.share()(request(<#T##url: URLConvertible##URLConvertible#>, method: <#T##HTTPMethod#>, parameters: <#T##Parameters?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>))
        
    }
    
    //MARK: 点击登录
    func loginButtonClick() -> Void {
        
        guard let mFlag = countTxt?.valiMobile(),let eFlag = countTxt?.validEmail() else {
            view.window?.makeToast(NSLocalizedString("account_not_formart", comment: "账号格式不对"), duration: 2, position: .bottom)
            return
        }
        
        //判断账号密码是否为空
        if !mFlag || !eFlag {
            
            view.window?.makeToast(NSLocalizedString("account_not_formart", comment: "账号格式不对"), duration: 2, position: .bottom)
            
            return
        }
        
        dismiss(animated: true) { [weak self] in
            self?.loginSuccessBlock!()
        }
    }
    
    //MARK: 注册
    func regClick() -> Void {
        
        guard let cls = NSClassFromString(Bundle.main.namespace() + "." + "LYRegistViewController") as? UIViewController.Type else {
            return
        }
        
        let vc = cls.init();
        present(vc, animated: true, completion: nil)
    }
    
    //MARK: 忘记密码
    func fogClick() -> Void {

        guard let cls = NSClassFromString(Bundle.main.namespace() + "." + "LYForgetViewController") as? UIViewController.Type else {
            return
        }
        let vc = cls.init();
        present(vc, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        txtField.keyBoardHide()
        pwdField.keyBoardHide()
    }

    //MARK: UI
    fileprivate func setupUI() {
        
        view.addSubview(bkImageView)
        view.addSubview(txtField)
        view.addSubview(pwdField)
        view.addSubview(loginButton)
        view.addSubview(regBtn)
        view.addSubview(fogBtn)
        view.addSubview(bottomView)
        
        bkImageView.image = UIImage(named: "LOGIN")
        bkImageView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
        }
        
        txtField.heroID = "count"
        //txtField.backgroundColor = UIColor.cz_random()
        txtField.setTxtPlaceHolder(place: NSLocalizedString("input_email_or_iphone", comment: "输入邮箱或者密码"))
        txtField.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.view).offset(-80)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(50)
        }
        txtField.backTextValue = {(str) in
        
            self.countTxt = str
        }
        
        pwdField.heroID = "code"
        //pwdField.backgroundColor = UIColor.cz_random()
        pwdField.setTxtPlaceHolder(place: NSLocalizedString("input_pwd", comment: "输入密码"))
        pwdField.snp.makeConstraints { (make) in
            make.top.equalTo(txtField.snp.bottom)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(50)
        }
        pwdField.backTextValue = {(str) in
            
            self.pwdTxt = str
        }
        
        loginButton.heroID = "log"
        //loginButton.backgroundColor = UIColor.cz_random()
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.titleEdgeInsets = UIEdgeInsetsMake(-5, 0, 0, 0)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        loginButton.setBackgroundImage(UIImage(named:"login_next"), for: .normal)
        loginButton.setTitle(NSLocalizedString("login", comment: "登录"), for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonClick), for: .touchUpInside)
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(pwdField.snp.bottom).offset(50)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(55)
        }
        
        regBtn.heroID = "reg"
        //regBtn.backgroundColor = UIColor.cz_random()
        regBtn.setTitleColor(UIColor.darkGray, for: .normal)
        regBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        regBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        regBtn.titleLabel?.textAlignment = .left
        regBtn.setTitle(NSLocalizedString("regist", comment: "注册"), for: .normal)
        regBtn.addTarget(self, action: #selector(regClick), for: .touchUpInside)
        regBtn.snp.makeConstraints { (make) in
            make.top.equalTo(loginButton.snp.bottom).offset(20)
            make.left.equalTo(70)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        
        fogBtn.heroID = "fog"
        //fogBtn.backgroundColor = UIColor.cz_random()
        fogBtn.setTitleColor(UIColor.darkGray, for: .normal)
        fogBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        fogBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        fogBtn.titleLabel?.textAlignment = .right
        fogBtn.setTitle(NSLocalizedString("forget_pwd", comment: "忘记密码"), for: .normal)
        fogBtn.addTarget(self, action: #selector(fogClick), for: .touchUpInside)
        fogBtn.snp.makeConstraints { (make) in
            make.top.equalTo(loginButton.snp.bottom).offset(20)
            make.right.equalTo(-70)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        
        //bottomView.backgroundColor = UIColor.cz_random()
        bottomView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view).offset(-30)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(50)
        }
    }
}

extension LYLoginViewController{
    
    func firstLogin() -> Void {
        
        if !UserDefaults.standard.bool(forKey: "firstLaunch") {
            
            //是第一次登陆,启动引导页
            showIntroPage()
            
        }else{
            
            setupUI()
        }
    }
    
    func showIntroPage() -> Void {
        
        let page1 = EAIntroPage()
        page1.bgImage = UIImage(named: "guide1")
        
        let page2 = EAIntroPage()
        page2.bgImage = UIImage(named: "guide2")
        
        let page3 = EAIntroPage()
        page3.bgImage = UIImage(named: "guide3")
        
        let intro = EAIntroView(frame: view.bounds, andPages: [page1,page2,page3])
        intro?.delegate = self
        intro?.pageControl = nil
        
        let btn = UIButton(type: .custom)
        btn.setTitle(NSLocalizedString("skip_view", comment: "skip_view"), for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 100, height: 10)
        intro?.skipButton = btn
        
        intro?.show(in: view, animateDuration: 0)
        
    }
    
    func introDidFinish(_ introView: EAIntroView!, wasSkipped: Bool) {
        
        UserDefaults.standard.set(true, forKey: "firstLaunch")
        UserDefaults.standard.synchronize()
    }
    
    func introWillFinish(_ introView: EAIntroView!, wasSkipped: Bool) {
        setupUI()
    }
}
