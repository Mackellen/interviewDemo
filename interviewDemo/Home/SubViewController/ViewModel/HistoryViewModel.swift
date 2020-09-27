//
//  HistoryViewModel.swift
//  interviewDemo
//
//  Created by wang fei on 2020/9/26.
//  Copyright © 2020 mackellen. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper

class HistoryViewModel: NSObject {

    var dataArray = Array<HistoryViewCell> ()
    var refrenshBlock: RefrenshTable?
    
    func getData() {
        dataArray.removeAll()
        let cache = CacheManager.share
        let filePath = cache.createPath(fileName: "historyList")
        
        let oldData: Array<HistoryModel> = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? Array<HistoryModel> ?? []
        let newData = oldData.sorted { (model1, model2) -> Bool in
            if let date1 = model1.date, let date2 = model2.date {
                let beginDate:Date = Utils.dateformatter().date(from: date1)!
                let afterDate:Date = Utils.dateformatter().date(from: date2)!
                return beginDate.compare(afterDate) == .orderedDescending
            }
            return false
        }
        if newData.count > 0 {
            for historyModel in newData {
                let cell = HistoryViewCell()
                cell.setDataSource(historyModel)
                dataArray.append(cell)
            }
            self.refrenshBlock?(dataArray.count)
        }
    }
    
}
