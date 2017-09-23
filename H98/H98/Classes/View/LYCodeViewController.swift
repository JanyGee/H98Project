//
//  LYCodeViewController.swift
//  H98
//
//  Created by Jany on 17/9/20.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYCodeViewController: LBXScanViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.lightGray
        var style = LBXScanViewStyle()
        style.anmiationStyle = .NetGrid
        style.animationImage = UIImage(named: "qrcode_scan_full_net")
        style.isNeedShowRetangle = false
        style.colorAngle = UIColor.white
        style.photoframeAngleH = 100
        style.photoframeAngleW = 100
        style.photoframeLineW = 2
        scanStyle = style
    }
    
    //MARK: 对扫描结果进行处理
    override func handleCodeResult(arrayResult: [LBXScanResult]) {
        
        for result:LBXScanResult in arrayResult
        {
            print("%@",result.strScanned ?? "")
            
            guard let cls = NSClassFromString(Bundle.main.namespace() + "." + "LYDeviceInforViewController") as? UIViewController.Type else {
                return
            }
            
            let vc = cls.init()
            vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(vc, animated: true, completion: nil)
        }
    }
}

