//
//  ReuniaoTableViewCell.swift
//  MeetingScheduleApp
//
//  Created by Danielle Nozaki Ogawa on 2022/06/30.
//

import UIKit

class ReuniaoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    func configureCell(viewModel: ReuniaoViewModel){
        titleLabel.text = viewModel.getTitulo()
        descriptionLabel.text = viewModel.getDescricao()
        dateLabel.text = viewModel.getData()
        timeLabel.text = viewModel.getData()
    }

}
