//
//  WetherTableViewCell.swift
//  MVVM
//
//  Created by Chitaranjan Sahu on 10/07/17.
//  Copyright © 2017 me.in. All rights reserved.
//

import UIKit

class WetherTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(_ viewModel: ViewModel) {
        
        self.selectionStyle = .none
        guard let minTemp = viewModel.minTemp,
            let maxTemp = viewModel.maxTemp,
            let summary = viewModel.summary else {
                print("ViewModel is invalid")
                return
        }
        
        dateLabel.text = viewModel.dateString
        minTempLabel.text = String(minTemp)
        maxTempLabel.text = String(maxTemp)
        summaryLabel.text = summary

    }

    

}
