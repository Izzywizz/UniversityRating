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
    private init() { }
    
    //MARK: Local Variable/ methods
    var universityArray = NSMutableArray()
    
    func createUniversityArray() {
        for array in University().plistParser(plistName: "University") {
            let uni: University = University().createUniversityFromDict(dict: array as! NSDictionary)
            universityArray.add(uni)
            //            print("Module: \(uni.module), question: \(uni.question) rating: \(uni.rating) checked: \(uni.checked)")
            //            print("Array Count: \(universityArray.count)")
        }
    }
    
    func createSavedUniversityArray(savedArray: [[String: Any]]) {
        for index in savedArray {
            //            print("TEST: \(index)")
            let uni: University = University().createUniversityFromDictSwift(dict: index as NSDictionary)
            //            print("TEST: \(uni.module)")
            universityArray.add(uni)
            
        }
    }
    
    func resetRatingAndChecked() {
        for index in universityArray {
            let university = index as! University
            university.rating = ""
            university.checked = false
        }
    }
}


class University    {
    
    var module = ""
    var question = ""
    var rating = ""
    var checked = false
    
    
    func createUniversityFromDict( dict: NSDictionary) -> University {
        
        self.module = dict.value(forKey: "module") as! String
        self.question = dict.value(forKey: "question") as! String
        self.rating = dict.value(forKey: "rating") as! String
        self.checked = dict.value(forKey: "checked") as! Bool
        
        return self
    }
    
    /**
     This is the swift version of the university creation from a dictionary, with the included optional unpacked for the Bool
     */
    func createUniversityFromDictSwift( dict: NSDictionary) -> University {
        
        self.module = dict.value(forKey: "module") as! String
        self.question = dict.value(forKey: "question") as! String
        self.rating = dict.value(forKey: "rating") as! String
        
        if let checked = dict.value(forKey: "checked") {
            self.checked = Bool (checked as! String)!
        }
        
        return self
    }
    
    
    
    func plistParser(plistName: String) -> NSArray {
        if let path = Bundle.main.path(forResource: plistName, ofType: "plist") {
            return NSArray.init(contentsOfFile: path)! as NSArray
        } else  {
            print("Error")
            return []
        }
    }
    
}
