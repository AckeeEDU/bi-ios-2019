//
//  AuthorsViewController.swift
//  ExampleApp
//
//  Created by Lukáš Tesař on 08/12/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import UIKit
import CoreData

class AuthorsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    var authors: [Author] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
      
        title = "The List of Authors"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        reloadData()
    }
    
    // MARK: - Actions
    @IBAction func addAuthor(_ sender: UIBarButtonItem) {
      
        let alert = UIAlertController(title: "New Author", message: "Add a new author", preferredStyle: .alert)
      
        let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
            guard let textField = alert.textFields?.first, let name = textField.text else {
                return
            }
        
            self.save(name: name)
            self.tableView.reloadData()
        }
      
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
      
        alert.addTextField()
      
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
      
        present(alert, animated: true)
    }
    
    // MARK: - Coredata
    func save(name: String) {
         
        let managedContext = AppDelegate.viewContext
         
        let author = Author(context: managedContext)
        author.name = name
           
        do {
            try managedContext.save()
            authors.append(author)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func reloadData() {
        
        let managedContext = AppDelegate.viewContext
        
        let fetchRequest: NSFetchRequest<Author> = Author.fetchRequest()
        
        do {
            authors = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension AuthorsViewController: UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return authors.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = authors[indexPath.row].name
        return cell
    }
}
