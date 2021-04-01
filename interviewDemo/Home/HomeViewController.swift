//
//  HomeViewController.swift
//  interviewDemo
//
//  Created by Mackellen on 2020/9/24.
//  Copyright © 2020 mackellen. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift

class HomeViewController: UIViewController {
    
    private var viewModel = HomeViewModel()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.backgroundColor = UIColor(hex: "F9F9F9")
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 45
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let time = Utils.dateformatter().string(from: Date())
        print("time = \(time)")  //当前系统时间
        
        configureSubviews()
        viewModel.requestApi()
        viewModel.refrenshBlock = {[weak self] (count) -> () in
            self?.tableView.reloadData()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: kListenForMessages), object: nil)
        }
        // Do any additional setup after loading the view.
    }


    private func configureSubviews() {
        self.title = "测试项目"
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        let item = UIBarButtonItem(image: UIImage(named: "history-list"), style: .done, target: nil, action: nil)
        item.rx.tap.do(onNext:{ [weak self] () in
            self?.goHistoryAction()
        }).subscribe().disposed(by: rx.disposeBag)

        self.navigationItem.rightBarButtonItem = item
    }
        
    func goHistoryAction(){
        let historyView = HistoryViewController()
        self.navigationController?.pushViewController(historyView, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.dataArray[indexPath.row]
    }
}

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = self.tableView(tableView, cellForRowAt: indexPath)
        return cell.height
    }

}

