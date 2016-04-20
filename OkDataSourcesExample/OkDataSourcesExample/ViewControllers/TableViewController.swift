//
//  TableViewController.swift
//  OkDataSourcesExample
//
//  Created by Roberto Frontado on 4/8/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, OkViewCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    var dataSource: OkTableViewDataSource<Item, TableViewCell>!
    var delegate: OkTableViewDelegate<OkTableViewDataSource<Item, TableViewCell>, TableViewController>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = OkTableViewDataSource()
        delegate = OkTableViewDelegate(dataSource: dataSource, presenter: self)
        delegate.setOnPullToRefresh(tableView) { (refreshControl) -> Void in
            print("refreshed")
            refreshControl.endRefreshing()
        }
        delegate.setOnPagination { (item) -> Void in
            self.addMockItems(self.dataSource.items.count)
        }
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        addMockItems()
    }
    
    private func addMockItems(count: Int = 0) {
        var items = [Item]()
        for i in count..<(count + 10) {
            items.append(Item(value: "Item \(i)"))
        }
        dataSource.items.appendContentsOf(items)
        tableView.reloadData()
    }
    
    // MARK: - OkViewCellDelegate
    func onItemClick(item: Item, position: Int) {
        showAlertMessage("\(item.value) clicked")
    }

}
