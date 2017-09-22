//
//  LYTxtView.swift
//  H98
//
//  Created by Jany on 17/9/19.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYTxtView: UIView {

    lazy var txt:UITextField = UITextField()
    lazy var hLineView:UIView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() -> Void {
        
        addSubview(txt)
        addSubview(hLineView)
        
        txt.borderStyle = .none
        txt.textColor = UIColor.white
        txt.backgroundColor = UIColor.cz_random()
        txt.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.width.equalTo(self)
            make.bottom.equalTo(-5)
        }
        
        hLineView.backgroundColor = UIColor.white
        hLineView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.bottom.equalTo(0)
            make.width.equalTo(self)
            make.height.equalTo(1)
        }
    }
    
    public func setTxtPlaceHolder(place:String) {
        txt.placeholder = place
    }
    
    func setTextFieldType(type:UIKeyboardType = .default) -> Void {
        txt.keyboardType = type
    }

}
