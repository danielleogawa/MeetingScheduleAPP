//
//  LoginViewController.swift
//  MeetingScheduleApp
//
//  Created by Danielle Nozaki Ogawa on 2022/06/28.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        styleTextField()
    }
    
    
    private func styleTextField(){
        emailTextField.clipsToBounds = true
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.cornerRadius = 15
        emailTextField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        passwordTextField.clipsToBounds = true
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 15
        passwordTextField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        
    }
    @IBAction func newUserButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "newUser", sender: nil)
    }
    
}

