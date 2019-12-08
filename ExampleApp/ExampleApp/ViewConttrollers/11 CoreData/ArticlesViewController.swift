//
//  ArticlesViewController.swift
//  ExampleApp
//
//  Created by Lukáš Tesař on 08/12/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import UIKit
import CoreData

class ArticlesViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    var articles: [Article] = []
    var author: Author?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
      
        title = "The List of Articles"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        reloadData()
    }
    
    // MARK: - Actions
    @IBAction func addArticle(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "New Article", message: "Add a new article", preferredStyle: .alert)
      
        let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
            guard let textField = alert.textFields?.first, let text = textField.text else {
                return
            }
        
            self.save(text: text)
            self.tableView.reloadData()
        }
      
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
      
        alert.addTextField()
      
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
      
        present(alert, animated: true)
    }
    
    // MARK: - Coredata
    func save(text: String) {
        
        guard let author = author else {
            return
        }
         
        let managedContext = AppDelegate.viewContext
         
        let article = Article(context: managedContext)
        article.text = text
        article.created = Date()
        article.author = author
           
        do {
            try managedContext.save()
            articles.append(article)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func reloadData() {
        
        guard let author = author else {
            return
        }
        
        let managedContext = AppDelegate.viewContext
               
        let fetchRequest: NSFetchRequest<Article> = Article.fetchRequest()
        
        let yesterday = Date(timeIntervalSinceNow: -24*60*60)
        let predicate1 = NSPredicate(format: "created > %@", argumentArray: [yesterday])
        let predicate2 = NSPredicate(format: "author == %@", author)
        let predicates = [predicate1, predicate2]
        let andPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
        fetchRequest.predicate = andPredicate
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "created", ascending: false)]
        
        do {
            articles = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
//        articles = author.articles?.allObjects as! [Article]
        
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ArticlesViewController: UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = articles[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let managedContext = AppDelegate.viewContext
        
        let article = articles[indexPath.row]

        if editingStyle == .delete {
            managedContext.delete(article)

            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Error While Deleting Note: \(error.userInfo)")
            }
        }
        
        self.reloadData()
    }
}
