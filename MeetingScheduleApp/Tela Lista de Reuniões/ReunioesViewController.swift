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
    let addNovaReuniaoViewModel = NovaReuniaoControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        meetingsListTableView.dataSource = self
        meetingsListTableView.delegate = self
        viewModel.delegate = self

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        meetingsListTableView.reloadData()
    }
    @IBAction func addNewMeetindButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "newMeeting", sender: nil)
    }
    @IBAction func appLogOutButtonAction(_ sender: Any) {
        viewModel.logOut()
    }
    
}

extension ReunioesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.quantidadeDeReunioes()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuniaoCell", for: indexPath) as? ReuniaoTableViewCell
        let reuniaoViewModel = viewModel.getReuniao(row: indexPath.row)
        cell?.configureCell(viewModel: reuniaoViewModel)
        return cell ?? UITableViewCell()
    }
}

extension ReunioesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deletarReuniao(row: indexPath.row)
            meetingsListTableView.reloadData()
        }
        
    }
}
extension ReunioesViewController: ReunioesControllerViewModelDelegate {
    func logOutSucessed() {
        dismiss(animated: true)
    }
}


