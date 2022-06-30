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
    
    let viewModel = NovaReuniaoControllerViewModel()
    let datePicker = UIDatePicker()
    let horarioPicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    
        styleTextField()
        criarDatePicker()
        criarHorarioPicker()
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
    // MARK: - costumização do textfield de data
    
    private func criarToolBar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let salvarButton = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: #selector(salvarButtonAction))
        toolBar.setItems([salvarButton], animated: true)
        return toolBar
        
    }
    
    private func criarDatePicker(){
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        dataTextfield.inputView = datePicker
        dataTextfield.inputAccessoryView = criarToolBar()
    }
    
    @objc func salvarButtonAction(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        self.dataTextfield.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    // MARK: - costumização do textfield de horario
    
    private func criarToolBarParaHorario() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let salvarButton = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: #selector(salvarButtonActionParaHorario))
        toolBar.setItems([salvarButton], animated: true)
        return toolBar
        
    }
    
    private func criarHorarioPicker(){
        horarioPicker.preferredDatePickerStyle = .wheels
        horarioPicker.datePickerMode = .time
        horaTextField.inputView = horarioPicker
        horaTextField.inputAccessoryView = criarToolBarParaHorario()
    }
    
    @objc func salvarButtonActionParaHorario(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        
        self.horaTextField.text = dateFormatter.string(from: horarioPicker.date)
        self.view.endEditing(true)
    }
    
    @IBAction func closeActionButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        viewModel.adicionarReuniao(
            titulo: tituloTextField.text,
            descricao: descricaoTextField.text,
            endereco: enderecoTextField.text,
            data: dataTextfield.text,
            horario: horaTextField.text)
    }
    
}

extension NovaReuniaoViewController: NovaReuniaoControllerViewModelDelegate {
    func fecharTela() {
        dismiss(animated: true)
    }
    
    func alertaInformacoesInvalidas() {
        let alerta = UIAlertController(title: "Ops!", message: "Não esqueça de preencher todos os campos", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alerta.addAction(okAction)
        present(alerta, animated: true, completion: nil)
        
    }
    
    
}
