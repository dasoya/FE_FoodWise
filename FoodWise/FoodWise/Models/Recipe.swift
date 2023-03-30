//
//  Recipe.swift
//  FoodWise
//
//  Created by dasoya on 22.02.23.
//

import Foundation
import UIKit
import SwiftUI

struct Recipe : Identifiable {
    
    let id: Int?
    let name: String
    let imageURL: URL?
    var image: Image?
    var likeCnt: Int?
    var likeStatus: Bool?
    
    var ingredientList: [Ingredient]?
    var recipeList : [RecipeHow]?
    
    let ingredient: String?
    var expiredDate: Int?
   
  
}

extension Recipe: Decodable {
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case imageURL = "img"
        case likeCnt = "dibsCnt"
        case likeStatus = "dibsStatus"
        
        case ingredientList = "ingredientList"
        case recipeList = "recipeList"
        
        case ingredient
        case expiredDate = "dday"
        
    }
    
    
}

struct RecipeHow : Decodable {
    
    let id : Int
    let content : String
    
}

extension RecipeHow : Identifiable {
    enum CodingKeys : String, CodingKey{
        case id = "order"
        case content
    }
}

struct RecommendRecipe : Decodable {
    let body: Body
    struct Body: Decodable {
        
        let hotRecipe : [Recipe]
        let expRecipe : [Recipe]
        let ivtRecipe : [Recipe]
    }

 
}

struct RecipeAPIModel : Decodable {
    let body: Recipe
}


class RecipesDataModel : ObservableObject {
    
    @Published private(set) var hotRecipes: [Recipe] = []
    @Published private(set) var expRecipes: [Recipe] = []
    @Published private(set) var ivtRecipes: [Recipe] = []
    
    @Published private(set) var isLoading = false
    
    private var request : APIRequest<RecipesResource>?
   
//    func fetchRecipes(){
//
//        guard !isLoading else { return }
//        isLoading = true
//        let resource = RecipesResource()
//        let request = APIRequest(resource: resource)
//        self.request = request
//        request.execute{[weak self] recipes in
////            self?.hotRecipes = recipes?.hotRecipe ?? []
////            self?.expRecipes = recipes?.expRecipe ?? []
////            self?.ivtRecipes = recipes?.ivtRecipe ?? []
//            self?.isLoading = false
//        }
//    }
    
    func fetch(){
        guard !isLoading else { return }
        isLoading = true
        
        requestAPI{[weak self] recipes in
            self?.hotRecipes = recipes?.body.hotRecipe ?? []
            self?.expRecipes = recipes?.body.expRecipe ?? []
            self?.ivtRecipes = recipes?.body.ivtRecipe ?? []
            self?.isLoading = false
        
        }
        
    }
    
    func requestAPI(compilationHandler: @escaping (RecommendRecipe?) -> Void){
        guard let url:URL = URL(string: "http://34.64.139.210/app/recipe/recommend") else {
                   return
               }
               var urlReq:URLRequest = URLRequest.init(url: url)
               
               urlReq.httpMethod = "GET"
               
               let Task = URLSession.shared.dataTask(with: urlReq) { (data, response, error) in
                   
                   guard error == nil else {
                       print("Error: error calling GET")
                       print(error!)
                       return
                   }
                   guard let data = data else {
                       print("Error: Did not receive data")
                       return
                   }
                   guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                       print("Error: HTTP request failed")
                       return
                   }
                   guard let output = try? JSONDecoder().decode(RecommendRecipe.self, from: data) else {
                       print("Error: JSON Data Parsing failed")
                       return
                       
                   }
                       
                   DispatchQueue.main.async {
                       
                       let str = String(decoding: data, as: UTF8.self)
                       print("recipe data: "+str)
                       
                       compilationHandler(output)
                   }
                   
               }
               
               Task.resume()
    }
    
}


class RecipeDataModel: ObservableObject {
    @Published var recipe : Recipe
    @Published var isLoading = false

    private var recipeRequest: APIRequest<RecipesResource>?
    private var imageRequest: ImageRequest?

    init(recipe: Recipe) {
        self.recipe = recipe
    }

    func loadRecipe() {
        guard !isLoading else { return }
        isLoading = true
        let resource = RecipesResource(id: recipe.id)
        let request = APIRequest(resource: resource)
        self.recipeRequest = request
        request.execute { [weak self] recipes in
            guard let recipe = recipes?.first else { return }
            self?.recipe = recipe.body
            self?.loadRecipeImage()
        }
    }
    
    func fetchRecipe(){
        guard !isLoading else { return }
        isLoading = true
        
        requestAPI{[weak self] recipes in
            guard let recipeModel = recipes else { return}
            
            self?.recipe = recipeModel.body
            self?.loadRecipeImage()
           
        
        }
        
    }
    
    func requestAPI(compilationHandler: @escaping (RecipeAPIModel?) -> Void){
            guard let url:URL = URL(string: "http://34.64.139.210/app/recipe/\(recipe.id!)") else {
                   return
               }
        
               var urlReq:URLRequest = URLRequest.init(url: url)
               
               urlReq.httpMethod = "GET"
               
               let Task = URLSession.shared.dataTask(with: urlReq) { (data, response, error) in
                   
                   guard error == nil else {
                       print("Error: error calling GET")
                       print(error!)
                       return
                   }
                   guard let data = data else {
                       print("Error: Did not receive data")
                       return
                   }
                   guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                       print("Error: HTTP request failed")
                       print(url.description)
                       return
                   }
                   guard let output = try? JSONDecoder().decode(RecipeAPIModel.self, from: data) else {
                       print("Error: JSON Data Parsing failed")
                       let str = String(decoding: data, as: UTF8.self)
                       print("data: "+str)
                       return
                       
                   }
                       
                   DispatchQueue.main.async {
                       compilationHandler(output)
                   }
                   
               }
               
               Task.resume()
    }
}

extension RecipeDataModel {
    func loadRecipeImage() {

        guard let url = recipe.imageURL else { return }
        let imageRequest = ImageRequest(url: url) //url
        
        
        self.imageRequest = imageRequest
        imageRequest.execute { [weak self] image in
            self?.recipe.image = image
            self?.isLoading = false
        }
    }
}
