//
//  RecipeDetailView.swift
//  FoodWise
//
//  Created by dasoya on 06.03.23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @StateObject private var dataModel : RecipeDataModel

    
    @State private var isIngredientExpanded = false
    @State private var isHowExpanded = false
    
    let nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
        
    @State private var scrollViewContentSize: CGSize = .zero
    
    init(recipe: Recipe){
        let dataModel = RecipeDataModel(recipe: recipe)
        _dataModel = StateObject(wrappedValue: dataModel)
    }

    var body: some View {
    
        VStack() {
            
            getGradientImage(image: "sample")
                .frame(height: 358)
                .ignoresSafeArea()
            
            HStack{
                Text("된장 크림 파스타")
                    .font(.title)
                    .bold()
                    .padding(.leading,20)
                
                Spacer()
            }
            
            ScrollView(showsIndicators: false){
                VStack{
                    RecipeIngredientBox()
                    RecipeHowBox()
                
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
        RecipeDetailView(recipe: TestData.recipe)
    }
}
