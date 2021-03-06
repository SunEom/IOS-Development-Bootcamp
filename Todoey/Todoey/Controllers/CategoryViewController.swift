//
//  CategoryViewController.swift
//  Todoey
//
//  Created by 엄태양 on 2022/07/05.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit
//import CoreData
import RealmSwift
import ChameleonFramework


class CategoryViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    
    var categoryArray: Results<Category>?
    
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategory()
        
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        guard let navBar = navigationController?.navigationBar else { fatalError("navigation controller does not exist.") }
        let bgColor = UIColor(named: "mainColor")!
        let contrastOfBackgroundColor = ContrastColorOf(bgColor, returnFlat: true)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = bgColor
        appearance.titleTextAttributes = [.foregroundColor: contrastOfBackgroundColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: contrastOfBackgroundColor]
        
        navBar.tintColor = contrastOfBackgroundColor
        navBar.standardAppearance = appearance
        navBar.compactAppearance = appearance
        navBar.scrollEdgeAppearance = appearance
    }
    
    //MARK: - TableView Datasource Method
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        cell.textLabel?.text = categoryArray?[indexPath.row].name ?? "No Category Added Yet"
        
        guard let categoryColor = categoryArray?[indexPath.row].bgColor else { fatalError()}
        
        cell.textLabel?.textColor = ContrastColorOf(UIColor(hexString: categoryColor)!, returnFlat: true)
        
        cell.backgroundColor = UIColor(hexString: categoryArray?[indexPath.row].bgColor ?? "#000000")

        return cell
    }
    
    //MARK: - Data Manipulate Method
    
    func save(category: Category) {
        do {
            try realm.write{
                realm.add(category)
            }
        } catch {
            print("Error saving data to Core Data. \(error.localizedDescription)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadCategory() {
        categoryArray = realm.objects(Category.self)
        
        tableView.reloadData()
    }
    
    //MARK: - Delete Data from Swipe
    
    override func updateModel(at indexPath: IndexPath) {
        if let categoryForDeletion = self.categoryArray?[indexPath.row] {
            do {
                try self.realm.write {
                    self.realm.delete(categoryForDeletion)
                }
            } catch {
                print("Error removing category. \(error.localizedDescription)")
            }
        }
    }
    
//    //Using Core Data
//    func loadCategory(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
//        do {
//            categoryArray = try context.fetch(request)
//        } catch {
//            print("Error fetch data from Core Data. \(error.localizedDescription)")
//        }
//
//        self.tableView.reloadData()
//    }

    //MARK: - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { action in
            if let name = textField.text {
                
                let newCategory = Category()
                newCategory.name = name
                newCategory.bgColor = UIColor.randomFlat().hexValue()
                
                self.save(category: newCategory)
                
            }
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Category name"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    

    
    //MARK: - TableView Delegate Mehthod
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray?[indexPath.row]
        }
    }
    
}

