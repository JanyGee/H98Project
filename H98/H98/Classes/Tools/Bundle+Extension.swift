
//
//  Bundle+Extension.swift
//  MyWeiBo
//
//  Created by jany on 17/8/23.
//  Copyright © 2017年 Jany. All rights reserved.
//

import Foundation

extension Bundle{
    func namespace() -> String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
