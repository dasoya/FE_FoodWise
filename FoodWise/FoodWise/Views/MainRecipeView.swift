//
//  MainRecipeView.swift
//  FoodWise
//
//  Created by dasoya on 19.02.23.
//

import SwiftUI

struct MainRecipeView : View {
    
    @StateObject private var dataModel = RecipesDataModel()
    
    var body : some View {
        
//        List(dataModel.recipes){
//
//        }
        
        RecipeBox()
        
        Text("main recipe 창")
        
    }
}

struct RecipeBox : View {
    
    var recipe : Recipe = TestData.recipe
    @State var heart = false
    
    
    var body : some View {
        
        
        VStack(alignment: .leading, spacing: 8.0){
           
            HStack(spacing: 3.06) {
                
                Toggle(isOn: $heart, label: {
                    Label("", systemImage: "heart.fill")
                })
                .toggleStyle(ButtonToggleStyle())
                .foregroundColor(.red)
                .padding()
               
                if let cnt = recipe.likeCnt{
                    Text("\(cnt)")
                        .font(.caption)
                        .lineSpacing(12)
                }
            }
            
            HStack(alignment: .top, spacing: 4) {
                if let date = recipe.expiredDate{
                    var leftDay = Date().leftDay(from: date)
                    Text("D-\(leftDay)")
                       .font(.caption)
                       .lineSpacing(12)
                       .padding(.horizontal, 4)
                       .padding(.vertical, 2)
                       .background(Color(red: 1, green: 0.42, blue: 0.24))
                       .cornerRadius(2)
                }
                
                if let ingredient = recipe.ingredient {
                    Text(ingredient)
                        .font(.caption)
                        .lineSpacing(12)
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2)
                        .background(Color(red: 1, green: 0.42, blue: 0.24))
                        .cornerRadius(2)
                }
            }
            
            Text(recipe.name)
                .fontWeight(.medium)
                .font(.callout)
                .lineSpacing(16)
            
        }
           // .frame(width: 87, height: 38)
//            .padding(.vertical, 11)
//            .padding(.leading, 10)
//            .padding(.trailing, 63)
           // .frame(width: 160, height: 60)
            .background(Color(red: 0.96, green: 0.96, blue: 0.98))
            .cornerRadius(4)
    }
    
    
    
}

struct TestData {
    static var recipe = Recipe(id:"none",name:"투움바 파스타", imageURL: URL(fileURLWithPath: "none"),ingredient: "면", expiredDate: Date())
    
    
}

