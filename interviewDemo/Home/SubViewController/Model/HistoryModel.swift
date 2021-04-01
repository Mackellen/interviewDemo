//
//  HistoryModel.swift
//  interviewDemo
//
//  Created by Mackellen on 2020/9/26.
//  Copyright © 2020 mackellen. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class HistoryModel: Object {
    @objc dynamic var id = 0
    @objc dynamic var date: String?
    @objc dynamic var data: HomeModel?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
