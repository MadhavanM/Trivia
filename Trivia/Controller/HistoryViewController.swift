//
//  HistoryViewController.swift
//  Trivia
//
//  Created by Madhavan on 27/07/20.
//  Copyright © 2020 myApp. All rights reserved.
//

import UIKit
import CoreData
class HistoryViewController: UIViewController {

    let delegate = UIApplication.shared.delegate as! AppDelegate
    let cellIdentifier = "HistoryTableViewCell"
    @IBOutlet weak var tbl_History: UITableView!
    var people: [NSManagedObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add title to show in navigation bar
        title = "Game History"
        
        //Initilizing core data to fetch stored data.
        let managedContext = delegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "TriviaUsers")

        do {
          people = try managedContext.fetch(fetchRequest)
            // To show recent data at the top we are reversing the array value.
            people = people.reversed()
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
}

// MARK: - Tableview
extension HistoryViewController : UITableViewDelegate,UITableViewDataSource {
    // set number of rows in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people .count
    }
    // set values to cell labels
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let user = people[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HistoryTableViewCell
        
        //Convert daretime to string in order to display in the label
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy HH:mm:ss"
        let myString = formatter.string(from: user.value(forKey: "datetime")as! Date)
        
        cell.lbl_datetime.text = "GAME \(indexPath.row+1) : \(myString)"
        cell.lbl_Name.text = "Name: \(user.value(forKey: "name")as! String)"
        cell.lbl_Ques1.text = "Who is the best cricketer in the world?"
        cell.lbl_Ans1.text = "Answer:  \(user.value(forKey: "answer1")as! String)"
        cell.lbl_Ques2.text = "What are the colors in the national flag?"
        cell.lbl_Ans2.text = "Answer:  \(user.value(forKey: "answer2")as! String)"
        return cell
    }
    
    //Set height for table view
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
  
}
