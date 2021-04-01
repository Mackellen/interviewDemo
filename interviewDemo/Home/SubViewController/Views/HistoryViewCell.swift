//
//  HistoryViewCell.swift
//  interviewDemo
//
//  Created by Mackellen on 2020/9/25.
//  Copyright © 2020 mackellen. All rights reserved.
//

import UIKit
import SnapKit

fileprivate struct Metric {
    static let margin : CGFloat = 14
}

class HistoryViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    let titleLabel: UILabel = UILabel().then {
        $0.textColor = UIColor(hex: "333333")
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(Metric.margin)
            make.centerY.equalToSuperview()
        }
    }
    
    func setDataSource(_ model: HistoryModel, _ index: Int){
        if index == 0 {
            titleLabel.textColor = UIColor.red
        }
        titleLabel.text = "请求时间：" + model.date!
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
