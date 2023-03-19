//
//  extension.swift
//  FoodWise
//
//  Created by dasoya on 25.02.23.
//

import Foundation
import UIKit
import SwiftUI

extension Date {
    

    
    func leftDay(from date: Date) -> Int {
        
        let calendar = Calendar.current
        let currentDate = Date()
    
        return calendar.dateComponents([.day], from: date, to: currentDate).day ?? 0
    }
}

extension UIImage {
    func imageWithColor(color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color.setFill()
//
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)

        let rect = CGRect(origin: .zero, size: CGSize(width: self.size.width, height: self.size.height))
        context?.clip(to: rect, mask: self.cgImage!)
        context?.fill(rect)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}

extension Color{
    
    static let mygray2 : Color = Color(red: 0.91, green: 0.91, blue: 0.93)
    static let mygray4 : Color = Color(red: 0.56, green: 0.56, blue: 0.63)
    static let mygray5 : Color = Color(red: 0.38, green: 0.38, blue: 0.45)
    static let myprimary : Color = Color(red: 1, green: 0.42, blue: 0.24)
    
    
}

extension Text{
    
    
    func grayBoxTextStyle() -> some View {
        self.font(.caption)
            .foregroundColor(Color.white)
            .lineSpacing(12)
            .padding(.horizontal, 4)
            .padding(.vertical, 2)
            .background(Color.mygray5)
            .cornerRadius(2)
    }
    
    func grayBtnBoxTextStyle() -> some View {
        self.font(.system(size: 20))
            .foregroundColor(Color.white)
            .lineSpacing(12)
            .padding(.horizontal, 4)
            .padding(.vertical, 2)
            .background(Color.mygray5)
            .cornerRadius(2)
    }
    
        
}

