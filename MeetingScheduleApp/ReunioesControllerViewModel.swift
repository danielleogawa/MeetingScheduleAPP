//
//  ReunioesControllerViewModel.swift
//  MeetingScheduleApp
//
//  Created by Danielle Nozaki Ogawa on 2022/06/28.
//

import Foundation
import FirebaseAuth

protocol ReunioesControllerViewModelDelegate {
    func logOutSucessed()
}

class ReunioesControllerViewModel {
    var delegate: ReunioesControllerViewModelDelegate?
    
    
    func logOut() {
        do {
            try Auth.auth().signOut()
            delegate?.logOutSucessed()
        } catch  let signOutError as NSError {
            print("Error: \(signOutError)")
        }
    }
}
