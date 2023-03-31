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
        
//        UIFont.familyNames.sorted().forEach { familyName in
//            print("*** \(familyName) ***")
//            UIFont.fontNames(forFamilyName: familyName).forEach { fontName in
//                print("\(fontName)")
//            }
//            print("---------------------")
//        }
//
        
        return
            ScrollView(showsIndicators : false){
                VStack(alignment: .leading){
                    HotRecipeView()
                        .frame(height: 467)
                   
                    
                    Group{
                        
                        HStack{
                            Image("recipe_hot")
                                .resizable()
                                .frame(width: 21,height: 28)
                            
                            Text("위급한 식자재 이용 레시피")
                                .title2()
                            Spacer()
                        }
                        
                        ScrollView(.horizontal, showsIndicators : false){
                            HStack{
                                
                                ForEach(dataModel.expRecipes) { recipe in
                                    NavigationLink(destination: RecipeDetailView(recipe: recipe)){
                                        RecipeBox(recipe: recipe)
                                    }
                                    
                                }
                            }
                        }.padding(.bottom,25)
                        //.padding(.leading,-40)
                        
                        
                        HStack{
                            Image("recipe_home")
                                .resizable()
                                .frame(width: 28,height: 27)
                            
                            Text("내 냉장고 레시피")
                                .title2()
                            Spacer()
                        }
                        
                        ScrollView(.horizontal,showsIndicators : false){
                            HStack{
                                
                                ForEach(dataModel.ivtRecipes) { recipe in
                                    NavigationLink(destination: RecipeDetailView(recipe: recipe)){
                                        RecipeBox(recipe: recipe)
                                    }
                                    
                                }
                            }
                        }
                        
                       // Spacer(minLength: 40)
                    }.padding(.leading,20)
                    
                    Spacer(minLength: 150)
                }
             
            }.ignoresSafeArea()
            .onAppear{
                dataModel.fetch()
            }
            
        
    }
}


//struct MainRecipeView_Previews: PreviewProvider {
//    static var previews: some View {
////        RecipeBox(recipe: TestData.Recipes[0])
////        .previewLayout(.sizeThatFits)
//    }
//}
