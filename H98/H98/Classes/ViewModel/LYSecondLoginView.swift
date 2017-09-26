//
//  LYSecondLoginView.swift
//  H98
//
//  Created by Jany on 17/9/19.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYSecondLoginView: UIView {

    private var qqButton:UIButton = UIButton(type: .custom)
    private var vLineView:UIView = UIView()
    private var weixinButton = UIButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() -> Void {
        addSubview(qqButton)
        addSubview(vLineView)
        addSubview(weixinButton)
        
        //qqButton.backgroundColor = UIColor.cz_random()
        qqButton.setTitleColor(UIColor.darkGray, for: .normal)
        qqButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        qqButton.setImage(UIImage.init(named: "qq"), for: .normal)
        qqButton.setTitle(NSLocalizedString("qq_login", comment: "qq登陆"), for: .normal)
        qqButton.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.width.equalTo(100)
        }
        
        vLineView.backgroundColor = UIColor.darkGray
        vLineView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(0.5)
        }
        
        //weixinButton.backgroundColor = UIColor.cz_random()
        weixinButton.setTitleColor(UIColor.darkGray, for: .normal)
        weixinButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        weixinButton.setImage(UIImage.init(named: "weixin"), for: .normal)
        weixinButton.setTitle(NSLocalizedString("weixin_login", comment: "微信登陆"), for: .normal)
        weixinButton.snp.makeConstraints { (make) in
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.width.equalTo(100)
        }
    }

}
