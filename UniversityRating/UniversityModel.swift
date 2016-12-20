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
    func createUniversityArray() {
        var universityArray = NSMutableArray()
        
        for dict in University().plistParser(plistName: "University") {
            let uni: University = University().createUniversityFromDict(dict: dict as! NSDictionary)
            universityArray.add(uni)
//            print("Module: \(uni.module), question: \(uni.question) rating: \(uni.rating)")
//            print("Array Count: \(universityArray.count)")
        }
    }
}


class University    {
    
    var module = ""
    var question = ""
    var rating = ""
    
    func createUniversityFromDict( dict: NSDictionary) -> University {
        
        self.module = dict.value(forKey: "module") as! String
        self.question = dict.value(forKey: "question") as! String
        self.rating = dict.value(forKey: "rating") as! String
        
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
