//
//  LYSelectDeviceView.swift
//  H98
//
//  Created by Jany on 17/9/27.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYSelectDeviceView: UIView {

    lazy var bkImageView:UIImageView = UIImageView()
    lazy var weekLabel:UILabel = UILabel()
    lazy var temLabel:UILabel = UILabel()
    lazy var weatherLabel:UILabel = UILabel()
    lazy var setpLabel:UILabel = UILabel()
    lazy var persentLabel:UILabel = UILabel()
    lazy var batteyView:LYBatteryView = LYBatteryView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //backgroundColor = UIColor.cz_random()
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension LYSelectDeviceView{

    func setupUI() -> Void {
        
        addSubview(bkImageView)
        addSubview(weekLabel)
        addSubview(temLabel)
        addSubview(weatherLabel)
        addSubview(setpLabel)
        addSubview(persentLabel)
        addSubview(batteyView)
        
        bkImageView.image = UIImage(named: "device_infor")
        bkImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        //weekLabel.backgroundColor = UIColor.cz_random()
        weekLabel.textColor = UIColor.darkGray
        weekLabel.text = "周五"
        weekLabel.adjustsFontSizeToFitWidth = true
        weekLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(10)
            make.centerY.equalTo(self.snp.centerY)
            make.size.equalTo(CGSize(width: 40, height: 30))
        }
        
        //temLabel.backgroundColor = UIColor.cz_random()
        temLabel.textColor = UIColor.darkGray
        temLabel.text = "28℃"
        temLabel.textColor = UIColor.darkGray
        temLabel.adjustsFontSizeToFitWidth = true
        temLabel.snp.makeConstraints { (make) in
            make.left.equalTo(weekLabel.snp.right).offset(10)
            make.centerY.equalTo(self.snp.centerY)
            make.size.equalTo(CGSize(width: 40, height: 30))
        }
        
        //weatherLabel.backgroundColor = UIColor.cz_random()
        weatherLabel.text = "多云"
        weatherLabel.textColor = UIColor.darkGray
        weatherLabel.adjustsFontSizeToFitWidth = true
        weatherLabel.snp.makeConstraints { (make) in
            make.left.equalTo(temLabel.snp.right)
            make.centerY.equalTo(self.snp.centerY)
            make.size.equalTo(CGSize(width: 30, height: 20))
        }
        
        //setpLabel.backgroundColor = UIColor.cz_random()
        setpLabel.text = "3000步"
        setpLabel.textColor = UIColor.darkGray
        setpLabel.adjustsFontSizeToFitWidth = true
        setpLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX).offset(20)
            make.centerY.equalTo(self.snp.centerY)
            make.size.equalTo(CGSize(width: 100, height: 30))
        }
        
        //batteyView.backgroundColor = UIColor.cz_random()
        batteyView.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-10)
            make.centerY.equalTo(self.snp.centerY)
            make.size.equalTo(CGSize(width: 40, height: 20))
        }
        
        //persentLabel.backgroundColor = UIColor.cz_random()
        persentLabel.text = "20%"
        persentLabel.textColor = UIColor.darkGray
        persentLabel.adjustsFontSizeToFitWidth = true
        persentLabel.snp.makeConstraints { (make) in
            make.right.equalTo(batteyView.snp.left)
            make.centerY.equalTo(self.snp.centerY)
            make.size.equalTo(CGSize(width: 40, height: 30))
        }
    }
    
}
