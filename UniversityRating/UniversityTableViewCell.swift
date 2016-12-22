//
//  UniversityTableViewCell.swift
//  UniversityRating
//
//  Created by Izzy on 20/12/2016.
//  Copyright © 2016 Izzy. All rights reserved.
//

import UIKit

class UniversityTableViewCell: UITableViewCell {

    //MARK: Stored Properties
    @IBOutlet weak var moduleLabel: UILabel!
    var universitObject = University()
    
    
    //MARK: nib Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //MARK: Ensure specific University cell data is being picked up, so that each cell has the appropiate module name
    func configureCell() {
        moduleLabel.text = "What do you think of Module \(universitObject.module)"
    }

    //MARK: Action Methods
    @IBAction func emojiSelected(_ sender: UIButton) {
        
        switch sender.tag {
        case 0: print("POOR")
        case 1: print("NotGreat")
        case 2: print("Satisfactory")
        case 3: print("Good")
        case 4: print("Amazing")
        default:
            print("TAG not reconized")
        }
    }
}
