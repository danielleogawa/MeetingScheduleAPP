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
    
    let viewModel = LoginControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
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
        viewModel.verifyUser(email: emailTextField.text, password: passwordTextField.text)
    }
    @IBAction func newUserButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "newUser", sender: nil)
    }
    
}

extension LoginViewController: LoginControllerViewModelDelegate {
    func loginSucessed() {
        performSegue(withIdentifier: "userMeetings", sender: self)
        emailTextField.layer.borderColor = UIColor.clear.cgColor
        passwordTextField.layer.borderColor = UIColor.clear.cgColor
    }
    
    func cannotLogin() {
        emailTextField.layer.borderColor = UIColor.red.cgColor
        passwordTextField.layer.borderColor = UIColor.red.cgColor
    }
    
    
}

