//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
//import CoreData
import RealmSwift
import ChameleonFramework

class TodoListViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    var todoItems: Results<Item>?
    //    var itemArray = [Item]()
    @IBOutlet weak var searchBar: UISearchBar!
    
    var selectedCategory: Category? {
        didSet {
            loadItems()
        }
    }
    
    //    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        
        //        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Item.plist"))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Update nav bar UI
        if let colorHex = selectedCategory?.bgColor {
            
            title = selectedCategory!.name
            
            guard let navBar = navigationController?.navigationBar else { fatalError("navigation controller does not exist.") }
            let bgColor = UIColor(hexString: colorHex)!
            let contrastOfBackgroundColor = ContrastColorOf(UIColor(hexString: colorHex)!, returnFlat: true)
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = bgColor
            appearance.titleTextAttributes = [.foregroundColor: contrastOfBackgroundColor]
            appearance.largeTitleTextAttributes = [.foregroundColor: contrastOfBackgroundColor]
            
            navBar.tintColor = contrastOfBackgroundColor
            navBar.standardAppearance = appearance
            navBar.compactAppearance = appearance
            navBar.scrollEdgeAppearance = appearance
            
            
            //Search Bar
            searchBar.barTintColor = bgColor
            searchBar.searchTextField.backgroundColor = .white
            
        }
    }
    
    //MARK: - TableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let item = self.todoItems?[indexPath.row] {
            
            //currently on row #5
            //there is a total of 10 items in todoItems
            
            if let color = UIColor(hexString: selectedCategory!.bgColor)?.darken(byPercentage: CGFloat(CGFloat(indexPath.row) / CGFloat(todoItems!.count+10))) {
                cell.backgroundColor = color
                cell.textLabel?.textColor = ContrastColorOf(color, returnFlat: true)
            }
            
            
            
            cell.textLabel?.text = item.title
            
            cell.accessoryType = item.isDone ? .checkmark : .none
        } else {
            cell.textLabel?.text = "No Item Added Yet"
        }
        
        return cell
    }
    
    //MARK: - TableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let item = todoItems?[indexPath.row] {
            do {
                try realm.write {
                    //                    realm.delete(item)
                    item.isDone = !item.isDone
                }
            } catch {
                print("Error saving done status. \(error.localizedDescription)")
            }
            
        }
        
        //                  Using Core data
        //        context.delete(itemArray[indexPath.row])
        //        itemArray.remove(at: indexPath.row)
        
        //        itemArray[indexPath.row].isDone = !itemArray[indexPath.row].isDone
        //
        //        saveItems()
        
        
        // cellForRowAt recall!
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message : "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            // what will happen once the user clicks the Add Item button on our UIAlert
            
            
            if let currentCategory = self.selectedCategory, let item = textField.text {
                do {
                    try self.realm.write {
                        let newItem = Item()
                        newItem.title = item
                        newItem.dateCreated = Date()
                        currentCategory.items.append(newItem)
                    }
                } catch {
                    print("Error saving new items, \(error.localizedDescription)")
                }
            }
            
            self.tableView.reloadData()
            
            
            
            //              Using Core Data
            //            if let item = textField.text {
            //
            //                let newItem = Item(context: self.context)
            //                newItem.title = item
            //                newItem.isDone = false
            //                newItem.parentCategory = self.selectedCategory
            //                self.itemArray.append(newItem)
            //
            //                self.saveItems()
            //
            //                self.tableView.reloadData()
            //            }
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //      Using Core Data
    //    func saveItems(item: Item) {
    //
    //        do {
    //                        try context.save()
    //        } catch {
    //            print("Error saving context \(error.localizedDescription)")
    //        }
    //
    //    }
    
    
    func loadItems() {
        todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        
        tableView.reloadData()
    }
    
    //    //Using Core data
    //    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil) {
    //
    //        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
    //
    //        if let addtionalPredicate = predicate {
    //            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, addtionalPredicate])
    //        } else {
    //            request.predicate = categoryPredicate
    //        }
    //
    //        do {
    //            itemArray = try context.fetch(request)
    //        } catch {
    //            print("Error fetching data from context \(error.localizedDescription)")
    //        }
    //
    //        tableView.reloadData()
    //    }
    
    
    //MARK: - Delete Data from Swipe
    override func updateModel(at indexPath: IndexPath) {
        if let itemForDeletion = todoItems?[indexPath.row] {
            do {
                try realm.write {
                    realm.delete(itemForDeletion)
                }
            } catch {
                print("Error removing item. \(error.localizedDescription)")
            }
        }
    }
    
}

//MARK: - Search bar dekegate methods


extension TodoListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        todoItems = todoItems?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true)
        
        tableView.reloadData()
        
        //        Using Core data
        //        let request: NSFetchRequest<Item> = Item.fetchRequest()
        //
        //        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
        //
        //        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        //
        //        loadItems(with: request, predicate: predicate)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItems()
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}

