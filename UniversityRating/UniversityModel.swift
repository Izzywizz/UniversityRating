//
//  UniversityModel.swift
//  UniversityRating
//
//  Created by Izzy on 20/12/2016.
//  Copyright © 2016 Izzy. All rights reserved.
//

import Foundation
import UIKit

final class UniversityModel {
    
    //MARK: Shared Instance
    static let sharedIntstance = UniversityModel()
    
    // Can't init is singleton
    fileprivate init() { }
    
    //MARK: Local Variable/ methods
    var universityArray = NSMutableArray()
    
    func createUniversityArray() {
        for index in University().plistParser("University") {
            let uni: University = University().createUniversityFromDict(index as! [String : Any])
            universityArray.add(uni)
//                        print("Module: \(uni.module), question: \(uni.question) rating: \(uni.rating) checked: \(uni.checked)")
//                        print("Array Count: \(universityArray.count)")
        }

    }
    
    func createSavedUniversityArray(_ savedArray: [[String: Any]]) {
        for index in savedArray {
            //            print("TEST: \(index)")
            let uni: University = University().createUniversityFromDictSwift(index)
            //            print("TEST: \(uni.module)")
            universityArray.add(uni)
            
        }
    }
    
    //MARK: Saved Instance Methods
    
    /**
     Method that checks whether the instance has been saved, by using optionals and guard statements
     The method returns false if nothing has been saved in the NSUserDefaults then you hop out of the method, if true,
     the method calls the sharedInstance method that deals with creating the previously saved
     - returns: Bool, True - Data has been saved, False - No save data
     */
    func savedUniversityDic() -> Bool {
        
        guard let loadedUniversities = UserDefaults.standard.array(forKey: "myUniversityDic") as? [[String: Any]] else {
            print("Nothing saved")
            return false
        }
        print("Saved")
        //        print(loadedUniversities)
        let hasFeedbackSubmitted = UserDefaults.standard.bool(forKey: "feedbackSubmitted")
        print("BOOL: \(hasFeedbackSubmitted)")
        
        UniversityModel.sharedIntstance.createSavedUniversityArray(loadedUniversities)
        return true
    }
    
    
    /**
     This ensures that the reset mechainc only happens once on the specifc day
     */
    
    func reset() {
        UserDefaults.standard.set(false, forKey: "feedbackSubmitted")
        UniversityModel.sharedIntstance.universityArray.removeAllObjects()
        UniversityModel.sharedIntstance.createUniversityArray()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    func iterateThroughTimestamps() {
        for index in universityArray {
            let university = index as! University
            print("\(university.timestamp)")
        }
    }
}


class University    {
    
    var module = ""
    var question = ""
    var rating = ""
    var checked = false
    var timestamp = ""
    
    func createUniversityFromDict( _ dict: [String: Any]) -> University {
        
        self.module = dict["module"] as! String
        self.question = dict["question"] as! String
        self.rating = dict["rating"] as! String
        self.checked = dict["checked"] as! Bool
        self.timestamp = dict["submitted"] as! String
        
        return self
    }
    
    /**
     This is the swift version of the university creation from a dictionary, with the included optional unpacked for the Bool
     */
    func createUniversityFromDictSwift( _ dict: [String : Any]) -> University {
        
        self.module = dict["module"] as! String
        self.question = dict["question"] as! String
        self.rating = dict["rating"] as! String
        
        if let checked = dict["checked"] {
            self.checked = Bool (checked as! String)!
        }
        
        self.timestamp = dict["submitted"] as! String
        

        
        return self
    }
    
    
    
    func plistParser(_ plistName: String) -> NSArray {
        if let path = Bundle.main.path(forResource: plistName, ofType: "plist") {
            return NSArray.init(contentsOfFile: path)! as NSArray
        } else  {
            print("Error")
            return []
        }
    }
    
}
