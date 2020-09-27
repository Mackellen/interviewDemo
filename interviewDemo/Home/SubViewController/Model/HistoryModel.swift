//
//  HistoryModel.swift
//  interviewDemo
//
//  Created by wang fei on 2020/9/26.
//  Copyright © 2020 mackellen. All rights reserved.
//

import UIKit


fileprivate struct Metric {
    static let date : String = "HistoryModel_date"
    static let data : String = "HistoryModel_data"
}

class HistoryModel: NSObject,NSCoding {

    var date: String?
    var data: HomeModel?
    
    required init?(coder: NSCoder) {
        date = coder.decodeObject(forKey: Metric.date) as? String
        data = coder.decodeObject(forKey: Metric.data) as? HomeModel
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(date, forKey: Metric.date)
        coder.encode(data, forKey: Metric.data)
    }
    
    required init?(map: Dictionary<String,Any>) {
        date = map["date"] as? String
        data = map["data"] as? HomeModel
    }
    
}
