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
        
        UIFont.familyNames.sorted().forEach { familyName in
            print("*** \(familyName) ***")
            UIFont.fontNames(forFamilyName: familyName).forEach { fontName in
                print("\(fontName)")
            }
            print("---------------------")
        }
        
        
        return VStack(alignment: .leading){
            
            HotRecipeView()
            
            HStack{
                Image("recipe_hot")
                Text("위급한 식자재 이용 레시피")
                    .font(.custom("GmarketSansTTFBold", size: 20))
                    
            }
            HStack{
                
                ForEach(dataModel.expRecipes ) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)){
                        RecipeBox(recipe: recipe)
                    }
                   
                }
            }
            .onAppear{
                dataModel.fetch()
            }
            //RecipeBox()
            
            
        }
    }
}


//struct MainRecipeView_Previews: PreviewProvider {
//    static var previews: some View {
////        RecipeBox(recipe: TestData.Recipes[0])
////        .previewLayout(.sizeThatFits)
//    }
//}
