//
//  LYScanView.swift
//  H98
//
//  Created by Jany on 17/9/20.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import YYKit

class LYScanView: UIView {

    lazy var bkImageView:UIImageView = UIImageView()
    lazy var imgView:UIImageView = UIImageView()
    lazy var title:YYLabel = YYLabel()
    lazy var descriptionBtn:UIButton = UIButton()
    
    var tapViewBlock:(()->())?
    var descriptionBtnBlock:(()->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private func setupUI() -> Void {
        
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(tapFunction))
        addGestureRecognizer(tapGesture)
        
        addSubview(bkImageView)
        addSubview(imgView)
        addSubview(title)
        addSubview(descriptionBtn)
        
        //backgroundColor = UIColor.white
        
        bkImageView.image = UIImage(named: "bg")
        bkImageView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        
        //imgView.backgroundColor = UIColor.cz_random()
        //imgView.image = UIImage(named: "saomiao")
        imgView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY).offset(-35)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        //title.backgroundColor = UIColor.cz_random()
        title.textAlignment = .center
        title.textColor = UIColor.darkGray
        title.font = UIFont.systemFont(ofSize: 18)
        title.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY).offset(70)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        //descriptionBtn.backgroundColor = UIColor.cz_random()
        descriptionBtn.setTitle(NSLocalizedString("introduce", comment: "请查看手表说明书"), for: .normal)
        descriptionBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        descriptionBtn.setTitleColor(UIColor.lightGray, for: .normal)
        descriptionBtn.addTarget(self, action: #selector(descriptionBtnClick), for: .touchUpInside)
        descriptionBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(title.snp.centerX)
            make.top.equalTo(title.snp.bottom).offset(5)
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
    }

    func tapFunction() -> Void {
        tapViewBlock?()
    }
    
    func setUIWithData(img:String, titleStr:String, flag:Bool = true, description:String = "") -> Void {

        descriptionBtn.isHidden = flag
        descriptionBtn.setTitle(description, for: .normal)
        imgView.image = UIImage(named: img)
        title.text = titleStr
    }
    
    func descriptionBtnClick() -> Void {
        descriptionBtnBlock?()
    }
}
