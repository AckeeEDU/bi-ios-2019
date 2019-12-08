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
    var authors: [NSManagedObject] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
      
        title = "The List of Authors"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
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
         
           let entity = NSEntityDescription.entity(forEntityName: "Author", in: managedContext)!
         
           let author = NSManagedObject(entity: entity, insertInto: managedContext)
         
           author.setValue(name, forKeyPath: "name")
           
           do {
               try managedContext.save()
               authors.append(author)
           } catch let error as NSError {
               print("Could not save. \(error), \(error.userInfo)")
           }
       }
}

// MARK: - UITableViewDataSource
extension AuthorsViewController: UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return authors.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = authors[indexPath.row].value(forKey: "name") as? String
        return cell
    }
}
