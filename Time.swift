//
//  Time.swift
//  UniversityRating
//
//  Created by Izzy on 06/01/2017.
//  Copyright © 2017 Izzy. All rights reserved.
//

import UIKit

struct Time {
    
    // No stored properrties needed
    
    //MARK: Time Manipulation Methods
    /**
     A Method that returnns the time for the start of the current day, Monday Midnight for example if it was monday
     - returns: Date() obj
     */
    func startOfToday() -> Date {
        let date = Date()
        let cal = Calendar(identifier: .gregorian)
        let midnightDate = cal.startOfDay(for: date)
        //        print("\(midnightDate)")
        
        return midnightDate
    }
    
    
    /**
     Calculates the number of days between two given dates, this method is primarily used to check
     that the number of days given for feedback exceeds a certain amount in order to facilate the reset mechanic
     for the feedback every Monday.
     - returns: Int (number of days)
     */
    func numberOfDaysPassedBetween(_ startDate: Date, AndEndDate endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([Calendar.Component.day], from: startDate, to: endDate)
        //        print(components.day!)
        return components.day!
    }
    
    /**
     Loops through the list of available timestamps from the university model and converts the String equivilant of
     the date into a Date obj in order to be able use it for calculations for the number of days passed since feedback method.
     If no timestamps have been set then the current date will be returned
     - returns: Date() obj, converted from a String representation of the universities module timestamp
     */
    
    func lastSyncedTime() -> Date {
        let currentDate = Date()
        
        for index in UniversityModel.sharedIntstance.universityArray {
            let university = index as! University
            if !university.timestamp.isEmpty {
                return convertStringtoDate(timestamp: university.timestamp)
            }
        }
        return currentDate //default
    }
    
    /**
     Converts any String timestamp that is set to the default format found in Date() and returns a Date() obj
     - returns: Date() obj
     */
    func convertStringtoDate(timestamp: String) -> Date{
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ssZZZZ"
        if let timestampDate = dateFormatter.date(from:timestamp)  {
            return timestampDate
        }
        
        return currentDate
    }
    
}
