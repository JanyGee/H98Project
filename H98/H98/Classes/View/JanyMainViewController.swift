//
//  JanyMainViewController.swift
//  MyWeiBo
//
//  Created by jany on 17/8/23.
//  Copyright © 2017年 Jany. All rights reserved.
//

import UIKit

class JanyMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupChildControllers()
    }
}

extension JanyMainViewController{
    
    
    /// 设置所有子控制器
    func setupChildControllers() {
        
        let array = [
            ["clsName":"LYHomeViewController","title":NSLocalizedString("first_Page", comment: "first_Page"),"imageName":"homepage"],
            ["clsName":"LYInteractiveViewController","title":NSLocalizedString("Interactive", comment: "Interactive"),"imageName":"nteraction"],
            ["clsName":"LYMineViewController","title":NSLocalizedString("mine", comment: "mine"),"imageName":"me"],
                     ]
        
        var arrayM = [UIViewController]()
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        
        viewControllers = arrayM
    }
    
    
    /// 使用字典创建子控制器
    ///
    /// - Parameter dict: 信息字典
    /// - Returns: 子控制器
    func controller(dict:[String:String]) -> UIViewController {
     
        guard let clsName = dict["clsName"],
                    let title = dict["title"],
                let imageName = dict["imageName"],
            let cls = NSClassFromString(Bundle.main.namespace() + "." + clsName) as? UIViewController.Type else {
                
            return UIViewController()
        }
        
        let vc = cls.init()
        
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "Selected")?.withRenderingMode(.alwaysOriginal)
        
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.cz_color(withHex: 0x6a30f5)], for: .highlighted)
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12)], for: .normal)
        let nav = JanyNavigationController(rootViewController: vc)
        
        return nav
        
    }
}
