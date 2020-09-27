//
//  ApiManager.swift
//  interviewDemo
//
//  Created by wang fei on 2020/9/24.
//  Copyright © 2020 mackellen. All rights reserved.
//

import UIKit
import Alamofire
import RxCocoa
import RxSwift
import SwiftyJSON

enum baseURLPath:String{
      case test  = "https://test.github.com/"
      case sit    = "https://sit.github.com/"
      case uat   = "https://uat.github.com/"
      case pre   = "https://wanandroid.com/"
      case online = "https://api.github.com/"
}


class ApiManager: NSObject {

    static let shared = ApiManager()
    var URLPath = baseURLPath.online
    
    var headers: HTTPHeaders {
        return ["Content-Type": "text/plain"]
    }
    
    func apiBaseURL(path:String) -> String {
        let  baseURLString = URLPath.rawValue+path
        let newURL = baseURLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let urlRequest = URLRequest(url: URL(string: newURL)!)
        let urlString = urlRequest.url?.absoluteString
        return urlString!
    }
    
    // MARK: Get Method
       public func get(url: String, parameter: [String: Any]?) -> Observable<Dictionary<String, Any>> {
           return Observable<Dictionary<String, Any>>.create { [weak self] (observer) -> Disposable in
            let allURL = self?.apiBaseURL(path: url)
            Alamofire.request(allURL!, method: .get,parameters: parameter,encoding: URLEncoding.default,headers: self?.headers)
                   .responseJSON { (respose) in
                       switch respose.result {
                           case .success(let vaue):
                               let responseDiction = JSON(vaue).dictionaryObject
                               observer.onNext(responseDiction!)
                               observer.onCompleted()
                               #if DEBUG
                               print("Get:链接-->\(allURL ?? "")\n参数-->\(String(describing: parameter))\n返回值-->\(vaue)\n\r");
                               #endif
                           case .failure(let error):
                               #if DEBUG
                               print("Get:链接-->\(allURL ?? "")\n参数-->\(String(describing: parameter))\n返回值-->\(error)\n\r");
                               #endif
                               observer.onError(error)
                       }
                }
               return Disposables.create()
           }
       }
       
       
       // MARK: Post Method
       public func post(url: String, parameter: [String: Any]?) -> Observable<Dictionary<String, Any>> {
           return Observable<Dictionary<String, Any>>.create {[weak self] (observer) -> Disposable in
            let allURL = self?.apiBaseURL(path: url)
            Alamofire.request(allURL!, method: .post,parameters: parameter,encoding: URLEncoding.default,headers: self?.headers)
                       .responseJSON { (respose) in
                           switch respose.result {
                               case .success(let value):
                                   let responseDiction = JSON(value).dictionaryObject
                                   observer.onNext(responseDiction!)
                                   observer.onCompleted()
                                   #if DEBUG
                                   print("Post:链接-->\(allURL ?? "")\n参数-->\(String(describing: parameter))\n返回值-->\(value)\n\r");
                                   #endif
                               case .failure(let error):
                                   #if DEBUG
                                   print("Post:链接-->\(allURL ?? "")\n参数-->\(String(describing: parameter))\n返回值-->\(error)\n\r");
                                   #endif
                                   observer.onError(error)
                           }
                   }
               return Disposables.create()
           }
       }
}

extension ApiManager {
   class func requestData(type: String?, path:String?,params:[String: Any]?) -> Observable<Dictionary<String, Any>> {
        if type?.lowercased() == "get" {
            return ApiManager.shared.get(url: path ?? "", parameter: params)
        }else{
            return ApiManager.shared.post(url: path ?? "", parameter: params)
        }
    }
}
