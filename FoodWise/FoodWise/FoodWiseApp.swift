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
    static var recipe = Recipe(id:"none",name:"투움바 파스타", imageURL: URL(fileURLWithPath: "none"),likeCnt: 32, ingredient: "면", expiredDate: Date())
    
    static var ingredient = Ingredient(id: "a", name:"어디까지 늘어나는거예요?",amount: 800, expiredDate: Date())
    static var ingredients : [Ingredient] =  [TestData.ingredient,
                                              Ingredient(id: "b", name:"Pie",amount: 800, expiredDate: Date()),
                                              Ingredient(id: "c", name:"Pizza",amount: 800, expiredDate: Date())]
}
