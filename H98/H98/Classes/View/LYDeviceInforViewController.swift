//
//  LYDeviceInforViewController.swift
//  H98
//
//  Created by Jany on 17/9/23.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import YYKit

class LYDeviceInforViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    lazy var titleView:LYTitleView = LYTitleView()
    lazy var titleLabel:YYLabel = YYLabel()
    var choiceView:UICollectionView?
    lazy var myLayout:LYCustomLayout = LYCustomLayout()
    lazy var portaitCell:LYPortraitCollectionViewCell = LYPortraitCollectionViewCell()
    lazy var pageControl:UIPageControl = UIPageControl()
    lazy var nextButton:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.cz_color(withHex: 0x6c33f3)
        setupUI()
    }

}

extension LYDeviceInforViewController{

    fileprivate func setupUI() -> Void {
    
        view.addSubview(titleView)
        view.addSubview(titleLabel)

        
        titleView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.frame.size.width)
            make.height.equalTo(66)
            make.top.equalTo(0)
        }
        
        titleView .setButtonStateAndTitle(flag: false)
        titleView.leftButtonClickBlock = { [weak self] in
            
            self?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        }
        
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        titleLabel.text = NSLocalizedString("baby_nick", comment: "宝贝昵称")
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleView.snp.bottom).offset(20)
            make.centerX.equalTo(self.view.snp.centerX)
            make.size.equalTo(CGSize(width: 200, height: 50))
        }
        
        
        choiceView = UICollectionView(frame: CGRect(x: 0, y: 200, width: 400, height: 500), collectionViewLayout: myLayout)
        choiceView?.register(LYPortraitCollectionViewCell.self, forCellWithReuseIdentifier: "PortraitCell")
        choiceView?.delegate = self
        choiceView?.dataSource = self
        //choiceView?.backgroundColor = UIColor.cz_random()
    
        view.addSubview(choiceView!)
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PortraitCell", for: indexPath) as! LYPortraitCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 400)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        let itemCount = collectionView.numberOfItems(inSection: section)
        let firstIndexPath = NSIndexPath.init(item: 0, section: section)
        
        
        
    }
}
