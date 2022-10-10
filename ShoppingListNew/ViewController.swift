//
//  ViewController.swift
//  ShoppingListNew
//
//  Created by MAC on 10.10.2022.
//

import UIKit



class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var categories = ["Dairy","Fruits","Spices","Paper/Wrap","Joiletries","Vegetables","Frozen Food","Canned Goods","Pet Items","Household","Cereal","Pasta Rice","Breads","Bevereages","Baking","Deli","Meat/Fish","Condiments","Sauces/Oils","Snacks","Others"]
    
    var tableView : UITableView = {
        var table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Shopping Categories"
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addCategorie))
    }
    
    @objc func addCategorie(){
        let ac = UIAlertController(title: "Add Categorie", message: "Please enter category name you want to add.", preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Add", style: .default,handler: { (categoryName) in
            
        }))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var configuration = cell.defaultContentConfiguration()
        configuration.text = categories[indexPath.row]
        cell.contentConfiguration = configuration
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let ac = UIAlertController(title: "Are you sure?", message: "When you delete the category, the items inside the category are also deleted.", preferredStyle: .actionSheet)
            ac.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (asd) in
                self.categories.remove(at: indexPath.row)
                tableView.reloadData()
            }))
            present(ac, animated: true)
        }
    }
    
    
}
