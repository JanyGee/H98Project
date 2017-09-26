//
//  LYInputViewController.swift
//  H98
//
//  Created by Jany on 17/9/20.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYInputViewController: UIViewController {

    lazy var bkImageView:UIImageView = UIImageView()
    lazy var titleView:LYTitleView = LYTitleView()
    lazy var inputNumberView:LYScanView = LYScanView()
    lazy var txtField:LYTxtView = LYTxtView()
    lazy var bindButton:UIButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    func bindButtonClick() -> Void {
        
        guard let cls = NSClassFromString(Bundle.main.namespace() + "." + "LYDeviceInforViewController") as? UIViewController.Type else {
            return
        }
        
        let vc = cls.init()
        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(vc, animated: true, completion: nil)
    }

    //MARK: UI
    func setupUI() -> Void {
        
        isHeroEnabled = true
        
        view.addSubview(bkImageView)
        view.addSubview(titleView)
        view.addSubview(inputNumberView)
        view.addSubview(txtField)
        view.addSubview(bindButton)
        
        bkImageView.backgroundColor = UIColor.cz_color(withHex: 0x6a30f5)
        bkImageView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        
        titleView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.frame.size.width)
            make.height.equalTo(66)
            make.top.equalTo(0)
        }
        
        titleView.setButtonStateAndTitle(flag: false, title: NSLocalizedString("input_number", comment: "输入串号"))
        titleView.leftButtonClickBlock = {
            
            self.dismiss(animated: true, completion: nil)
        }
        
        inputNumberView.heroID = "input"
        inputNumberView.snp.makeConstraints { (make) in
            make.top.equalTo(titleView.snp.bottom).offset(24)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(self.view.snp.centerY).offset(40)
        }
        inputNumberView.setUIWithData(img: "chuanhao", titleStr: NSLocalizedString("input_number_bind", comment: "输入设备串号绑定"), flag: false, description: NSLocalizedString("introduce", comment: "请查看手表说明书"))
        
        //txtField.backgroundColor = UIColor.cz_random()
        txtField.setTextFieldType(type: .numberPad)
        txtField.setTxtPlaceHolder(place: NSLocalizedString("input_wait_bind", comment: "请输入待绑定的设备串号"))
        txtField.snp.makeConstraints { (make) in
            
            make.top.equalTo(inputNumberView.snp.bottom).offset(10)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(50)
        }
        
        //bindButton.backgroundColor = UIColor.cz_random()
        bindButton.setTitleColor(UIColor.white, for: .normal)
        bindButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        bindButton.setBackgroundImage(UIImage(named:"Next"), for: .normal)
        bindButton.setTitle(NSLocalizedString("bind", comment: "绑定"), for: .normal)
        bindButton.addTarget(self, action: #selector(bindButtonClick), for: .touchUpInside)
        bindButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.bottom).offset(-20)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(55)
        }
    }
}
