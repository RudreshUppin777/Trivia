//
//  ShowGamesViewController.swift
//  Trivia
//
//  Created by Rudresh Uppin on 15/09/20.
//  Copyright © 2020 Rudresh Uppin. All rights reserved.
//

import UIKit
import CoreData

@available(iOS 13.0, *)
class ShowGamesViewController: UIViewController {
    
    @IBOutlet weak var tabelView: UITableView!
    
    var gameUsersData = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelView.delegate = self
        tabelView.dataSource = self
        
        
        self.tabelView.rowHeight = UITableView.automaticDimension;
        self.tabelView.estimatedRowHeight = 44.0; // set to whatever your "average" cell height is
        
        self.fetchDataTable()
    }
    
    
    // Fetch the coredata object values
    func fetchDataTable(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            gameUsersData = try context.fetch(Person.fetchRequest())
            print("commits",gameUsersData.count)
            
        } catch {
            print("Storing data Failed")
        }
    }
    
}


// Creating TableView with Extensions
@available(iOS 13.0, *)
extension ShowGamesViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameUsersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellThird", for: indexPath as IndexPath) as! GamesTableviewCellTableViewCell
        
        let commit = gameUsersData[indexPath.row]
        cell.username?.text = commit.name
        
        cell.flags?.text = commit.flags
        cell.cricketer?.text = commit.cricketer
        cell.time?.text = commit.time

        return cell
    }
    
    //Choose your custom row heigh
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
    
}




