//
//  SecondViewController.swift
//  Trivia
//
//  Created by Rudresh Uppin on 14/09/20.
//  Copyright © 2020 Rudresh Uppin. All rights reserved.
//

import UIKit
import CoreData




@available(iOS 13.0, *)
class SecondViewController: UIViewController {
    
    @IBOutlet weak var tabelView: UITableView!
    
    
    var CriTitles = [("Sachin Tendulka"),("Virat Kolli"),("Adam Gilchirst"),("Jacques Kallis")]
    
    
    var SaveCricketer: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelView.delegate = self
        tabelView.dataSource = self
        
    }
    
    
    @IBAction func NextShowButton(_ sender: Any) {
        
        if self.SaveCricketer != nil {
            
            UserDefaults.standard.set(SaveCricketer, forKey: "SaveCricketer")
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewcontroller = storyboard.instantiateViewController(withIdentifier: "FlagViewController")
            self.navigationController?.pushViewController(viewcontroller, animated: true)
            
        } else {
            
            self.showAlert(message: "CricketerName", title: "Please select your cricketername!")
        }
        
    }
    
    
    @IBOutlet var NextShowButton: UIButton!
    
    
}


// Creating TableView with Extensions

@available(iOS 13.0, *)
extension SecondViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CriTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! TableViewCell
        
        cell.titleLabel01.text = self.CriTitles[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        self.SaveCricketer = CriTitles[indexPath.row]
        
        print("SaveCricketer",SaveCricketer as Any)
        
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    //Choose your custom row heigh
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    
    
}


