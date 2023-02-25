//
//  Recipe.swift
//  FoodWise
//
//  Created by dasoya on 22.02.23.
//

import Foundation
import UIKit

struct Recipe {
    
    let id: String
    let name: String
    let imageURL: URL
    var image: UIImage?
    var likeCnt: Int?
    var likeStatus: Bool?
    
    let ingredient: String?
    var expiredDate: Date?
   
  
}

extension Recipe: Decodable {
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case imageURL
        case likeCnt
        case likeStatus
        case ingredient
        case expiredDate
        
    }
}


class RecipesDataModel : ObservableObject {
    
    @Published private(set) var recipes: [Recipe] = []
    @Published private(set) var isLoading = false
    
    private var request : APIRequest<RecipesResource>?
    
    func fetchRecipes(){
        
        guard !isLoading else { return }
        isLoading = true
        let resource = RecipesResource()
        let request = APIRequest(resource: resource)
        self.request = request
        request.execute{[weak self] recipes in
            self?.recipes = recipes ?? []
            self?.isLoading = false
        }
    }
    
}


