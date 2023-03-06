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
     
        HotRecipeView()
        
        Text("위급한 식자재 이용 레시피")
//        List(dataModel.recipes){
//
//        }
        
        //RecipeBox()
        
       
        
    }
}

