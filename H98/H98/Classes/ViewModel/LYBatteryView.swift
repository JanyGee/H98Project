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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        /*
         UIBezierPath *linePath = [UIBezierPath bezierPath];
         [linePath moveToPoint:CGPointMake(_battoryImage.frame.origin.x + 2, _battoryImage.frame.origin.y + 8.5f)];
         [linePath addLineToPoint:CGPointMake(_battoryImage.frame.origin.x + 2 + (_battoryImage.frame.size.width - 7.f) * _battoryValue, _battoryImage.frame.origin.y + 8.5f)];
         if (!_chartLine) {
         _chartLine = [CAShapeLayer layer];
         }
         _chartLine.fillColor = [UIColor clearColor].CGColor;
         _chartLine.strokeColor = [[UIColor darkGrayColor] CGColor];
         _chartLine.lineWidth = _battoryImage.frame.size.height - 4;
         _chartLine.strokeEnd = 0.f;
         _chartLine.strokeEnd = 1.f;
         [self.layer addSublayer:_chartLine];
         _chartLine.path = linePath.CGPath;
         
         CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
         pathAnimation.duration = 2.f;
         pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
         pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
         pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
         pathAnimation.autoreverses = NO;
         [_chartLine addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
         */
        
        linePath.move(to: CGPoint(x: frame.origin.x + 2, y: center.y))
        linePath.addLine(to: CGPoint(x: frame.size.width - 5, y: center.y))
        
        
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
