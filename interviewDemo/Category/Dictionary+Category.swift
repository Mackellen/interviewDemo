//
//  Dictionary+Category.swift
//  interviewDemo
//
//  Created by Mackellen on 2020/9/26.
//  Copyright © 2020 mackellen. All rights reserved.
//

import UIKit

extension Dictionary {

    func toJSONString() -> String? {
       guard let data = try? JSONSerialization.data(withJSONObject: self,
                                                    options: []) else {
           return nil
       }
       guard let str = String(data: data, encoding: .utf8) else {
           return nil
       }
       return str
    }
    
}
