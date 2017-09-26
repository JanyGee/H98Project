//
//  LYMainView.swift
//  H98
//
//  Created by Jany on 17/9/26.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYMainView: UIView {
    
    var flagPull:Bool?
    
    lazy var topView:UIView = UIView()
    
    lazy var middelView:UIView = UIView()
    lazy var pullButton:UIButton = UIButton(type: .custom)
    lazy var lineView:UIView = UIView()
    
    lazy var bottomView:UIView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //backgroundColor = UIColor.cz_random()
        flagPull = true
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pullDownAction() -> Void {
        
        let endFrame = frame
        //frame = endFrame.offsetBy(dx: 0, dy: 100)
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .layoutSubviews, animations: {
            
            if self.flagPull! {
                self.flagPull = false
                self.frame = endFrame.offsetBy(dx: 0, dy: 100)
                
            }else{
                self.flagPull = true
                self.frame = endFrame.offsetBy(dx: 0, dy: -100)
            }
            
        }) { (flag) in
            
        }
    }

}

extension LYMainView{
    
    fileprivate func setupUI() -> Void {
        
        //top
        addSubview(topView)
        topView.backgroundColor = UIColor.cz_random()
        topView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(80)
        }
        
        //middel
        addSubview(middelView)
        middelView.backgroundColor = UIColor.cz_random()
        middelView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(topView.snp.bottom)
            make.height.equalTo(120)
        }
        
        middelView.addSubview(pullButton)
        pullButton.setBackgroundImage(UIImage(named:"pull"), for: .normal)
        pullButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(middelView.snp.centerX)
            make.top.equalTo(middelView.snp.top).offset(5)
            make.size.equalTo(CGSize(width: 30, height: 10))
        }
        pullButton.addTarget(self, action: #selector(pullDownAction), for: .touchUpInside)
        
        middelView.addSubview(lineView)
        lineView.backgroundColor = UIColor.lightGray
        lineView.snp.makeConstraints { (make) in
            
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(pullButton.snp.bottom).offset(5)
            make.height.equalTo(0.5)
            
        }
        
        addSubview(bottomView)
        bottomView.backgroundColor = UIColor.cz_random()
        bottomView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(middelView.snp.bottom)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
}
