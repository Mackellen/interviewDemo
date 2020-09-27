//
//  TableViewCell+Category.swift
//  interviewDemo
//
//  Created by wang fei on 2020/9/25.
//  Copyright © 2020 mackellen. All rights reserved.
//

import UIKit

extension UITableViewCell {

    var height: CGFloat {
        set {
            var frame: CGRect = self.frame
            frame.size.height = newValue
            self.frame        = frame
        }
        get {
            return self.frame.size.height
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }

}
