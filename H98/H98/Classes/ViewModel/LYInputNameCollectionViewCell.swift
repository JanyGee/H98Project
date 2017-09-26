//
//  LYInputNameCollectionViewCell.swift
//  H98
//
//  Created by Jany on 17/9/26.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYInputNameCollectionViewCell: UICollectionViewCell {
    
    lazy var bkImageView:UIImageView = UIImageView()
    lazy var portraitImageView:UIImageView = UIImageView()
    lazy var nameTxt:UITextField = UITextField()
    lazy var lineView:UIView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LYInputNameCollectionViewCell{
    
    fileprivate func setupUI() -> Void {
        addSubview(bkImageView)
        addSubview(portraitImageView)
        addSubview(nameTxt)
        addSubview(lineView)
        
        bkImageView.image = UIImage(named: "bg_bind")
        bkImageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        
        //portraitImageView.backgroundColor = UIColor.cz_random()
        portraitImageView.image = UIImage(named: "Name")
        portraitImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(20)
            make.centerY.top.equalTo(self.snp.centerY).offset(-50)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        nameTxt.borderStyle = .none
        nameTxt.textColor = UIColor.white
        nameTxt.clearButtonMode = .whileEditing
        //nameTxt.backgroundColor = UIColor.cz_random()
        nameTxt.snp.makeConstraints { (make) in
            make.left.equalTo(portraitImageView.snp.right)
            make.top.equalTo(portraitImageView.snp.top)
            make.bottom.equalTo(portraitImageView.snp.bottom).offset(-0.5)
            make.right.equalTo(self.snp.right).offset(-20)
        }
        
        lineView.backgroundColor = UIColor.white
        lineView.snp.makeConstraints { (make) in
            make.left.equalTo(portraitImageView.snp.right)
            make.right.equalTo(nameTxt.snp.right)
            make.top.equalTo(nameTxt.snp.bottom)
            make.height.equalTo(0.5)
        }
    }
}
