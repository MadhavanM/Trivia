//
//  Ques2ViewController.swift
//  Trivia
//
//  Created by Madhavan on 27/07/20.
//  Copyright © 2020 myApp. All rights reserved.
//

import UIKit

class Ques2ViewController: UIViewController {
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var swi_A: UISwitch!
    @IBOutlet weak var swi_B: UISwitch!
    @IBOutlet weak var swi_C: UISwitch!
    @IBOutlet weak var swi_D: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add title to show in navigation bar
        title = "Question 2"
        
    }
    // MARK: - Next button click event
    @IBAction func didTapNext(_ sender: Any) {
        var colorStr = String()
        if swi_A.isOn == true {
            colorStr = "White"
        }
        if swi_B.isOn == true {
            if colorStr != "" {
                colorStr = "\(colorStr), Yellow"
            }else{
                colorStr = "Yellow"
            }
        }
        if swi_C.isOn == true {
            if colorStr != "" {
                colorStr = "\(colorStr), Orange"
            }else{
                colorStr = "Green"
            }
        }
        if swi_D.isOn == true {
            if colorStr != "" {
                colorStr = "\(colorStr), Green"
            }else{
                colorStr = "Green"
            }
        }
        delegate.Answer2 = colorStr
        //        check whether any option is selected or not, If not selected show alert
        if delegate.Answer2 == ""{
            let alert = UIAlertController(title: "ALert", message: "Please select atlest 1 choice!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            // If selected move to Summary VC
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "SummaryViewController") as! SummaryViewController
            self.navigationController?.pushViewController(newViewController, animated: true)
            print(delegate.userName)
            print(delegate.Answer1)
            print(delegate.Answer2)
        }
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
