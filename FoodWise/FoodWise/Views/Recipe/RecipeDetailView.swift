//
//  RecipeDetailView.swift
//  FoodWise
//
//  Created by dasoya on 06.03.23.
//

import SwiftUI
import UIKit

struct RecipeDetailView: View {
    
    @StateObject private var dataModel : RecipeDataModel

    
    @State private var isIngredientExpanded = false
    @State private var isHowExpanded = false
    
    let nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
        
    @State private var scrollViewContentSize: CGSize = .zero
    
    init(recipe: Recipe){
        let dataModel = RecipeDataModel(recipe: recipe)
        _dataModel = StateObject(wrappedValue: dataModel)
        
        dataModel.fetchRecipe()
    }

    var body: some View {
    
        VStack() {
            
            getGradientImage(image: dataModel.recipe.image ?? Image("sample"))
                .frame(height: 358)
                .ignoresSafeArea()
            
            HStack{
                Text(dataModel.recipe.name)
                    .title1()
                    .padding(.leading,20)
                
                Spacer()
            }
            
            ScrollView(showsIndicators: false){
                VStack{
                    RecipeIngredientBox(ingredients: dataModel.recipe.ingredientList ?? TestData.ingredients)
                    RecipeHowBox(recipeList: dataModel.recipe.recipeList ?? TestData.recipeList1)
                
                }.background(
                        GeometryReader { geo -> Color in
                            DispatchQueue.main.async {
                                scrollViewContentSize = geo.size
                            }
                            return Color.clear
                        }
                    )

            }.frame(
                maxHeight: scrollViewContentSize.height
            )
            
            Spacer()
        }//.navigationBarTitle(Text("The Title"), displayMode: .inline)
    }

}

struct TransparentGroupBox: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(maxWidth: 320, minHeight: 10)
            .padding()
            .background(Color.white)
            .overlay(configuration.label.padding(.leading, 4), alignment: .topLeading)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    
   
    
    static var previews: some View {
       
      
        return RecipeDetailView(recipe: TestData.recipe)
    }
}
