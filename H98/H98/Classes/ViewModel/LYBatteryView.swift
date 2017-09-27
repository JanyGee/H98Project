//
//  LYBatteryView.swift
//  H98
//
//  Created by Jany on 17/9/27.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYBatteryView: UIView {

    lazy var batteryImageView:UIImageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension LYBatteryView{

    func setupUI() -> Void {
        
        batteryImageView.image = UIImage(named: "battey")
        addSubview(batteryImageView)
        batteryImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
        }
        
    }
}
