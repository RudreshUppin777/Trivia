//
//  FirstViewController.swift
//  Trivia
//
//  Created by Rudresh Uppin on 14/09/20.
//  Copyright © 2020 Rudresh Uppin. All rights reserved.
//

import UIKit
import CoreData

@available(iOS 13.0, *)
class FirstViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Username.delegate = self
        self.navigationItem.title = "TRIVIA"
       // self.DeleteData()
        
     }
    
            // Delete all  the coredata object values
            func DeleteData() -> () {
               let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
                let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "Person"))
                do {
                    try context.execute(DelAllReqVar)
                }
                catch {
                    print(error)
                }
    
            }

 
    
    @IBOutlet var Username: UITextField!
    
    @IBAction func NextButton(_ sender: Any) {
        
        if Username.text!.isEmpty {
            
            self.showAlert(message: "UserName", title: "Please enter your name!")
            
        } else {
                        
            UserDefaults.standard.set(Username.text, forKey: "Username")
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewcontroller = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
            
            self.navigationController?.pushViewController(viewcontroller, animated: true)
            
        }
        
    }
    

   
    
    @IBOutlet var NextButton: UIButton!
    
    
}

