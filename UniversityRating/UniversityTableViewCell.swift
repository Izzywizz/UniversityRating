//
//  UniversityTableViewCell.swift
//  UniversityRating
//
//  Created by Izzy on 20/12/2016.
//  Copyright © 2016 Izzy. All rights reserved.
//

import UIKit

enum Rating: Int {
    case poor = 0, notGreat, satisfactory, good, amazing
}

class UniversityTableViewCell: UITableViewCell {
    
    //MARK: Stored Properties
    @IBOutlet weak var moduleLabel: UILabel!
    var universitObject = University()

    @IBOutlet weak var innerCard: UIView!
    
    @IBOutlet weak var poorButton: UIButton!
    @IBOutlet weak var notGreatButton: UIButton!
    @IBOutlet weak var satisfactoryButton: UIButton!
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var amazingButton: UIButton!
    var buttonArray: [UIButton] = [UIButton]() // Empty UIButton array
    
    
    //MARK: nib Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        innerCard.layer.cornerRadius = 5
        setupEmoji()
        buttonArray = [poorButton, notGreatButton, satisfactoryButton, goodButton, amazingButton] // Buttons have now loaded in the view
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    //MARK: Setup Cell with University Object information
    /**
     Ensure specific University cell data is being picked up, so that each cell has the appropiate module name
     */
    func configureCell() {
        moduleLabel.text = "\(universitObject.question)"
        
        //Ensure that the ratings from the preivous selection is maintained, if it returns an optional then the state doesn't need to be selected !
        if let buttonRating = Int(universitObject.rating)   {
            let button = buttonArray[buttonRating]
            button.isSelected = true
        }
    }
    
    //MARK: Action Methods
    @IBAction func emojiSelected(_ sender: UIButton) {
        
        let ratingScore = Rating(rawValue: sender.tag)!
        
        switch ratingScore {
        case .poor:
            print("POOR")
            offSelectedButtonState()
            sender.isSelected = !sender.isSelected;
        case .notGreat:
            print("NotGreat")
            offSelectedButtonState()
            sender.isSelected = !sender.isSelected;
        case .satisfactory:
            print("Satisfactory")
            offSelectedButtonState()
            sender.isSelected = !sender.isSelected;
        case .good:
            print("Good")
            offSelectedButtonState()
            sender.isSelected = !sender.isSelected;
        case .amazing:
            print("Amazing")
            offSelectedButtonState()
            sender.isSelected = !sender.isSelected;
        }
        
        //        print(sender.tag)
//        let currentTimeStamp = NSDate()
//        universitObject.timestamp = "\(currentTimeStamp)"
        universitObject.rating = String(sender.tag)
    }
    
    //MARK: Emoji Image Setup
    func setupEmoji() {
        //set normal image
        poorButton.setImage(UIImage.init(named: "POOR"), for: .normal)
        notGreatButton.setImage(UIImage.init(named: "NOT GREAT"), for: .normal)
        satisfactoryButton.setImage(UIImage.init(named: "SATIS"), for: .normal)
        goodButton.setImage(UIImage.init(named: "GOOD"), for: .normal)
        amazingButton.setImage(UIImage.init(named: "AMAZING"), for: .normal)
        
        //set highlighted image
        poorButton.setImage(UIImage.init(named: "POOR-A"), for: .selected)
        notGreatButton.setImage(UIImage.init(named: "NOT GREAT-A"), for: .selected)
        satisfactoryButton.setImage(UIImage.init(named: "SATIS-A"), for: .selected)
        goodButton.setImage(UIImage.init(named: "GOOD-A"), for: .selected)
        amazingButton.setImage(UIImage.init(named: "AMAZING-A"), for: .selected)
        
    }
    
    func offSelectedButtonState() {
        for button in buttonArray {
            if button.isSelected == true {
                button.isSelected = false
            }
        }
    }
    

}









