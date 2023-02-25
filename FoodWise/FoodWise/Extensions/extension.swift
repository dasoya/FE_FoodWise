//
//  extension.swift
//  FoodWise
//
//  Created by dasoya on 25.02.23.
//

import Foundation

extension Date {
    

    
    func leftDay(from date: Date) -> Int {
        
        let calendar = Calendar.current
        let currentDate = Date()
    
        return calendar.dateComponents([.day], from: date, to: currentDate).day ?? 0
    }
}
