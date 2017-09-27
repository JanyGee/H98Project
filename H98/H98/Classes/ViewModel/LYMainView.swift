//
//  LYMainView.swift
//  H98
//
//  Created by Jany on 17/9/26.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYMainView: UIView,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var flagPull:Bool?
    var index:NSInteger = 0
    
    lazy var topView:UIView = UIView()
    var deviceListView:UICollectionView?
    lazy var middelView:UIView = UIView()
    lazy var pullButton:UIButton = UIButton(type: .custom)
    lazy var lineView:UIView = UIView()
    lazy var positionTypeImageView:UIImageView = UIImageView()
    lazy var addressLabel:UILabel = UILabel()
    lazy var timeLabel:UILabel = UILabel()
    lazy var vLineView:UIView = UIView()
    
    lazy var rightButton:UIButton = UIButton(type: .custom)
    lazy var leftImageView:UIImageView = UIImageView()
    lazy var rightImageView:UIImageView = UIImageView()
    lazy var bottomLeftButton:UIButton = UIButton(type:.custom)
    lazy var bottomRightButton:UIButton = UIButton(type:.custom)
    
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
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10, options: .layoutSubviews, animations: {
            
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
    
    func swipeGesture(swip:UISwipeGestureRecognizer) -> Void {
        
        if swip.direction == UISwipeGestureRecognizerDirection.up {
            
            let endFrame = frame
            //frame = endFrame.offsetBy(dx: 0, dy: 100)
            
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10, options: .layoutSubviews, animations: {
                
                if !self.flagPull! {
                    self.flagPull = true
                    self.frame = endFrame.offsetBy(dx: 0, dy: -100)
                    
                }else{
                    
                    return
                }
                
            }) { (flag) in
                
                
            }
            
        }else if swip.direction == UISwipeGestureRecognizerDirection.down {
            
            
            let endFrame = frame
            //frame = endFrame.offsetBy(dx: 0, dy: 100)
            
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10, options: .layoutSubviews, animations: {
                
                if !self.flagPull! {
                    return
                    
                }else{
                    self.flagPull = false
                    self.frame = endFrame.offsetBy(dx: 0, dy: 100)
                }
                
            }) { (flag) in
                
                
            }
            
        }
        
    }

    //MARK: UICollectionViewDelegate,UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "deviceCell", for: indexPath) as! LYDeviceCollectionViewCell
        //cell.backgroundColor = UIColor.cz_random()
        
        if indexPath.row == index {
            
            if index == 0 {
                cell.setSelectedItem(type: .Left, headImage: "main_boy")
            }else if index == 6{
                cell.setSelectedItem(type: .Right, headImage: "main_boy")
            }else{
                cell.setSelectedItem(type: .Middle, headImage: "main_girl")
            }
            
        }else{
            
            cell.setNormalItem(headImage: "main_boy")
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        index = indexPath.row
        deviceListView?.reloadData()
    }
}

extension LYMainView{
    
    fileprivate func setupUI() -> Void {
        
        //add gesture to self
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture))
        swipeUp.direction = .up
        addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture))
        swipeDown.direction = .down
        addGestureRecognizer(swipeDown)
        
        //top
        addSubview(topView)
        topView.backgroundColor = UIColor.clear
        topView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(80)
        }
        
        deviceListView = UICollectionView(frame: topView.bounds, collectionViewLayout: LYDeviceListLayout())
        deviceListView?.register(LYDeviceCollectionViewCell.self, forCellWithReuseIdentifier: "deviceCell")
        deviceListView?.delegate = self
        deviceListView?.dataSource = self
        deviceListView?.showsHorizontalScrollIndicator = false
        topView.addSubview(deviceListView!)
        deviceListView?.backgroundColor = UIColor.clear
        deviceListView?.snp.makeConstraints({ (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(80)
        })
        
        //middel
        addSubview(middelView)
        middelView.backgroundColor = UIColor.white
        //middelView.corner(byRoundingCorners: [.topRight,.topLeft], radii: 2)
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
        lineView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        lineView.snp.makeConstraints { (make) in
            
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(pullButton.snp.bottom).offset(5)
            make.height.equalTo(0.5)
            
        }
        
        middelView.addSubview(positionTypeImageView)
        //positionTypeImageView.backgroundColor = UIColor.cz_random()
        positionTypeImageView.image = UIImage(named: "Wifi")
        positionTypeImageView.snp.makeConstraints { (make) in
            make.left.equalTo(middelView.snp.left).offset(20)
            make.top.equalTo(lineView.snp.bottom).offset(31)
            make.size.equalTo(CGSize(width: 20, height: 15))
        }
        
        //
        middelView.addSubview(rightButton)
        rightButton.setBackgroundImage(UIImage(named:"go"), for: .normal)
        //rightButton.backgroundColor = UIColor.cz_random()
        rightButton.snp.makeConstraints { (make) in
            make.right.equalTo(middelView.snp.right).offset(-10)
            make.top.equalTo(lineView.snp.bottom).offset(25)
            make.size.equalTo(CGSize(width: 60, height: 50))
        }
        
        middelView.addSubview(vLineView)
        vLineView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        vLineView.snp.makeConstraints { (make) in
            make.right.equalTo(rightButton.snp.left).offset(-10)
            make.top.equalTo(lineView.snp.bottom).offset(20)
            make.bottom.equalTo(middelView.snp.bottom).offset( -15)
            make.width.equalTo(1)
        }

        ///
        middelView.addSubview(addressLabel)
        addressLabel.text = "广东省深圳市南山区松坪山路5号"
        //addressLabel.font = UIFont.systemFont(ofSize: 15)
        addressLabel.adjustsFontSizeToFitWidth = true
        //addressLabel.backgroundColor = UIColor.cz_random()
        addressLabel.snp.makeConstraints { (make) in
            make.left.equalTo(positionTypeImageView.snp.right).offset(5)
            make.top.equalTo(lineView.snp.bottom).offset(20)
            make.right.equalTo(vLineView.snp.left).offset(-10)
            make.height.equalTo(40)
        }

        middelView.addSubview(timeLabel)
        timeLabel.text = "2019-09-05 18:34:25"
        timeLabel.textColor = UIColor.lightGray
        timeLabel.adjustsFontSizeToFitWidth = true
        //timeLabel.backgroundColor = UIColor.cz_random()
        timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(positionTypeImageView.snp.right).offset(5)
            make.top.equalTo(addressLabel.snp.bottom)
            make.right.equalTo(vLineView.snp.left).offset(-10)
            make.height.equalTo(20)
        }
        
        
        //bottom
        addSubview(bottomView)
        bottomView.backgroundColor = UIColor.white
        bottomView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(middelView.snp.bottom)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        addSubview(leftImageView)
        //leftImageView.backgroundColor = UIColor.cz_random()
        leftImageView.image = UIImage(named: "main_bg")
        leftImageView.snp.makeConstraints { (make) in
            make.top.equalTo(bottomView.snp.top)
            make.right.equalTo(bottomView.snp.centerX).offset(-5)
            make.left.equalTo(bottomView.snp.left).offset(10)
            make.bottom.equalTo(bottomView.snp.bottom).offset(-10)
        }
        
        addSubview(rightImageView)
        //rightImageView.backgroundColor = UIColor.cz_random()
        rightImageView.image = UIImage(named: "main_bg")
        rightImageView.snp.makeConstraints { (make) in
            make.top.equalTo(bottomView.snp.top)
            make.left.equalTo(bottomView.snp.centerX).offset(5)
            make.right.equalTo(bottomView.snp.right).offset(-10)
            make.bottom.equalTo(bottomView.snp.bottom).offset(-10)
        }
        
        leftImageView.addSubview(bottomLeftButton)
        //bottomLeftButton.backgroundColor = UIColor.cz_random()
        bottomLeftButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0)
        bottomLeftButton.setTitle(NSLocalizedString("call_phone", comment: "宝贝通话"), for: .normal)
        bottomLeftButton.setImage(UIImage(named:"dianhua"), for: .normal)
        bottomLeftButton.setTitleColor(UIColor.lightGray, for: .normal)
        bottomLeftButton.snp.makeConstraints { (make) in
            make.left.equalTo(leftImageView.snp.left)
            make.top.equalTo(leftImageView.snp.top)
            make.right.equalTo(leftImageView.snp.right)
            make.bottom.equalTo(leftImageView.snp.bottom)
            
        }
        
        rightImageView.addSubview(bottomRightButton)
        //bottomRightButton.backgroundColor = UIColor.cz_random()
        bottomRightButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0)
        bottomRightButton.setTitle(NSLocalizedString("track_map", comment: "宝贝通话"), for: .normal)
        bottomRightButton.setImage(UIImage(named:"guiji"), for: .normal)
        bottomRightButton.setTitleColor(UIColor.lightGray, for: .normal)
        bottomRightButton.snp.makeConstraints { (make) in
            make.left.equalTo(rightImageView.snp.left)
            make.top.equalTo(rightImageView.snp.top)
            make.right.equalTo(rightImageView.snp.right)
            make.bottom.equalTo(rightImageView.snp.bottom)
        }
    }
    
}
