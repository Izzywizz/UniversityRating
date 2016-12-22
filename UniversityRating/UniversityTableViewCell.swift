//
//  UniversityTableViewCell.swift
//  UniversityRating
//
//  Created by Izzy on 20/12/2016.
//  Copyright © 2016 Izzy. All rights reserved.
//

import UIKit

class UniversityTableViewCell: UITableViewCell {

    @IBOutlet weak var moduleLabel: UILabel!
    var universitObject = University()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell() {
        moduleLabel.text = "What do you think of Module \(universitObject.module)"
    }

}
