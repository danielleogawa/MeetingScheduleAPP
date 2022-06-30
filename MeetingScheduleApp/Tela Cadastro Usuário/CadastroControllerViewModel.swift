//
//  CadastroControllerViewModel.swift
//  MeetingScheduleApp
//
//  Created by Danielle Nozaki Ogawa on 2022/06/28.
//

import Foundation
import FirebaseAuth

protocol CadastroControllerViewModelDelegate {
    func loginSucessed()
}
class CadastroControllerViewModel {
    
    var delegate: CadastroControllerViewModelDelegate?
    
    func registerUser(email: String?, senha: String?){
        guard let email = email, let senha = senha else { return }
        Auth.auth().createUser(withEmail: email, password: senha) { authResult, error in
            
            if let error = error {
                print(error.localizedDescription)
            } else {
                
                self.delegate?.loginSucessed()
            }
            
            
            
        }
    }
    
}
