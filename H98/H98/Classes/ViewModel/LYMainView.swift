//
//  LYMainView.swift
//  H98
//
//  Created by Jany on 17/9/26.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYMainView: UIView {
    
    lazy var blurView:UIVisualEffectView = UIVisualEffectView()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}

extension LYMainView{
    
    func setupUI() -> Void {
        
        let version = UIDevice.systemVersion() as Double
        
        if version < 10.0 {//10.0以后使用毛玻璃效果
            
            
        }
        self.addSubview(blurView)
        
    }
}
