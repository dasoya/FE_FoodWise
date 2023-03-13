//
//  ingredient.swift
//  FoodWise
//
//  Created by dasoya on 06.03.23.
//

import Foundation

struct Ingredient {
    
    let id : String
    let name : String
    var amount : Int?
    var expiredDate: Date?
    
    
}

extension Ingredient: Decodable, Hashable{
    
    enum CodingKeys: String, CodingKey{
        
        case id
        case name
        case amount
        case expiredDate
        
    }
}
