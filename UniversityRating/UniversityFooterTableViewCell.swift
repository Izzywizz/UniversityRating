//
//  UniversityFooterTableViewCell.swift
//  UniversityRating
//
//  Created by Izzy on 22/12/2016.
//  Copyright © 2016 Izzy. All rights reserved.
//

import UIKit

class UniversityFooterTableViewCell: UITableViewCell {
    @IBOutlet weak var submitButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func submitAllModulesPressed(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "submitCourseFeedback"), object: nil)
        submitButton.setTitle("Feedback Submitted!", for: .normal)
        submitButton.alpha = 0.5
        submitButton.isUserInteractionEnabled = false
    }
}
