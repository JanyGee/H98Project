//
//  LYTitleView.swift
//  H98
//
//  Created by Jany on 17/9/18.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import YYKit

class LYTitleView: UIView {

    private lazy var titleLabel:YYLabel = YYLabel()
    private lazy var leftButton:UIButton = UIButton(type: .custom)
    var leftButtonClickBlock:(()->())?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        //leftButton.backgroundColor = UIColor.cz_random()
        leftButton.addTarget(self, action: #selector(leftButtonClick), for: .touchUpInside)
        addSubview(leftButton)
        
        leftButton.snp.makeConstraints { (make) in
            
            make.size.equalTo(CGSize(width: 30, height: 30))
            make.left.equalTo(10)
            make.bottom.equalTo(-5)
        }
        
        titleLabel = YYLabel()
        //titleLabel.backgroundColor = UIColor.cz_random()
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.bottom.equalTo(0)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
    }
    
    func setButtonStateAndTitle(flag:Bool = false,img:String = "back_image",title:String) -> Void {
        
        leftButton.isHidden = flag
        let image = UIImage(named: img)
        leftButton.setBackgroundImage(image, for:.normal)
        
        titleLabel.text = title
        titleLabel.sizeToFit()
    }
    
    func leftButtonClick() {
        leftButtonClickBlock?()
    }
}
