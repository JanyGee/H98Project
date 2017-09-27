//
//  LYDeviceCollectionViewCell.swift
//  H98
//
//  Created by Jany on 17/9/27.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

enum SelectType {
    case Left
    case Middle
    case Right
}
class LYDeviceCollectionViewCell: UICollectionViewCell {
    
    lazy var normalBKImageView:UIImageView = UIImageView()
    lazy var selectBKImageView:UIImageView = UIImageView()
    lazy var headImageView:UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension LYDeviceCollectionViewCell{

    
    public func setSelectedItem(type:SelectType ,headImage:String) -> Void {
        
        addSubview(selectBKImageView)
        addSubview(headImageView)
        
        //selectBKImageView.backgroundColor = UIColor.cz_random()
        selectBKImageView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.snp.top).offset(10)
            make.bottom.equalTo(self.snp.bottom)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        
        switch type {
        case .Left:
            selectBKImageView.image = UIImage(named: "Selected_left")
            selectBKImageView.layer.shadowColor = UIColor.darkGray.cgColor
            selectBKImageView.layer.shadowOpacity = 0.8
            selectBKImageView.layer.shadowRadius = 4
            selectBKImageView.layer.shadowOffset = CGSize(width: 4, height: 4)
            //headImageView.backgroundColor = UIColor.cz_random()
            
            headImageView.image = UIImage(named: headImage)
            headImageView.snp.makeConstraints { (make) in
                make.centerX.equalTo(self.snp.centerX).offset(-2)
                make.centerY.equalTo(self.snp.centerY).offset(2)
                make.size.equalTo(CGSize(width: 50, height: 50))
            }
            
            break
        case .Middle:
            selectBKImageView.image = UIImage(named: "Selected_middle")
            selectBKImageView.layer.shadowColor = UIColor.darkGray.cgColor
            selectBKImageView.layer.shadowOpacity = 0.8
            selectBKImageView.layer.shadowRadius = 4
            selectBKImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
            //headImageView.backgroundColor = UIColor.cz_random()
            headImageView.image = UIImage(named: headImage)
            headImageView.snp.makeConstraints { (make) in
                make.centerX.equalTo(self.snp.centerX)
                make.centerY.equalTo(self.snp.centerY).offset(2)
                make.size.equalTo(CGSize(width: 50, height: 50))
            }
            
            break
        default:
            selectBKImageView.image = UIImage(named: "Selected_right")
            selectBKImageView.layer.shadowColor = UIColor.darkGray.cgColor
            selectBKImageView.layer.shadowOpacity = 0.8
            selectBKImageView.layer.shadowRadius = 4
            selectBKImageView.layer.shadowOffset = CGSize(width: -4, height: 0)
            //headImageView.backgroundColor = UIColor.cz_random()
            headImageView.image = UIImage(named: headImage)
            headImageView.snp.makeConstraints { (make) in
                make.centerX.equalTo(self.snp.centerX).offset(2)
                make.centerY.equalTo(self.snp.centerY).offset(2)
                make.size.equalTo(CGSize(width: 50, height: 50))
            }
            
        }
    }
    
    public func setNormalItem(headImage:String) -> Void {
        
        addSubview(normalBKImageView)
        addSubview(headImageView)
        
        selectBKImageView.image = UIImage(named: "")
        
        //normalBKImageView.backgroundColor = UIColor.cz_random()
        normalBKImageView.image = UIImage(named: "notselected")
        normalBKImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
            make.size.equalTo(CGSize(width: 65, height: 65))
        }
        
        //headImageView.backgroundColor = UIColor.cz_random()
        headImageView.image = UIImage(named: headImage)
        headImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
    }
}
