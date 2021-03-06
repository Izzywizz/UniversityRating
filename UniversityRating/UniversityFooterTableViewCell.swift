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
    let universityArray = UniversityModel.sharedIntstance.universityArray
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let feedbackReceived = UserDefaults.standard.bool(forKey: "feedbackSubmitted")
        
        if feedbackReceived {
            submitButton.setTitle("FEEDBACK SUBMITTED", for: .normal)
            submitButton.alpha = 0.5
            isUserInteractionEnabled = false
            
        } else {
            submitButton.setTitle("SUBMIT ALL MODULES", for: .normal)
            submitButton.alpha = 1
            isUserInteractionEnabled = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func submitAllModulesPressed(_ sender: UIButton) {
        
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "submitCourseFeedback"), object: nil)
            submitButton.setTitle("FEEDBACK SUBMITTED!", for: .normal)
            submitButton.alpha = 0.5
            submitButton.isUserInteractionEnabled = false

    }
    
}
