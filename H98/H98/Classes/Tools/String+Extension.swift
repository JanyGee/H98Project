//
//  NSString+Extension.swift
//  H98
//
//  Created by Jany on 17/9/29.
//  Copyright © 2017年 apple. All rights reserved.
//

import Foundation

extension String{

    //MARK: 手机验证
    func valiMobile() -> Bool {
        
        let m = self as NSString
        
        if m.length != 11 {
            return false
        }
        
        /**
         * 手机号码:
         * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[0, 1, 6, 7, 8], 18[0-9]
         * 移动号段: 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
         * 联通号段: 130,131,132,145,155,156,170,171,175,176,185,186
         * 电信号段: 133,149,153,170,173,177,180,181,189
         */
        let MOBILE = "^1(3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9])\\d{8}$"
        
        /**
         * 中国移动：China Mobile
         * 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
         */
        let CM = "^1(3[4-9]|4[7]|5[0-27-9]|7[08]|8[2-478])\\d{8}$"
        
        /**
         * 中国联通：China Unicom
         * 130,131,132,145,155,156,170,171,175,176,185,186
         */
        let CU = "^1(3[0-2]|4[5]|5[56]|7[0156]|8[56])\\d{8}$"
        
        /**
         * 中国电信：China Telecom
         * 133,149,153,170,173,177,180,181,189
         */
        let CT = "^1(3[0-2]|4[5]|5[56]|7[0156]|8[56])\\d{8}$"
        
        let regextestmobile = NSPredicate(format:"SELF MATCHES" + MOBILE)
        let regextestcm = NSPredicate(format:"SELF MATCHES %@",CM)
        let regextestcu = NSPredicate(format:"SELF MATCHES %@",CU)
        let regextestct = NSPredicate(format:"SELF MATCHES %@",CT)
        
        if regextestmobile.evaluate(with: self)
        || regextestcm.evaluate(with: self)
        || regextestcu.evaluate(with: self)
        || regextestct.evaluate(with: self){
            return true
        }else{
            return false
        }
    }
    
    //MARK: 邮箱验证
    func validEmail() -> Bool {
        let emailRegex = "[\\w!#$%&'*+/=?^_`{|}~-]+(?:\\.[\\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\\w](?:[\\w-]*[\\w])?\\.)+[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@",emailRegex)
        return emailTest.evaluate(with: self)
    }
}
