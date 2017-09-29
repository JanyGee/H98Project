//
//  LYRequestManager.swift
//  H98
//
//  Created by jany on 17/9/19.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}

typealias sendVlesClosure = (AnyObject?, NSError?)->Void
typealias uploadClosure = (AnyObject?, NSError?,Int64?,Int64?,Int64?)->Void

class LYRequestManager: NSObject {
    
    static let share : LYRequestManager = LYRequestManager()
    
    private override init(){}
    
    func requestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error ?? " --- 网络请求发生了错误 --- ")
                return
            }
            finishedCallback(result)
        }
    }

    //https://my.oschina.net/iceTear/blog/743007
//    // --GET请求获取JSON数据
//    func BLGetJSONDataWithUrl(url: String, parameters: AnyObject, successed:(responseObject: AnyObject?) -> (), failed: (error: NSError?) -> ()) {
//        
//        Alamofire.request(.GET, url, parameters: parameters as? [String : AnyObject]).responseJSON { (data: Response<AnyObject, NSError>) in
//            if data.result.isSuccess {
//                successed(responseObject: data.data)
//            }else {
//                failed(error: data.result.error)
//            }
//        }
//    }
//    
//    // --POST请求获取JSON数据
//    func BLPostJSONDataWithUrl(url: String, parameters: AnyObject, successed:(responseObject: AnyObject?) -> (), failed: (error: NSError?) -> ()) {
//        //print(parameters)
//        Alamofire.request(.POST, url, parameters: parameters as? [String : AnyObject]).responseJSON { (data: Response<AnyObject, NSError>) in
//            if data.result.isSuccess {
//                successed(responseObject: data.data)
//            }else {
//                failed(error: data.result.error)
//            }
//        }
//        
//    }
//    
//    //fileURL实例:let fileURL = NSBundle.mainBundle().URLForResource("Default",withExtension: "png")
//    func BLUpload(URLString:String,fileURL:NSURL,progress:(bytesWritten: Int64?,totalBytesWritten: Int64?,totalBytesExpectedToWrite: Int64?) -> Void, responseResult:(responseValue: AnyObject?,error: NSError?) -> Void) {
//        
//        Alamofire.upload(.POST, URLString, file: fileURL).progress {(bytesWritten, totalBytesWritten, totalBytesExpectedToWrite) -> Void in
//            progress(bytesWritten:bytesWritten,totalBytesWritten:totalBytesWritten,totalBytesExpectedToWrite:totalBytesExpectedToWrite)
//            }.responseJSON { response in
//                responseResult(responseValue:response.result.value,error:response.result.error)
//        }
//    }
}
