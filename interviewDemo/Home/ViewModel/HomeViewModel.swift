//
//  HomeViewModel.swift
//  interviewDemo
//
//  Created by wang fei on 2020/9/24.
//  Copyright © 2020 mackellen. All rights reserved.
//

import UIKit
import RxSwift
import NSObject_Rx
import ObjectMapper
import SwiftyJSON

typealias RefrenshTable = (_ cout:Int) ->();

class HomeViewModel: NSObject {
    
    var dataArray = Array<HomeViewCell>()
    var refrenshBlock: RefrenshTable?
    var isFirstLoad: Bool = false
    
    var timer:Timer?
    
    func requestApi() {
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { [weak self] (timer) in
            let time = Utils.dateformatter().string(from: Date())
            print("after time = \(time)")  //当前系统时间
            self?.requestData()
        })
        RunLoop.current.add(timer!, forMode: .common)
    }
        
    func requestData() {
        dataArray.removeAll()
        
        let cache = CacheManager.share
        let filePath = cache.createPath(fileName: "historyList")
        
        let historyArray: Array<HistoryModel> = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? Array<HistoryModel> ?? []
        
        if historyArray.count > 0 && !isFirstLoad  {
            let lastModel:HistoryModel =  historyArray.last!
            print(lastModel)
            print(lastModel.data?.authorizationsUrl ?? "")
            let data: Dictionary<String, Any> = lastModel.data?.getDictionary() ?? [:]
            print(data)
            for (k, v) in  data {
                let cell = HomeViewCell()
                if let val = v as? String {
                    cell.setDataSoure(key: k,value: val )
                }else{
                    cell.setDataSoure(key: k,value: "" )
                }
                self.dataArray.append(cell)
            }
            isFirstLoad = true
            self.refrenshBlock?(data.keys.count)
            return
        }
        
        networkData(oldData: historyArray)
    }
    
    func networkData(oldData:Array<HistoryModel>) {
            
        let observable =   ApiManager.requestData(type: "get", path: "", params: nil)
        observable.subscribe {[weak self] (res) in
            switch res {
            case let .error(error): print(error)
            case .next, .completed:
                let data: Dictionary<String, Any> = res.element ?? [:]
                if data.keys.count > 0 {
                    for (k, v) in  data {
                         let cell = HomeViewCell()
                          cell.setDataSoure(key: k,value: v as! String )
                         self?.dataArray.append(cell)
                      }
                    
                     let homeModel = HomeModel(map: data)
                     let time = Utils.dateformatter().string(from: Date())
                     var newData =  oldData
                      var diction:Dictionary<String,Any> = Dictionary<String,Any>()
                      diction["data"] = homeModel
                      diction["date"] = time
                      
                      let historyModel = HistoryModel(map: diction)
                      newData.append(historyModel!)
                      
                     let cache = CacheManager.share
                     let filePath = cache.createPath(fileName: "historyList")
                      NSKeyedArchiver.archiveRootObject(newData, toFile: filePath)
                     self?.refrenshBlock?(data.keys.count)
                }
            }
         }.disposed(by: rx.disposeBag)
        isFirstLoad = true
    }
    
}
