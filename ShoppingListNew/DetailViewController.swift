//
//  DetailViewController.swift
//  ShoppingListNew
//
//  Created by MAC on 10.10.2022.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var detailList = [String]()
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "List"
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    

}
