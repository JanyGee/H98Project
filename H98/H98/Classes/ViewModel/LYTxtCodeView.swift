//
//  LYTxtCodeView.swift
//  H98
//
//  Created by Jany on 17/9/20.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYTxtCodeView: UIView {

    lazy var txt:UITextField = UITextField()
    lazy var vLineView:UIView = UIView()
    lazy var hLineView:UIView = UIView()
    lazy var codeButton:UIButton = UIButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() -> Void {
        
        addSubview(txt)
        addSubview(vLineView)
        addSubview(hLineView)
        addSubview(codeButton)
        
        txt.borderStyle = .none
        txt.textColor = UIColor.white
        txt.backgroundColor = UIColor.cz_random()
        txt.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.right.equalTo(self.snp.centerX).offset(30)
            make.bottom.equalTo(-5)
        }
        
        vLineView.backgroundColor = UIColor.white
        vLineView.snp.makeConstraints { (make) in
            make.left.equalTo(txt.snp.right)
            make.top.equalTo(5)
            make.bottom.equalTo(-5)
            make.width.equalTo(0.5)
        }
        
        hLineView.backgroundColor = UIColor.white
        hLineView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.bottom.equalTo(0)
            make.width.equalTo(self)
            make.height.equalTo(1)
        }
        
        codeButton.backgroundColor = UIColor.cz_random()
        codeButton.setTitle(NSLocalizedString("send_code", comment: "发送验证码"), for: .normal)
        codeButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        codeButton.setTitleColor(UIColor.white, for: .normal)
        codeButton.snp.makeConstraints { (make) in
            make.left.equalTo(vLineView.snp.right)
            make.top.equalTo(0)
            make.bottom.equalTo(-5)
            make.right.equalTo(self.snp.right)
        }
        
    }
    
    public func setTxtPlaceHolder(place:String) {
        txt.placeholder = place
    }
}
