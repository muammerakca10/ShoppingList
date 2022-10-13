//
//  ViewController.swift
//  ShoppingListNew
//
//  Created by MAC on 10.10.2022.
//

import UIKit



class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var selectedCategoryNameVC = ""
    
    var categories = ["Dairy","Fruits","Spices","Paper/Wrap","Joiletries","Vegetables","Frozen Food","Canned Goods","Pet Items","Household","Cereal","Pasta Rice","Breads","Bevereages","Baking","Deli","Meat/Fish","Condiments","Sauces/Oils","Snacks","Others"]
    
    var tableView : UITableView = {
        var table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIApplication.isFirstLaunch(){
            //let userDefaults = UserDefaults.standard
            print("First time")
        } else {
            print("not first time")
        }
        
        title = "Shopping Categories"
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addCategory))
        
        
        //print(categories)
    }
    
    @objc func addCategory(){
        let ac = UIAlertController(title: "Add Category", message: "Please enter category name you want to add.", preferredStyle: .alert)
        
        ac.addTextField()
        ac.textFields![0].placeholder = "Write category name in here"
        
        ac.addAction(UIAlertAction(title: "OK", style: .default) { [weak self, weak ac] _ in
            guard let newName = ac?.textFields![0].text else { return }
            if !newName.isEmpty {
                self?.categories.append(newName)
                //self?.tableView.reloadData()
            }
            self?.tableView.reloadData()
        })
        
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(ac, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var configuration = cell.defaultContentConfiguration()
        let category = categories[indexPath.row]
        configuration.text = category
        
        cell.contentConfiguration = configuration
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCategoryNameVC = categories[indexPath.row]
        
        performSegue(withIdentifier: "toDetailVC", sender: nil)
        print(selectedCategoryNameVC)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destination = segue.destination as! DetailViewController
            destination.categoryName = selectedCategoryNameVC
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let ac = UIAlertController(title: "Are you sure?", message: "When you delete the category, the items inside the category are also deleted.", preferredStyle: .actionSheet)
            
            ac.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (asd) in
                self.categories.remove(at: indexPath.row)
                tableView.reloadData()
            }))
            ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            present(ac, animated: true)
        }
    }
}

