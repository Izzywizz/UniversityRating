//
//  SettingsTableViewCell.swift
//  UniversityRating
//
//  Created by Izzy on 20/12/2016.
//  Copyright © 2016 Izzy. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    var universitObject = University()

    @IBOutlet weak var moduleSelectionLabel: UILabel!
    @IBOutlet weak var internalSettingsCard: UIView!
    @IBOutlet weak var tickImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        internalSettingsCard.layer.cornerRadius = 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell() {
        moduleSelectionLabel.text = "Module \(universitObject.module)"
    }

}
