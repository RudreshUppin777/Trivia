//
//  FlagViewController.swift
//  Trivia
//
//  Created by Rudresh Uppin on 15/09/20.
//  Copyright © 2020 Rudresh Uppin. All rights reserved.
//

import UIKit
import CoreData


@available(iOS 13.0, *)
class FlagViewController: UIViewController{
    
    
    @IBOutlet weak var tabelView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tabelView.delegate = self
        tabelView.dataSource = self
        
    }
    
    var Flags = ["White", "Yellow", "Orange", "Green"]
    
    
    var SaveFlags: String?
    var SaveTime: String?
    var Flagsvalues : [String] = []
    
    @IBOutlet var NextView: UIButton!
        
    
    @IBAction func NextView(_ sender: Any) {
        
        if self.SaveFlags != nil {
            
            self.UpdateData()
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewcontroller = storyboard.instantiateViewController(withIdentifier: "SummaryViewController")
            self.navigationController?.pushViewController(viewcontroller, animated: true)
            
        } else {
            
            self.showAlert(message: "FlagsName", title: "Please select your flagsname!")
        }
        
        
    }
    
    
   // Update all  the coredata object values
    func UpdateData() -> () {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        if let savedValue = UserDefaults.standard.string(forKey: "Username") {
            newUser.setValue(savedValue, forKey: "name")
            print("Name",savedValue)
        }
        
        if let savedValuetwo = UserDefaults.standard.string(forKey: "SaveCricketer") {
            newUser.setValue(savedValuetwo, forKey: "cricketer")
            print("savedValuetwo",savedValuetwo)
        }
        
     
        self.GenerateDate()
        newUser.setValue(self.SaveFlags, forKey: "flags")
        newUser.setValue(self.SaveTime, forKey: "time")

        do {
            try context.save()
        } catch {
            print("Storing data Failed")
        }
        
    }
    
    func GenerateDate() {
         
         let date = Date()
         let df = DateFormatter()
         df.dateFormat = "yyyy-MM-dd HH:mm:ss"
         self.SaveTime = df.string(from: date)
         print("SaveTime",self.SaveTime)
     }
    
    
    
}



// Creating TableView with Extensions
@available(iOS 13.0, *)
extension FlagViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Flags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSecond", for: indexPath as IndexPath) as! FlagTableCell
        
        cell.FlaagLabel.text = self.Flags[indexPath.row]
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType ==  .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        } else {
            
            self.SaveFlags = Flags[indexPath.row]
            Flagsvalues.append(self.SaveFlags!)
            print("Flagsvalues",Flagsvalues as Any)
            
            self.SaveFlags = Flagsvalues.joined(separator: ", ")
            print("SaveFlags",SaveFlags as Any)
            
            UserDefaults.standard.set(self.SaveFlags, forKey: "SaveFlags")
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
    }
    
    
    
    
    
    //Choose your custom row heigh
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    
}






//
//// Fetch the coredata object values
//func fetchData() -> () {
//    print("Fetching Data..")
//    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
//    request.returnsObjectsAsFaults = false
//    do {
//        let result = try context.fetch(request)
//        for data in result as! [NSManagedObject] {
//            let userName = data.value(forKey: "flags") as! String
//
//            print("User Name is : "+userName)
//
//        }
//    } catch {
//        print("Fetching data Failed")
//    }
//}


//if let savedValue = UserDefaults.standard.string(forKey: "SaveCricketer") {
//      self.CrickLabel.text = savedValue
//      print("savedValue",savedValue)
//
//  }

//
//  if let savedValue = UserDefaults.standard.string(forKey: "SaveFlags") {
//      self.FlagsLabel.text = savedValue
//      print("savedValue",savedValue)
//
//  }

