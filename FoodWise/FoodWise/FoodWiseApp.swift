//
//  FoodWiseApp.swift
//  FoodWise
//
//  Created by dasoya on 17.02.23.
//

import SwiftUI
import GoogleSignIn

@main
struct FoodWiseApp: App {
    
    @StateObject var authViewModel = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
                .onAppear {
                  GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                    if let user = user {
                      self.authViewModel.state = .signedIn(user)
                    } else if let error = error {
                      self.authViewModel.state = .signedOut
                      print("There was an error restoring the previous sign-in: \(error)")
                    } else {
                      self.authViewModel.state = .signedOut
                    }
                  }
                }
                .onOpenURL { url in
                          GIDSignIn.sharedInstance.handle(url)
                        }
                
        }
    }
}

struct TestData {
    
    static var recipe = Recipe(id: 0,name:"투움바 파스타", imageURL: URL(fileURLWithPath: "none"),likeCnt: 32, ingredientList: ingredients,recipeList: recipeList1, ingredient:"감자", expiredDate: 2)
    static let hotrecipe = [recipe]
    static let recipeList1 : [RecipeHow] = [RecipeHow(id: 1, content: "면을 삶아줍니다."), RecipeHow(id: 2, content: "22")]
    static var ingredient = Ingredient(id:  1, name:"Pork",amount: 800, expiredDate: Date())
    static var ingredients : [Ingredient] =  [TestData.ingredient,
                                              Ingredient(id: 2, name:"Pie",amount: 800, expiredDate: Date()),
                                              Ingredient(id: 3, name:"Pizza",amount: 800, expiredDate: Date())]
    
//    static var Recipes : [Recipe] = {
//        let url = Bundle.main.url(forResource: "/app/recipe/recommend", withExtension: "json")
//        let data = try! Data(contentsOf: url)
//        let wrapper = try! JSONDecoder().decode(Wrapper<Recipe>.self, from: data)
//       
//        return wrapper.items
//    }()
    
}
