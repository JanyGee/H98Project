//
//  LYHeightCollectionViewCell.swift
//  H98
//
//  Created by Jany on 17/9/26.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYHeightCollectionViewCell: UICollectionViewCell {
    
    lazy var bkImageView:UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LYHeightCollectionViewCell{
    
    fileprivate func setupUI() -> Void {
        
        addSubview(bkImageView)
        
        bkImageView.image = UIImage(named: "bg_bind")
        bkImageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        
    }
}
