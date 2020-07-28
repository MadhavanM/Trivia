//
//  SummaryViewController.swift
//  Trivia
//
//  Created by Madhavan on 27/07/20.
//  Copyright © 2020 myApp. All rights reserved.
//

import UIKit
import CoreData
class SummaryViewController: UIViewController {
    let delegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var lbl_Name: UILabel!
    @IBOutlet weak var lbl_Ans1: UILabel!
    @IBOutlet weak var lbl_Ans2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add title to show in navigation bar
        title = "Summary"
        
        //Show selected values in the respective Label
        lbl_Name.text = "Hello \(delegate.userName),"
        lbl_Ans1.text = "Answer:  \(delegate.Answer1)"
        lbl_Ans2.text = "Answer:  \(delegate.Answer2)"
        
        // Coredata initialization
        let context = delegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "TriviaUsers", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        //setvalue in accordance with Attributes.
        newUser.setValue(delegate.userName, forKey: "name")
        newUser.setValue(delegate.Answer1, forKey: "answer1")
        newUser.setValue(delegate.Answer2, forKey: "answer2")
        let currentDateTime = Date()
        newUser.setValue(currentDateTime, forKey: "datetime")
        //saving data to core data entity
        do {
            try context.save()
            print("save success")
        } catch {
            print("Failed saving")
        }
        
    }
    
    //MARK: - Finish button click event
    @IBAction func didTapFinish(_ sender: Any) {
        
        // Popping to the root VC
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    //MARK:- History button click event
    @IBAction func didTapHistory(_ sender: Any) {
        //Pushing to History VC
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}
