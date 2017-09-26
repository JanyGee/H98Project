//
//  LYPortraitCollectionViewCell.swift
//  H98
//
//  Created by Jany on 17/9/23.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYPortraitCollectionViewCell: UICollectionViewCell {
    
    lazy var bkImageView:UIImageView = UIImageView()
    lazy var portraitButton:UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LYPortraitCollectionViewCell{
    
    fileprivate func setupUI() -> Void {
        
        addSubview(bkImageView)
        addSubview(portraitButton)
        
        bkImageView.image = UIImage(named: "bg_bind")
        bkImageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        
        
        portraitButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.snp.top).offset(50)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
        
        portraitButton.setBackgroundImage(UIImage(named:"avatar"), for: .normal)
        portraitButton.layer.cornerRadius = 40
    }
}
