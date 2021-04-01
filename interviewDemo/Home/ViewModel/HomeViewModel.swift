//
//  HomeViewModel.swift
//  interviewDemo
//
//  Created by Mackellen on 2020/9/24.
//  Copyright © 2020 mackellen. All rights reserved.
//

import UIKit
import RxSwift
import NSObject_Rx
import SwiftyJSON
import RealmSwift
import RxCocoa
import RxRealm

typealias RefrenshTable = (_ count: Int) -> ();

class HomeViewModel: NSObject {
    
    var dataArray = Array<HomeViewCell>()
    var refrenshBlock: RefrenshTable?
    var isFirstLoad: Bool = false
    var timer:Timer?
    var realm: Realm!
    
    func requestApi() {
        if !isFirstLoad {
            self.requestData()
        }
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { [weak self] (timer) in
            guard let self = self else { return }
            let time = Utils.dateformatter().string(from: Date())
            print("after time = \(time)")  //当前系统时间
            self.requestData()
        })
        RunLoop.current.add(timer!, forMode: .common)
    }
        
    func requestData() {
        dataArray.removeAll()
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        let docURL = URL(string: documentsDirectory)!
        let dataPath = docURL.appendingPathComponent("historyData")
        if FileManager.default.fileExists(atPath: dataPath.absoluteString) == false {
            do {
                try FileManager.default.createDirectory(atPath: dataPath.absoluteString, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription)
            }
        }
        do {
            var config = Realm.Configuration()
            config.fileURL = dataPath.appendingPathComponent("historyList.realm")
            realm = try Realm(configuration: config)
        } catch {
            try! FileManager.default.removeItem(atPath: dataPath.appendingPathComponent("historyList.realm").absoluteString)
            realm = try! Realm()
            print(error.localizedDescription)
        }
        let historyTask = realm.objects(HistoryModel.self).sorted(byKeyPath: "date", ascending: false)
        if historyTask.count > 0 && !isFirstLoad  {
            let lastModel:HistoryModel =  (historyTask.first)!
            let data: [String: String?] = lastModel.data?.toDictionary() ?? [:]
            print(data)
            for element in data {
                let cell = HomeViewCell()
                cell.setDataSoure(key: element.key, value: "\(element.value ?? "")")
                self.dataArray.append(cell)
            }
            isFirstLoad = true
            self.refrenshBlock?(historyTask.count)
            return
        }
        reloadData()
    }

    func reloadData() {
        ApiManager.requestData(type: "get", path: "", params: nil).retry(1)
            .asObservable().subscribe {[weak self] (res) in
                guard let self = self else { return }
                if  case let .next(element) = res, !element.isEmpty {
                    let data: [String: Any] = res.element ?? [:]
                    if data.keys.count > 0 {
                        for element in data {
                            let cell = HomeViewCell()
                            cell.setDataSoure(key: element.key, value: "\(element.value)")
                            self.dataArray.append(cell)
                        }
                        let historyTemp = self.realm.objects(HistoryModel.self).sorted(byKeyPath: "date", ascending: false)
                        let homeModel = HomeModel(value: data)
                        let time = Utils.dateformatter().string(from: Date())

                        let newHistory = HistoryModel()
                        newHistory.data = homeModel
                        newHistory.date = time
                        if historyTemp.count > 0 {
                            newHistory.id = historyTemp.count+1
                        } else {
                            newHistory.id = 1
                        }
                        try! self.realm.write {
                            self.realm.add(newHistory)
                        }
                        self.refrenshBlock?(historyTemp.count+1)
                    }
                    self.isFirstLoad = true
                }
         }.disposed(by: rx.disposeBag)
    }

}
