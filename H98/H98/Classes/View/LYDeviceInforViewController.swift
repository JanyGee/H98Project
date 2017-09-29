//
//  LYDeviceInforViewController.swift
//  H98
//
//  Created by Jany on 17/9/23.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYDeviceInforViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate {

    lazy var titleView:LYTitleView = LYTitleView()
    lazy var titleLabel:UILabel = UILabel()
    var choiceView:UICollectionView?
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
        choiceView?.register(LYInputNameCollectionViewCell.self, forCellWithReuseIdentifier: "InputNamCell")
        choiceView?.register(LYPortraitCollectionViewCell.self, forCellWithReuseIdentifier: "PortraitCell")
        choiceView?.register(LYSexCollectionViewCell.self, forCellWithReuseIdentifier: "SexCell")
        choiceView?.register(LYBirthdayCollectionViewCell.self, forCellWithReuseIdentifier: "BirthdayCell")
        choiceView?.register(LYHeightCollectionViewCell.self, forCellWithReuseIdentifier: "HeightCell")
        choiceView?.register(LYWeightCollectionViewCell.self, forCellWithReuseIdentifier: "WeightCell")
        choiceView?.register(LYStepsCollectionViewCell.self, forCellWithReuseIdentifier: "StepsCell")
        choiceView?.register(LYRelationshipCollectionViewCell.self, forCellWithReuseIdentifier: "RelationshipCell")
        choiceView?.delegate = self
        choiceView?.dataSource = self
        //choiceView?.isScrollEnabled = false
        choiceView?.backgroundColor = UIColor.clear
        view.addSubview(choiceView!)
        
        
        //pageControl.backgroundColor = UIColor.cz_random()
        pageControl.image = UIImage(named: "1")
        pageControl.snp.makeConstraints { (make) in
            
            make.top.equalTo((choiceView?.snp.bottom)!)
            make.centerX.equalTo(self.view.snp.centerX)
            make.size.equalTo(CGSize(width: 150, height: 10))
        }
        
        //nextButton.backgroundColor = UIColor.cz_random()
        nextButton.setBackgroundImage(UIImage(named: "Next"), for:.normal)
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
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
        
        if indexPath.row == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InputNamCell", for: indexPath) as! LYInputNameCollectionViewCell
            cell.backgroundColor = UIColor.clear
            return cell
        }else if indexPath.row == 1 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PortraitCell", for: indexPath) as! LYPortraitCollectionViewCell
            cell.backgroundColor = UIColor.clear
            return cell
        
        }else if indexPath.row == 2 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SexCell", for: indexPath) as! LYSexCollectionViewCell
            cell.backgroundColor = UIColor.clear
            return cell
            
        }else if indexPath.row == 3 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BirthdayCell", for: indexPath) as! LYBirthdayCollectionViewCell
            cell.backgroundColor = UIColor.clear
            return cell
            
        }else if indexPath.row == 4 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeightCell", for: indexPath) as! LYHeightCollectionViewCell
            cell.backgroundColor = UIColor.clear
            return cell
            
        }else if indexPath.row == 5 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeightCell", for: indexPath) as! LYWeightCollectionViewCell
            cell.backgroundColor = UIColor.clear
            return cell
            
        }else if indexPath.row == 6 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StepsCell", for: indexPath) as! LYStepsCollectionViewCell
            cell.backgroundColor = UIColor.clear
            return cell
            
        }else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RelationshipCell", for: indexPath) as! LYRelationshipCollectionViewCell
            cell.backgroundColor = UIColor.clear
            return cell
            
        }

    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let index = scrollView.contentOffset.x / 300
        
        if index == 0 {
            
            pageControl.image = UIImage(named: "1")
            
        }else if index == 1{
            
            pageControl.image = UIImage(named: "2")
        
        }else if index == 2{
            
            pageControl.image = UIImage(named: "3")
            
        }else if index == 3{
            
            pageControl.image = UIImage(named: "4")
            
        }else if index == 4{
            
            pageControl.image = UIImage(named: "5")
            
        }else if index == 5{
            
            pageControl.image = UIImage(named: "6")
            
        }else if index == 6{
            
            pageControl.image = UIImage(named: "7")
            
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print((choiceView?.contentOffset.x)! / 300)
    }
}
