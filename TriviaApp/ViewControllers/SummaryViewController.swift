//
//  SummaryViewController.swift
//  Trivia
//
//  Created by Rudresh Uppin on 15/09/20.
//  Copyright © 2020 Rudresh Uppin. All rights reserved.
//

import UIKit
import CoreData

@available(iOS 13.0, *)
class SummaryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // User defaults to save the data
        if let savedValue = UserDefaults.standard.string(forKey: "SaveCricketer") {
            self.CrickLabel.text = savedValue
            print("savedValue",savedValue)

        }

        if let savedValue = UserDefaults.standard.string(forKey: "Username") {
            self.NameLabel.text = savedValue
            print("savedValue",savedValue)

        }
        
        if let savedValue = UserDefaults.standard.string(forKey: "SaveFlags") {
            self.FlagsLabel.text = savedValue
            print("savedValue",savedValue)

        }
        
        
    }
    
    
    @IBOutlet var HistoryButton: UIButton!
    
    @IBAction func HistoryButton(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: "ShowGamesViewController")
        self.navigationController?.pushViewController(viewcontroller, animated: true)
        

    }
    
    
    @IBOutlet var MainView: UIButton!
    
    @IBAction func MainView(_ sender: Any) {
        
        self.performSegue(withIdentifier: "Show", sender: self)
    
    }
    
    
    
    
    
    @IBOutlet var NameLabel: UILabel!
    
    
    @IBOutlet var CrickLabel: UILabel!
    
    @IBOutlet var FlagsLabel: UILabel!
    
}
