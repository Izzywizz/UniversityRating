//
//  Time.swift
//  UniversityRating
//
//  Created by Izzy on 06/01/2017.
//  Copyright © 2017 Izzy. All rights reserved.
//

import UIKit

struct Time {
    
    func startOfToday() -> Date {
        let date = Date()
        let cal = Calendar(identifier: .gregorian)
        let midnightDate = cal.startOfDay(for: date)
        //        print("\(midnightDate)")
        
        return midnightDate
    }
    
    func daysBetweenDates(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([Calendar.Component.day], from: startDate, to: endDate)
        print(components.day!)
        return components.day!
    }
    
    func lastSyncedTime() -> Date {
        for index in UniversityModel.sharedIntstance.universityArray {
            let university = index as! University
            if !university.timestamp.isEmpty {
                return convertStringtoDate(timestamp: university.timestamp)
            }
        }
        return Date() //return cuurent date
    }
    
    func convertStringtoDate(timestamp: String) -> Date{
        let strDate = timestamp
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ssZZZZ"
        if let date = dateFormatter.date(from:strDate)  {
            return date
        }
        
        return Date() //current dtae
    }

}
