//
//  Utils.swift
//  interviewDemo
//
//  Created by wang fei on 2020/9/26.
//  Copyright © 2020 mackellen. All rights reserved.
//

import UIKit

class Utils: NSObject {

    class func dateformatter() -> DateFormatter {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        return dateformatter
    }
    
}
