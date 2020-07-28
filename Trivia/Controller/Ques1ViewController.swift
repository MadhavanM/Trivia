//
//  Ques1ViewController.swift
//  Trivia
//
//  Created by Madhavan on 27/07/20.
//  Copyright © 2020 myApp. All rights reserved.
//

import UIKit

class Ques1ViewController: UIViewController {
    let delegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var swi_D: UISwitch!
    @IBOutlet weak var swi_C: UISwitch!
    @IBOutlet weak var swi_B: UISwitch!
    @IBOutlet weak var swi_A: UISwitch!
    @IBOutlet weak var btn_Next: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add title to show in navigation bar
        title = "Question 1"
    }
    
    @IBAction func didTapNext(_ sender: Any) {
        //        check whether any option is selected or not, If not selected show alert
        if delegate.Answer1 == ""{
            let alert = UIAlertController(title: "ALert", message: "Please select 1 choice!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            // If selected move to Question 2 VC
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "Ques2ViewController") as! Ques2ViewController
            self.navigationController?.pushViewController(newViewController, animated: true)
            print(delegate.userName)
            print(delegate.Answer1)
        }
    }
    //MARK: - Switch functions
    // turn other switch OFF, when one switch is turned ON
    @IBAction func act_A(_ sender: Any) {
        if swi_A.isOn == false{
            delegate.Answer1 = ""
            swi_A.setOn(false, animated: true)
            swi_B.setOn(false, animated: true)
            swi_C.setOn(false, animated: true)
            swi_D.setOn(false, animated: true)
        }else{
            delegate.Answer1 = "Sachin Tendulkar"
            swi_A.setOn(true, animated: true)
            swi_B.setOn(false, animated: true)
            swi_C.setOn(false, animated: true)
            swi_D.setOn(false, animated: true)
        }
    }
    
    @IBAction func act_B(_ sender: Any) {
        if swi_B.isOn == false{
            delegate.Answer1 = ""
            swi_A.setOn(false, animated: true)
            swi_B.setOn(false, animated: true)
            swi_C.setOn(false, animated: true)
            swi_D.setOn(false, animated: true)
        }else{
            delegate.Answer1 = "Virat Kozhi"
            swi_A.setOn(false, animated: true)
            swi_B.setOn(true, animated: true)
            swi_C.setOn(false, animated: true)
            swi_D.setOn(false, animated: true)
        }
    }
    @IBAction func act_C(_ sender: Any) {
        if swi_C.isOn == false{
            delegate.Answer1 = ""
            swi_A.setOn(false, animated: true)
            swi_B.setOn(false, animated: true)
            swi_C.setOn(false, animated: true)
            swi_D.setOn(false, animated: true)
        }else{
            delegate.Answer1 = "Adam Gilchirst"
            swi_A.setOn(false, animated: true)
            swi_B.setOn(false, animated: true)
            swi_C.setOn(true, animated: true)
            swi_D.setOn(false, animated: true)
        }
    }
    @IBAction func act_D(_ sender: Any) {
        if swi_D.isOn == false{
            delegate.Answer1 = ""
            swi_A.setOn(false, animated: true)
            swi_B.setOn(false, animated: true)
            swi_C.setOn(false, animated: true)
            swi_D.setOn(false, animated: true)
        }else{
            delegate.Answer1 = "Jacques Kallis"
            swi_A.setOn(false, animated: true)
            swi_B.setOn(false, animated: true)
            swi_C.setOn(false, animated: true)
            swi_D.setOn(true, animated: true)
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
