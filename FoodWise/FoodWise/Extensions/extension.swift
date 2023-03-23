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
    
    
    static let mygray1 : Color = Color(red: 0.96, green: 0.96, blue: 0.98)
    static let mygray2 : Color = Color(red: 0.91, green: 0.91, blue: 0.93)
    static let mygray3 : Color = Color(red: 0.78, green: 0.78, blue: 0.78)
    static let mygray4 : Color = Color(red: 0.56, green: 0.56, blue: 0.63)
    static let mygray5 : Color = Color(red: 0.38, green: 0.38, blue: 0.45)
    static let mygray6 : Color = Color(red: 0.27, green: 0.27, blue: 0.34)
    static let myprimary : Color = Color(red: 1, green: 0.42, blue: 0.24)
    static let mysecondary : Color = Color(red: 1, green: 0.57, blue: 0.44)
    
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
    
    func title1() -> some View {
        self.font(.custom("GmarketSansTTFBold", size: 28))
            
    }
    
    func title2() -> some View {
        self.font(.custom("GmarketSansTTFBold", size: 20))
            
    }
    
    func title3() -> some View {
        self.font(.custom("GmarketSansTTFBold", size: 18))
            
    }
    
 
    func subTitle1() -> some View {
        self.font(.custom("GmarketSansTTFMedium", size: 18))
            
    }
    
    
    func subTitle2() -> some View {
        self.font(.custom("Pretendard-Medium", size: 18))
            
    }
    
    func subTitle3() -> some View {
        self.font(.custom("Pretendard-Medium", size: 16))
            
    }
    
    func body1() -> some View {
        self.font(.custom("Pretendard-Regular", size: 16))
            
    }
    
    func body2() -> some View {
        self.font(.custom("Pretendard-Regular", size: 14))
            
    }
    
    func tag1() -> some View {
        self.font(.custom("Pretendard-Regular", size: 12))
            
    }
    
    func tag2() -> some View {
        self.font(.custom("Pretendard-SemiBold", size: 12))
            
    }
    
        
}


