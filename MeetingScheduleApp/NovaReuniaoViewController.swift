//
//  NovaReuniaoViewController.swift
//  MeetingScheduleApp
//
//  Created by Danielle Nozaki Ogawa on 2022/06/28.
//

import UIKit

class NovaReuniaoViewController: UIViewController {
    @IBOutlet weak var tituloTextField: UITextField!
    @IBOutlet weak var descricaoTextField: UITextField!
    @IBOutlet weak var enderecoTextField: UITextField!
    @IBOutlet weak var dataTextfield: UITextField!
    @IBOutlet weak var horaTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleTextField()
    }
    
    private func styleTextField(){
        tituloTextField.clipsToBounds = true
        tituloTextField.layer.borderWidth = 1
        tituloTextField.layer.cornerRadius = 15
        tituloTextField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        descricaoTextField.clipsToBounds = true
        descricaoTextField.layer.borderWidth = 1
        descricaoTextField.layer.cornerRadius = 0
    
        enderecoTextField.clipsToBounds = true
        enderecoTextField.layer.borderWidth = 1
        enderecoTextField.layer.cornerRadius = 0
        
        dataTextfield.clipsToBounds = true
        dataTextfield.layer.borderWidth = 1
        dataTextfield.layer.cornerRadius = 0
        
        horaTextField.clipsToBounds = true
        horaTextField.layer.borderWidth = 1
        horaTextField.layer.cornerRadius = 15
        horaTextField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
    }
    @IBAction func closeActionButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        
    }
    
}
