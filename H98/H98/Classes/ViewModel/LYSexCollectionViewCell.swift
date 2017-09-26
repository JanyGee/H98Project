//
//  LYSexCollectionViewCell.swift
//  H98
//
//  Created by Jany on 17/9/26.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYSexCollectionViewCell: UICollectionViewCell {
    
    lazy var bkImageView:UIImageView = UIImageView()
    lazy var boyButton:UIButton = UIButton()
    lazy var girlButton:UIButton = UIButton()
    lazy var boyLabel:UILabel = UILabel()
    lazy var girlLabel:UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LYSexCollectionViewCell{
    
    fileprivate func setupUI() -> Void {
        
        addSubview(bkImageView)
        addSubview(boyButton)
        addSubview(girlButton)
        addSubview(boyLabel)
        addSubview(girlLabel)
        
        bkImageView.image = UIImage(named: "bg_bind")
        bkImageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        
        
        boyButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX).offset(-50)
            make.centerY.equalTo(self.snp.centerY).offset(-20)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
        boyButton.layer.cornerRadius = 40
        boyButton.setBackgroundImage(UIImage(named:"boy_avatar1"), for: .normal)
        
        girlButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX).offset(50)
            make.centerY.equalTo(self.snp.centerY).offset(-20)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
        girlButton.layer.cornerRadius = 40
        girlButton.setBackgroundImage(UIImage(named:"girl_avatar2"), for: .normal)
        
        boyLabel.font = UIFont.systemFont(ofSize: 15)
        boyLabel.textColor = UIColor.cz_color(withHex: 0xff6854)
        boyLabel.textAlignment = .center
        boyLabel.text = NSLocalizedString("boy_new", comment: "男")
        boyLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(boyButton.snp.centerX)
            make.top.equalTo(boyButton.snp.bottom).offset(5)
            make.size.equalTo(CGSize(width: 50, height: 20))
        }
        
        girlLabel.font = UIFont.systemFont(ofSize: 15)
        girlLabel.textColor = UIColor.lightGray
        girlLabel.textAlignment = .center
        girlLabel.text = NSLocalizedString("girl_new", comment: "女")
        girlLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(girlButton.snp.centerX)
            make.top.equalTo(girlButton.snp.bottom).offset(5)
            make.size.equalTo(CGSize(width: 50, height: 20))
        }
    }
}
