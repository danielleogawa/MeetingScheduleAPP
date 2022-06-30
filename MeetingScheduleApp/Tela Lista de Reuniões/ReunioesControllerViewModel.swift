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
    var service = Service()
    

    func logOut() {
        do {
            try Auth.auth().signOut()
            delegate?.logOutSucessed()
        } catch  let signOutError as NSError {
            print("Error: \(signOutError)")
        }
    }
    
    
    func quantidadeDeReunioes() -> Int{
        return service.fetch().count
    }
    
    func getReuniao(row: Int) -> ReuniaoViewModel {
        let reuniao = service.fetch()[row]
        return ReuniaoViewModel(reuniao: reuniao)
    }
    
    func deletarReuniao(row: Int){
        let reuniao = service.fetch()[row]
        service.remove(reuniao: reuniao)
    }
}
