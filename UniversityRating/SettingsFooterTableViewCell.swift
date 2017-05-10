//
//  SettingsFooterTableViewCell.swift
//  UniversityRating
//
//  Created by Izzy on 22/12/2016.
//  Copyright © 2016 Izzy. All rights reserved.
//

import UIKit



class SettingsFooterTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func okButtonPressed(_ sender: UIButton) {
        print("Ok Button Pressed")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "moduleSelected"), object: nil)
    }
}
