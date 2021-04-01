//
//  HistoryViewController.swift
//  interviewDemo
//
//  Created by Mackellen on 2020/9/25.
//  Copyright © 2020 mackellen. All rights reserved.
//

import UIKit
import Toast_Swift
import RxSwift
import RxCocoa
import MJRefresh


class HistoryViewController: UIViewController {

    private var tableView: UITableView!
    var refreshHeader: MJRefreshHeader!
    private  let viewModel = HistoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        viewModel.getData()
        viewModel.refrenshBlock = {[weak self] _ in
            self?.tableView.mj_header?.endRefreshing()
            self?.tableView.reloadData()
        }

        NotificationCenter.default.rx.notification(Notification.Name(rawValue: kListenForMessages)).subscribe(onNext: {[weak self] (notific) in
            guard let self = self else {return}
            self.receiveMsg(notific: notific)
        }).disposed(by: rx.disposeBag)
        // Do any additional setup after loading the view.
    }
    
    private func setupSubviews() {
        self.title = "历史记录"
        
        let item = UIBarButtonItem(image: UIImage(named: "back-icon"), style: .done, target: nil, action: nil)
        item.rx.tap.do(onNext:{ [weak self] () in
            self?.navigationController?.popViewController(animated: true)
        }).subscribe().disposed(by: rx.disposeBag)
        self.navigationItem.leftBarButtonItem = item
        
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.backgroundColor = UIColor(hex: "F9F9F9")
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 45
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: { [weak self] () in
            self?.viewModel.getData()
        });
        
    }
    
    func receiveMsg(notific:Notification){
        self.view.makeToast("有新的内容哦!",duration:2,position:.center)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return viewModel.dataArray.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           return viewModel.dataArray[indexPath.row]
       }
}


extension HistoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = self.tableView(tableView, cellForRowAt: indexPath)
        return cell.height
    }
    
}
