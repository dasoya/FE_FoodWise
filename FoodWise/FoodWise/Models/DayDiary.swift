//
//  DayDiary.swift
//  FoodWise
//
//  Created by dasoya on 27.03.23.
//

import Foundation
import SwiftUI

enum MealType : Decodable {
    
  case breakfast
  case lunch
  case dinner
    
}

struct DayDiary  {
    
    
    let menu: String
    let imageURL: URL?
    var image: Image?
    
    let daytype : MealType?
   
  
}

extension DayDiary: Decodable {
    
    enum CodingKeys: String, CodingKey{
        case menu
        case imageURL
        case daytype
        
    }
    
    
}
