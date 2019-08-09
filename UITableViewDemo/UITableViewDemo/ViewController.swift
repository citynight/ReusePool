//
//  ViewController.swift
//  UITableViewDemo
//
//  Created by 李小争 on 2019/8/9.
//  Copyright © 2019 红火台. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var tableView: IndexedTableView = {
       let table = IndexedTableView(frame: CGRect(x: 0, y: 60, width: self.view.frame.width, height: self.view.frame.height - 60), style: .plain)
        table.delegate = self
        table.dataSource = self
        table.indexedDataSource = self
        return table
    }()
    
    private lazy var button:UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: 40))
        btn.backgroundColor = UIColor.red
        btn.setTitle("reloadTable", for: .normal)
        btn.addTarget(self, action: #selector(reloadTable), for: .touchUpInside)
        return btn
    }()
    
    private var dataSource:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(tableView)
        self.view.addSubview(button)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        for i in 0..<100 {
            dataSource.append("\(i)")
        }
    }


}

@objc
extension ViewController{
    private func reloadTable() {
        print("reloadTable")
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource, IndexedTableViewDataSouce {
    static var change = true
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func indexTitlesForIndexTableView(_ tableView: IndexedTableView) -> [String] {
        
        if ViewController.change {
            ViewController.change = false
            return ["A","B","C","D","E","F"]
        }else {
            ViewController.change = true
            return ["A","B","C","D","E","F","G","H","I","G","K"]
        }
    }
    
    
}
