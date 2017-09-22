//
//  LYCustomTopView.swift
//  H98
//
//  Created by Jany on 17/9/20.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import YYKit

class LYCustomTopView: UIView {

    lazy var bkImageView:UIImageView = UIImageView()
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
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func leftButtonClick() {
        leftButtonClickBlock?()
    }
    
    func setUIState(flag:Bool,bkImage:String,titleStr:String) -> Void {
        titleLabel.isHidden = flag
        titleLabel.text = titleStr
        bkImageView.image = UIImage(named: bkImage)
    }

    private func setupUI() {
        
        addSubview(bkImageView)
        addSubview(leftButton)
        addSubview(titleLabel)
        
        bkImageView.backgroundColor = UIColor.cz_random()
        bkImageView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        
        //leftButton.backgroundColor = UIColor.cz_random()
        leftButton.setBackgroundImage(UIImage(named: "back_image"), for:.normal)
        leftButton.addTarget(self, action: #selector(leftButtonClick), for: .touchUpInside)
        leftButton.snp.makeConstraints { (make) in
            
            make.size.equalTo(CGSize(width: 30, height: 30))
            make.left.equalTo(10)
            make.bottom.equalTo(-5)
        }
        
        //titleLabel.backgroundColor = UIColor.cz_random()
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.bottom.equalTo(0)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
    }
    
}
