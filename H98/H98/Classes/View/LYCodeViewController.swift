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
    fileprivate lazy var scanKuangImageView:UIImageView = UIImageView()
    fileprivate lazy var scanLineImageView:UIImageView = UIImageView()
    fileprivate lazy var reminderLabel:UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.cz_random()
        setupUI()
    }
}

extension LYCodeViewController{

    //MARK: UI
    fileprivate func setupUI() {
        
        view.addSubview(titleView)
        view.addSubview(scanKuangImageView)
        view.addSubview(scanLineImageView)
        view.addSubview(reminderLabel)
        
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

        scanKuangImageView.backgroundColor = UIColor.cz_random()
        scanKuangImageView.snp.makeConstraints { (make) in
            make.top.equalTo(titleView.snp.bottom).offset(80)
            make.centerX.equalTo(self.view.snp.centerX)
            make.size.equalTo(CGSize(width: 280, height: 280))
        }
        
        scanLineImageView.backgroundColor = UIColor.cz_random()
        scanLineImageView.snp.makeConstraints { (make) in
            make.top.equalTo(titleView.snp.bottom).offset(80)
            make.centerX.equalTo(self.view.snp.centerX)
            make.size.equalTo(CGSize(width: 280, height: 5))
        }
        
        reminderLabel.backgroundColor = UIColor.cz_random()
        reminderLabel.textAlignment = .center
        reminderLabel.textColor = UIColor.white
        reminderLabel.font = UIFont.systemFont(ofSize: 12)
        reminderLabel.text = NSLocalizedString("scaning_label", comment: "将二维码图片对准扫描框即可自动扫描")
        reminderLabel.snp.makeConstraints { (make) in
            make.top.equalTo(scanKuangImageView.snp.bottom).offset(30)
            make.centerX.equalTo(self.view.snp.centerX)
            make.size.equalTo(CGSize(width: 280, height: 30))
        }
    }
}
