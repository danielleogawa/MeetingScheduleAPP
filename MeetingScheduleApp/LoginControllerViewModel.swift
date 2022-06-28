//
//  LoginControllerViewModel.swift
//  MeetingScheduleApp
//
//  Created by Danielle Nozaki Ogawa on 2022/06/28.
//

import Foundation
import FirebaseAuth

protocol LoginControllerViewModelDelegate {
    func loginSucessed()
    func cannotLogin()
}

class LoginControllerViewModel {
    
    var delegate: LoginControllerViewModelDelegate?
    
    func verifyUser(email: String?, password: String?){
        guard let email = email, let password = password else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                self.delegate?.cannotLogin()
            } else {
                self.delegate?.loginSucessed()
            }
        }
    }
}
