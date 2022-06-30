//
//  CadastroViewController.swift
//  MeetingScheduleApp
//
//  Created by Danielle Nozaki Ogawa on 2022/06/28.
//

import UIKit


class CadastroViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    let viewModel = CadastroControllerViewModel()
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
        senhaTextField.clipsToBounds = true
        senhaTextField.layer.borderWidth = 1
        senhaTextField.layer.cornerRadius = 15
        senhaTextField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
    }
    @IBAction func closeButtonAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        viewModel.registerUser(email: emailTextField.text, senha: senhaTextField.text)
    }
}

extension CadastroViewController: CadastroControllerViewModelDelegate{
    func loginSucessed() {
        performSegue(withIdentifier: "newUserMeetings", sender: self)
    }
    
    
}
