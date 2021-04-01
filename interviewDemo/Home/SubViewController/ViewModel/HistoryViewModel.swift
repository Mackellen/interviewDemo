//
//  HistoryViewModel.swift
//  interviewDemo
//
//  Created by Mackellen on 2020/9/26.
//  Copyright © 2020 mackellen. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift

class HistoryViewModel: NSObject {

    var dataArray = [HistoryViewCell] ()
    var refrenshBlock: RefrenshTable?
    
    func getData() {
        dataArray.removeAll()
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        let docURL = URL(string: documentsDirectory)!
        let dataPath = docURL.appendingPathComponent("historyData")
        if FileManager.default.fileExists(atPath: dataPath.absoluteString) == false {
            self.refrenshBlock?(0)
            return
        }
        var realm: Realm!
        do {
            var config = Realm.Configuration()
            config.fileURL = dataPath.appendingPathComponent("historyList.realm")
            realm = try Realm(configuration: config)
        } catch {
            CacheManager.share.deleteData(path: dataPath.absoluteString)
            realm = try! Realm()
            print(error.localizedDescription)
        }
        let historyData = realm.objects(HistoryModel.self).sorted(byKeyPath: "date", ascending: false)
        if historyData.count > 0 {
            for (index, historyModel) in historyData.enumerated() {
                let cell = HistoryViewCell()
                cell.setDataSource(historyModel, index)
                dataArray.append(cell)
            }
            self.refrenshBlock?(dataArray.count)
        }
    }
    
}
