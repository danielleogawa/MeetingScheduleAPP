//
//  ReunioesViewController.swift
//  MeetingScheduleApp
//
//  Created by Danielle Nozaki Ogawa on 2022/06/28.
//

import UIKit

class ReunioesViewController: UIViewController {
    @IBOutlet weak var meetingsListTableView: UITableView!
    
    let viewModel = ReunioesControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self

    }
    @IBAction func addNewMeetindButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "newMeeting", sender: nil)
    }
    @IBAction func appLogOutButtonAction(_ sender: Any) {
        viewModel.logOut()
    }
    
}

extension ReunioesViewController: ReunioesControllerViewModelDelegate {
    func logOutSucessed() {
        dismiss(animated: true)
    }
    
    
}
