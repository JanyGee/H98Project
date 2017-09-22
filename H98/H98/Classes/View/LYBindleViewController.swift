//
//  LYBindleViewController.swift
//  H98
//
//  Created by Jany on 17/9/20.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import Hero

class LYBindleViewController: UIViewController {

    lazy var bkImageView:UIImageView = UIImageView()
    lazy var titleView:LYTitleView = LYTitleView()
    lazy var scanView:LYScanView = LYScanView()
    lazy var inputNumberView:LYScanView = LYScanView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.cz_color(withHex: 0xff6852)
        
        setupUI()
    }

}

extension LYBindleViewController{

    //MARK: UI
   fileprivate func setupUI() -> Void {
        
        //isHeroEnabled = true
        
        view.addSubview(bkImageView)
        view.addSubview(titleView)
        view.addSubview(scanView)
        view.addSubview(inputNumberView)
        
        bkImageView.backgroundColor = UIColor.cz_random()
        bkImageView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        
        titleView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.frame.size.width)
            make.height.equalTo(66)
            make.top.equalTo(0)
        }
        
        titleView .setButtonStateAndTitle(flag: false, title: NSLocalizedString("bind_equipment", comment: "绑定设备"))
        titleView.leftButtonClickBlock = {
            
            self.dismiss(animated: true, completion: nil)
        }
        
        scanView.heroID = "scanView"
        scanView.setUIWithData(img: "", titleStr: NSLocalizedString("scan_for_bind", comment: "扫描设备二维码绑定"))
        scanView.snp.makeConstraints { (make) in
            make.top.equalTo(titleView.snp.bottom).offset(24)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(self.view.snp.centerY).offset(20)
        }
        
        scanView.tapViewBlock = {
            
            guard let cls = NSClassFromString(Bundle.main.namespace() + "." + "LYCodeViewController") as? UIViewController.Type else {
                return
            }
            
            let vc = cls.init()
            vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(vc, animated: true, completion: nil)
        }
        
        inputNumberView.heroID = "input"
        inputNumberView.setUIWithData(img: "", titleStr: NSLocalizedString("input_number_bind", comment: "输入设备串号绑定"))
        inputNumberView.snp.makeConstraints { (make) in
            make.top.equalTo(scanView.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(self.view.snp.bottom).offset(-20)
        }
        
        inputNumberView.tapViewBlock = {
            
            guard let cls = NSClassFromString(Bundle.main.namespace() + "." + "LYInputViewController") as? UIViewController.Type else {
                return
            }
            
            let vc = cls.init()
            self.present(vc, animated: true, completion: nil)
            
        }
    }
}
