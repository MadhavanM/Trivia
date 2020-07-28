//
//  ViewController.swift
//  Trivia
//
//  Created by Madhavan on 27/07/20.
//  Copyright © 2020 myApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var txt_Name: UITextField!
    @IBOutlet weak var btn_Next: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        txt_Name.text = ""
    }
    @IBAction func didTapNext(_ sender: Any) {
        // check if text field is empty, if not push to question 1 VC
        if (txt_Name.text != "") {
            delegate.userName = txt_Name.text!
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "Ques1ViewController") as! Ques1ViewController
        self.navigationController?.pushViewController(newViewController, animated: true)
            print(delegate.userName)
            self.view.endEditing(true)
        }else{
            // Show alert if text field is empty
            let alert = UIAlertController(title: "ALert", message: "Please enter your Name!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

