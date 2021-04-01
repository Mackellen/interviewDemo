//
//  HomeViewCell.swift
//  interviewDemo
//
//  Created by Mackellen on 2020/9/24.
//  Copyright © 2020 mackellen. All rights reserved.
//

import UIKit
import SnapKit
import Then

fileprivate struct Metric {
    static let margin : CGFloat = 14
    static let height : CGFloat = 45
    static let column: CGFloat = 5
}


class HomeViewCell: UITableViewCell {

    let titleLabel: UILabel = UILabel().then {
        $0.textColor = UIColor(hex: "333333")
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    let detailLabel: UILabel = UILabel().then {
        $0.textColor = UIColor(hex: "666666")
        $0.font = UIFont.systemFont(ofSize: 12);
        $0.numberOfLines = 2
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = UIColor.white
        
        setupSubViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLabel)

        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(Metric.margin)
            make.centerY.equalToSuperview()
        }
        detailLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.right).offset(Metric.column)
            make.right.equalToSuperview().offset(Metric.margin)
            make.centerY.equalToSuperview()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    func  setDataSoure(key: String,  value: String) {
        titleLabel.text = "\(key):"
        detailLabel.text = value
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
