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
    lazy var linePath:UIBezierPath = UIBezierPath()
    lazy var myLayer:CAShapeLayer = CAShapeLayer()
    var batteryValue:CGFloat = 0.2
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        linePath.move(to: CGPoint(x: 2, y: 10))
        linePath.addLine(to: CGPoint(x: 2 + 32 * batteryValue, y: 10))
        myLayer.fillColor = UIColor.clear.cgColor
        
        if batteryValue <= 0.2 {
            
            myLayer.strokeColor = UIColor.red.cgColor
            
        }else if batteryValue > 0.2 && batteryValue < 0.5{
            
            myLayer.strokeColor = UIColor.orange.cgColor
            
        }else{
            
            myLayer.strokeColor = UIColor.green.cgColor
        }
        
        myLayer.lineWidth = frame.size.height - 4
        myLayer.path = linePath.cgPath
        layer.addSublayer(myLayer)
        
        
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 2
        pathAnimation.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        pathAnimation.fromValue = 0
        pathAnimation.toValue = 1
        pathAnimation.autoreverses = false
        myLayer.add(pathAnimation, forKey: "strokeEndAnimation")
        
    }

}

extension LYBatteryView{

    fileprivate func setupUI() -> Void {
        
        batteryImageView.image = UIImage(named: "battey")
        addSubview(batteryImageView)
        batteryImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        linePath = UIBezierPath()
    }
    
    func setBatteryValue(value:CGFloat) -> Void {
    
        batteryValue = value
        setNeedsDisplay()
    }
}
