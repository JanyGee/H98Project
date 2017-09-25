//
//  LYDeviceInforViewController.swift
//  H98
//
//  Created by Jany on 17/9/23.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import YYKit

class LYDeviceInforViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    lazy var titleView:LYTitleView = LYTitleView()
    lazy var titleLabel:YYLabel = YYLabel()
    var choiceView:UICollectionView?
    lazy var portaitCell:LYPortraitCollectionViewCell = LYPortraitCollectionViewCell()
    lazy var pageControl:UIImageView = UIImageView()
    lazy var nextButton:UIButton = UIButton(type: .custom)
    
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
        view.addSubview(nextButton)
        view.addSubview(pageControl)
        
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
        
        choiceView = UICollectionView(frame: CGRect(x: 0, y: 150, width: view.frame.size.width, height: view.frame.size.height - 250), collectionViewLayout: LYCustomLayout())
        choiceView?.register(LYPortraitCollectionViewCell.self, forCellWithReuseIdentifier: "PortraitCell")
        choiceView?.delegate = self
        choiceView?.dataSource = self
        //choiceView?.isScrollEnabled = false
        choiceView?.backgroundColor = UIColor.clear
        view.addSubview(choiceView!)
        
        
        pageControl.backgroundColor = UIColor.cz_random()
        pageControl.snp.makeConstraints { (make) in
            
            make.top.equalTo((choiceView?.snp.bottom)!).offset(5)
            make.centerX.equalTo(self.view.snp.centerX)
            make.size.equalTo(CGSize(width: 200, height: 10))
        }
        
        nextButton.backgroundColor = UIColor.cz_random()
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        nextButton.setTitle(NSLocalizedString("next", comment: "下一步"), for: .normal)
        nextButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.bottom).offset(-10)
            make.centerX.equalTo(self.view.snp.centerX)
            make.size.equalTo(CGSize(width: 300, height: 50))
        }
        
    }
    
    //MARK: UICollectionViewDelegate,UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PortraitCell", for: indexPath) as! LYPortraitCollectionViewCell
        cell.backgroundColor = UIColor.cz_random()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
}
